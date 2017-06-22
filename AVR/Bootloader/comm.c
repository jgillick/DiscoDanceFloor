
#include <avr/eeprom.h>
#include <avr/io.h>
#include <util/crc16.h>

#include "config.h"
#include "shared.h"
#include "comm.h"
#include "status.h"

////////////////////////////////////////////
/// Macros
////////////////////////////////////////////

#define SOM_BYTE 0xFF

#define UART_BAUD_SELECT(baudRate)  (((F_CPU) + 8UL * (baudRate)) / (16UL * (baudRate)) -1UL)

////////////////////////////////////////////
/// Globals Variables
////////////////////////////////////////////

uint8_t pageData[SPM_PAGESIZE];

////////////////////////////////////////////
/// Local Variables
////////////////////////////////////////////

uint8_t readyForPages = 0;

uint8_t msgType = 0;
uint8_t msgLen = 0;

uint8_t upcomingPage = 0;
uint8_t nextPageNumber;

uint16_t msgCRC;


////////////////////////////////////////////
/// Local Prototypes
////////////////////////////////////////////


static void error();
static void reset();
static uint8_t readAndParse();
static uint8_t processMessage();


////////////////////////////////////////////
/// Methods
////////////////////////////////////////////

// Receive the next byte of data
static inline uint8_t commReceive() {
  while (!(UCSR0A & (1<<RXC0))); // wait for data
  return UDR0;
}

// Receive the next byte and calculate CRC
static inline uint8_t commReceiveWithCRC() {
  uint8_t b = commReceive();
  msgCRC = _crc16_update(msgCRC, b);
  return b;
}

// Inform master an error occurred while reading the message
static void error() {
  if (readyForPages) {
    statusError();
    signalEnable();
    upcomingPage = 0;
  }
}

// Reset the message
static void reset() {
  msgCRC = ~0;
  msgLen = 0;
}

// Setup the communication channel (by default using the UART and a RS485 transciever)
void commSetup() {
  PORTD |= (1 << PD0); // Enable pull-up on RX pin

  UCSR0B = (1<<RXEN0); // Enable RX
  UCSR0C = 1<<UCSZ01 | 1<<UCSZ00; // Frame format (8-bit, 1 stop bit)

  // Set baud
  UBRR0L =  (unsigned char)UART_BAUD_SELECT(SERIAL_BAUD);
  UBRR0H =  (unsigned char)(UART_BAUD_SELECT(SERIAL_BAUD) << 8);
}


// Watch the serial line for the next message
uint8_t watchSerial(uint8_t pagesRead) {
  uint8_t status = STATUS_NONE;

  nextPageNumber = pagesRead;
  reset();

  while (1) {
    status = readAndParse();
    if (status != STATUS_NONE) {
      break;
    }
  }
  return status;
}

// Read from the serial line and parse the bytes as they come in
static uint8_t readAndParse() {
  uint8_t b = commReceive();

  // Start of message
  if (b == SOM_BYTE && commReceive() == SOM_BYTE) {

    // Header
    commReceiveWithCRC(); // flags (ignored)
    commReceiveWithCRC(); // addr (ignored)
    msgType = commReceiveWithCRC();
    commReceiveWithCRC(); // len per section (ignored)
    msgLen = commReceiveWithCRC();

    // Data
    uint8_t dataReceived = 0;
    while (dataReceived < msgLen) {
      pageData[dataReceived++] = commReceiveWithCRC();
    }

    // CRC Validation
    uint8_t crc1 = commReceive();
    uint8_t crc2 = commReceive();
    uint16_t fullCrc = (crc1 << 8 ) | (crc2 & 0xff);
    if (fullCrc != msgCRC){
      error();
      reset();
      return STATUS_NONE;
    }

    // Message received
    return processMessage();
  }
  else {
    error();
    reset();
  }

  return STATUS_NONE;
}

// Do something with the received message
static uint8_t processMessage() {

  // Let master node know we're ready by disabling signal
  if (msgType == MSG_CMD_PROG_START) {
    signalDisable();

    // Check version number
#if USE_VERSIONING == 1
    uint8_t vmaj = eeprom_read_byte(VERSION_MAJOR);
    uint8_t vmin = eeprom_read_byte(VERSION_MAJOR);
    if ((vmaj == 0xFF || pageData[0] == vmaj)
        && (vmin == 0xFF || pageData[1] == vmin) ) {
      readyForPages = 1;
    }
#else
    readyForPages = 1;
#endif

  }

  // We're done programming
  else if (msgType == MSG_CMD_PROG_END) {
    readyForPages = 0;
    reset();
    return STATUS_DONE;
  }

  else if (readyForPages == 1) {

    // Set upcoming page number
    if (msgType == MSG_CMD_PAGE_NUM) {
      upcomingPage = pageData[0];
    }

    // Load the next page
    else if (msgType == MSG_CMD_PAGE_DATA) {

      // Length and page size do not match up
      // or this is not the page we were expecting
      if (msgLen > SPM_PAGESIZE || upcomingPage != nextPageNumber) {
        error();
      }
      // Valid page
      else {

        // Fill in rest of data with 0xFF
        while (msgLen < SPM_PAGESIZE) {
					pageData[msgLen++] = 0xFF;
        }

        signalDisable();
        reset();
        return STATUS_PAGE_READY;
      }
    }
  }

  reset();
  return STATUS_NONE;
}
