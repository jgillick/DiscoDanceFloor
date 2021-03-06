EESchema Schematic File Version 2
LIBS:DiscoDongle-rescue
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:DongleParts
LIBS:ftdi
LIBS:DiscoDongle-cache
EELAYER 25 0
EELAYER END
$Descr User 9843 6890
encoding utf-8
Sheet 1 1
Title "DiscoNode Communication Dongle"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L FT232RL U1
U 1 1 57468CE5
P 3550 1800
F 0 "U1" H 3100 250 60  0000 C CNN
F 1 "FT232RL" H 3400 2150 60  0000 C CNN
F 2 "Housings_SSOP:SSOP-28_5.3x10.2mm_Pitch0.65mm" H 3750 1750 60  0001 C CNN
F 3 "" H 3750 1750 60  0000 C CNN
	1    3550 1800
	1    0    0    -1  
$EndComp
$Comp
L USB_B P1
U 1 1 57468D47
P 1900 1950
F 0 "P1" V 2100 1850 50  0000 C CNN
F 1 "USB_B" H 1850 2150 50  0000 C CNN
F 2 "Connect:USB_B" V 1850 1850 50  0001 C CNN
F 3 "" V 1850 1850 50  0000 C CNN
	1    1900 1950
	0    -1   1    0   
$EndComp
$Comp
L +5V #PWR01
U 1 1 57468E3D
P 2800 1450
F 0 "#PWR01" H 2800 1300 50  0001 C CNN
F 1 "+5V" H 2800 1590 50  0000 C CNN
F 2 "" H 2800 1450 50  0000 C CNN
F 3 "" H 2800 1450 50  0000 C CNN
	1    2800 1450
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 5746911C
P 2800 2750
F 0 "C4" H 2825 2850 50  0000 L CNN
F 1 "100nF" H 2825 2650 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 2838 2600 50  0001 C CNN
F 3 "" H 2800 2750 50  0000 C CNN
	1    2800 2750
	1    0    0    -1  
$EndComp
$Comp
L ISL81487E U2
U 1 1 57469336
P 5800 2600
F 0 "U2" H 5850 2400 60  0000 C CNN
F 1 "ISL81487E" H 5900 3250 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 5800 2600 60  0001 C CNN
F 3 "" H 5800 2600 60  0000 C CNN
	1    5800 2600
	1    0    0    -1  
$EndComp
$Comp
L RJ45 J1
U 1 1 574693F2
P 7350 2050
F 0 "J1" H 7550 2550 50  0000 C CNN
F 1 "RJ45" H 7200 2550 50  0000 C CNN
F 2 "Connect:RJ45_8" H 7350 2050 50  0001 C CNN
F 3 "" H 7350 2050 50  0000 C CNN
	1    7350 2050
	0    1    -1   0   
$EndComp
$Comp
L R R5
U 1 1 574695A2
P 5200 2900
F 0 "R5" V 5280 2900 50  0000 C CNN
F 1 "20k" V 5200 2900 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 5130 2900 50  0001 C CNN
F 3 "" H 5200 2900 50  0000 C CNN
	1    5200 2900
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR02
U 1 1 5746A496
P 5650 1150
F 0 "#PWR02" H 5650 1000 50  0001 C CNN
F 1 "+5V" H 5650 1290 50  0000 C CNN
F 2 "" H 5650 1150 50  0000 C CNN
F 3 "" H 5650 1150 50  0000 C CNN
	1    5650 1150
	1    0    0    -1  
$EndComp
$Comp
L LED D1
U 1 1 5746A4EF
P 2900 4350
F 0 "D1" H 2900 4450 50  0000 C CNN
F 1 "TX" H 2900 4250 50  0000 C CNN
F 2 "LEDs:LED_0805" H 2900 4350 50  0001 C CNN
F 3 "" H 2900 4350 50  0000 C CNN
	1    2900 4350
	1    0    0    -1  
$EndComp
$Comp
L LED D2
U 1 1 5746A53E
P 2900 4700
F 0 "D2" H 2900 4800 50  0000 C CNN
F 1 "RX" H 2900 4600 50  0000 C CNN
F 2 "LEDs:LED_0805" H 2900 4700 50  0001 C CNN
F 3 "" H 2900 4700 50  0000 C CNN
	1    2900 4700
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5746A6E4
P 3350 4350
F 0 "R1" V 3430 4350 50  0000 C CNN
F 1 "200" V 3350 4350 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 3280 4350 50  0001 C CNN
F 3 "" H 3350 4350 50  0000 C CNN
	1    3350 4350
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 5746A771
P 3350 4700
F 0 "R2" V 3430 4700 50  0000 C CNN
F 1 "200" V 3350 4700 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 3280 4700 50  0001 C CNN
F 3 "" H 3350 4700 50  0000 C CNN
	1    3350 4700
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR03
U 1 1 5746ACA4
P 3500 4150
F 0 "#PWR03" H 3500 4000 50  0001 C CNN
F 1 "+5V" H 3500 4290 50  0000 C CNN
F 2 "" H 3500 4150 50  0000 C CNN
F 3 "" H 3500 4150 50  0000 C CNN
	1    3500 4150
	1    0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 5746B006
P 6400 2600
F 0 "R7" V 6480 2600 50  0000 C CNN
F 1 "120" V 6400 2600 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 6330 2600 50  0001 C CNN
F 3 "" H 6400 2600 50  0000 C CNN
	1    6400 2600
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR04
U 1 1 5746B3A8
P 4450 1100
F 0 "#PWR04" H 4450 950 50  0001 C CNN
F 1 "+5V" H 4450 1240 50  0000 C CNN
F 2 "" H 4450 1100 50  0000 C CNN
F 3 "" H 4450 1100 50  0000 C CNN
	1    4450 1100
	1    0    0    -1  
$EndComp
Text GLabel 4500 2450 2    39   Input ~ 0
TXLED
Text GLabel 4500 2550 2    39   Input ~ 0
RXLED
Text GLabel 2550 4350 0    39   Input ~ 0
TXLED
Text GLabel 2550 4700 0    39   Input ~ 0
RXLED
Text GLabel 4700 1850 2    39   Input ~ 0
Daisy
Text GLabel 4700 2150 2    39   Input ~ 0
Signal
Text GLabel 6600 2200 0    39   Input ~ 0
Daisy
Text GLabel 6600 2100 0    39   Input ~ 0
Signal
$Comp
L C C5
U 1 1 5746C982
P 5850 1450
F 0 "C5" H 5875 1550 50  0000 L CNN
F 1 "100nF" H 5875 1350 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 5888 1300 50  0001 C CNN
F 3 "" H 5850 1450 50  0000 C CNN
	1    5850 1450
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 5746D054
P 2550 2050
F 0 "C3" V 2500 2100 50  0000 L CNN
F 1 "10nF" V 2700 1950 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 2588 1900 50  0001 C CNN
F 3 "" H 2550 2050 50  0000 C CNN
	1    2550 2050
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR05
U 1 1 5746D453
P 1400 3450
F 0 "#PWR05" H 1400 3300 50  0001 C CNN
F 1 "+5V" H 1400 3590 50  0000 C CNN
F 2 "" H 1400 3450 50  0000 C CNN
F 3 "" H 1400 3450 50  0000 C CNN
	1    1400 3450
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 5746D4DF
P 1200 3750
F 0 "C1" H 1225 3850 50  0000 L CNN
F 1 "100nF" H 1225 3650 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 1238 3600 50  0001 C CNN
F 3 "" H 1200 3750 50  0000 C CNN
	1    1200 3750
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 5746D51B
P 1600 3750
F 0 "C2" H 1625 3850 50  0000 L CNN
F 1 "4.7uF" H 1625 3650 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 1638 3600 50  0001 C CNN
F 3 "" H 1600 3750 50  0000 C CNN
	1    1600 3750
	1    0    0    -1  
$EndComp
NoConn ~ 4350 2350
NoConn ~ 4350 2850
NoConn ~ 3000 2400
NoConn ~ 3000 2300
NoConn ~ 3000 2200
NoConn ~ 7700 1500
$Comp
L R R8
U 1 1 5747F3E8
P 4600 1350
F 0 "R8" V 4700 1350 50  0000 C CNN
F 1 "20k" V 4600 1350 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 4530 1350 50  0001 C CNN
F 3 "" H 4600 1350 50  0000 C CNN
	1    4600 1350
	1    0    0    -1  
$EndComp
Text GLabel 4250 4300 0    60   Input ~ 0
Daisy
$Comp
L LED D3
U 1 1 5748F519
P 4500 4300
F 0 "D3" H 4500 4400 50  0000 C CNN
F 1 "Daisy" H 4500 4200 50  0000 C CNN
F 2 "LEDs:LED_0805" H 4500 4300 50  0001 C CNN
F 3 "" H 4500 4300 50  0000 C CNN
	1    4500 4300
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 5748F6BB
P 4900 4300
F 0 "R3" V 4980 4300 50  0000 C CNN
F 1 "200" V 4900 4300 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 4830 4300 50  0001 C CNN
F 3 "" H 4900 4300 50  0000 C CNN
	1    4900 4300
	0    1    1    0   
$EndComp
$Comp
L GND #PWR06
U 1 1 5748FDFC
P 1400 4250
F 0 "#PWR06" H 1400 4000 50  0001 C CNN
F 1 "GND" H 1400 4100 50  0000 C CNN
F 2 "" H 1400 4250 50  0000 C CNN
F 3 "" H 1400 4250 50  0000 C CNN
	1    1400 4250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 5748FFF1
P 2800 3000
F 0 "#PWR07" H 2800 2750 50  0001 C CNN
F 1 "GND" H 2800 2850 50  0000 C CNN
F 2 "" H 2800 3000 50  0000 C CNN
F 3 "" H 2800 3000 50  0000 C CNN
	1    2800 3000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 57490056
P 2250 2200
F 0 "#PWR08" H 2250 1950 50  0001 C CNN
F 1 "GND" H 2250 2050 50  0000 C CNN
F 2 "" H 2250 2200 50  0000 C CNN
F 3 "" H 2250 2200 50  0000 C CNN
	1    2250 2200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 574900BB
P 1800 2350
F 0 "#PWR09" H 1800 2100 50  0001 C CNN
F 1 "GND" H 1800 2200 50  0000 C CNN
F 2 "" H 1800 2350 50  0000 C CNN
F 3 "" H 1800 2350 50  0000 C CNN
	1    1800 2350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 57490134
P 3550 3400
F 0 "#PWR010" H 3550 3150 50  0001 C CNN
F 1 "GND" H 3550 3250 50  0000 C CNN
F 2 "" H 3550 3400 50  0000 C CNN
F 3 "" H 3550 3400 50  0000 C CNN
	1    3550 3400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR011
U 1 1 5749029E
P 5200 3150
F 0 "#PWR011" H 5200 2900 50  0001 C CNN
F 1 "GND" H 5200 3000 50  0000 C CNN
F 2 "" H 5200 3150 50  0000 C CNN
F 3 "" H 5200 3150 50  0000 C CNN
	1    5200 3150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 57490303
P 5650 2950
F 0 "#PWR012" H 5650 2700 50  0001 C CNN
F 1 "GND" H 5650 2800 50  0000 C CNN
F 2 "" H 5650 2950 50  0000 C CNN
F 3 "" H 5650 2950 50  0000 C CNN
	1    5650 2950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR013
U 1 1 57490430
P 5850 1650
F 0 "#PWR013" H 5850 1400 50  0001 C CNN
F 1 "GND" H 5850 1500 50  0000 C CNN
F 2 "" H 5850 1650 50  0000 C CNN
F 3 "" H 5850 1650 50  0000 C CNN
	1    5850 1650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 5749091D
P 6800 2950
F 0 "#PWR014" H 6800 2700 50  0001 C CNN
F 1 "GND" H 6800 2800 50  0000 C CNN
F 2 "" H 6800 2950 50  0000 C CNN
F 3 "" H 6800 2950 50  0000 C CNN
	1    6800 2950
	1    0    0    -1  
$EndComp
Text GLabel 4250 4750 0    60   Input ~ 0
Signal
$Comp
L LED D4
U 1 1 57490E65
P 4500 4750
F 0 "D4" H 4500 4850 50  0000 C CNN
F 1 "Signal" H 4500 4650 50  0000 C CNN
F 2 "LEDs:LED_0805" H 4500 4750 50  0001 C CNN
F 3 "" H 4500 4750 50  0000 C CNN
	1    4500 4750
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 57490EAE
P 4900 4750
F 0 "R4" V 4980 4750 50  0000 C CNN
F 1 "200" V 4900 4750 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 4830 4750 50  0001 C CNN
F 3 "" H 4900 4750 50  0000 C CNN
	1    4900 4750
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR015
U 1 1 57490EF7
P 5100 4650
F 0 "#PWR015" H 5100 4500 50  0001 C CNN
F 1 "+5V" H 5100 4790 50  0000 C CNN
F 2 "" H 5100 4650 50  0000 C CNN
F 3 "" H 5100 4650 50  0000 C CNN
	1    5100 4650
	1    0    0    -1  
$EndComp
NoConn ~ 4350 2050
$Comp
L R R6
U 1 1 5765F021
P 4450 1350
F 0 "R6" V 4350 1350 50  0000 C CNN
F 1 "20k" V 4450 1350 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 4380 1350 50  0001 C CNN
F 3 "" H 4450 1350 50  0000 C CNN
	1    4450 1350
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR016
U 1 1 576751A3
P 5100 4200
F 0 "#PWR016" H 5100 4050 50  0001 C CNN
F 1 "+5V" H 5100 4340 50  0000 C CNN
F 2 "" H 5100 4200 50  0000 C CNN
F 3 "" H 5100 4200 50  0000 C CNN
	1    5100 4200
	1    0    0    -1  
$EndComp
NoConn ~ 4350 2750
NoConn ~ 6900 1700
NoConn ~ 6900 1800
NoConn ~ 4350 1950
NoConn ~ 4350 2250
Wire Wire Line
	1800 2250 1800 2350
Wire Wire Line
	2800 1450 2800 2050
Wire Wire Line
	2800 1650 3000 1650
Wire Wire Line
	2200 1750 3000 1750
Connection ~ 2800 1650
Wire Wire Line
	2200 1850 3000 1850
Connection ~ 2800 1750
Wire Wire Line
	3000 1950 2200 1950
Wire Wire Line
	3000 2500 2800 2500
Wire Wire Line
	2800 2500 2800 2600
Wire Wire Line
	2800 2900 2800 3000
Wire Wire Line
	5200 2300 5200 2750
Wire Wire Line
	5200 2400 5250 2400
Wire Wire Line
	5650 1150 5650 1800
Wire Wire Line
	3100 4350 3200 4350
Wire Wire Line
	3100 4700 3200 4700
Wire Wire Line
	3500 4150 3500 4700
Connection ~ 3500 4350
Wire Wire Line
	6100 2400 6900 2400
Wire Wire Line
	6100 2300 6900 2300
Wire Wire Line
	6250 2600 6250 2400
Connection ~ 6250 2400
Wire Wire Line
	6550 2600 6550 2300
Connection ~ 6550 2300
Wire Wire Line
	4350 2450 4500 2450
Wire Wire Line
	4350 2550 4500 2550
Wire Wire Line
	2550 4700 2700 4700
Wire Wire Line
	2550 4350 2700 4350
Wire Wire Line
	5850 1300 5650 1300
Connection ~ 5650 1300
Wire Wire Line
	2800 2050 2700 2050
Wire Wire Line
	1200 3600 1200 3450
Wire Wire Line
	1200 3450 1600 3450
Wire Wire Line
	1600 3450 1600 3600
Connection ~ 1400 3450
Wire Wire Line
	1200 3900 1200 4100
Wire Wire Line
	1200 4100 1600 4100
Wire Wire Line
	1600 4100 1600 3900
Wire Wire Line
	1400 4250 1400 4100
Connection ~ 1400 4100
Wire Wire Line
	5200 3150 5200 3050
Wire Wire Line
	5850 1600 5850 1650
Wire Wire Line
	4250 4300 4300 4300
Wire Wire Line
	4700 4300 4750 4300
Wire Wire Line
	5050 4750 5100 4750
Wire Wire Line
	5100 4750 5100 4650
Wire Wire Line
	4750 4750 4700 4750
Wire Wire Line
	4250 4750 4300 4750
Wire Wire Line
	5650 2850 5650 2950
Wire Wire Line
	3350 3250 3350 3350
Wire Wire Line
	3350 3350 3750 3350
Wire Wire Line
	3550 3250 3550 3400
Wire Wire Line
	3450 3250 3450 3350
Connection ~ 3450 3350
Connection ~ 3550 3350
Wire Wire Line
	3650 3350 3650 3250
Wire Wire Line
	3750 3350 3750 3250
Connection ~ 3650 3350
Wire Wire Line
	2200 2050 2400 2050
Wire Wire Line
	2250 2050 2250 2200
Connection ~ 2250 2050
Wire Wire Line
	5100 4200 5100 4300
Wire Wire Line
	5100 4300 5050 4300
Wire Wire Line
	5250 2300 5200 2300
Connection ~ 5200 2400
Wire Wire Line
	4450 1200 4450 1100
Wire Wire Line
	4600 1200 4450 1200
Wire Wire Line
	4350 2150 4700 2150
Wire Wire Line
	4350 1850 4700 1850
Wire Wire Line
	5200 2650 4350 2650
Connection ~ 5200 2650
Wire Wire Line
	5250 2500 5050 2500
Wire Wire Line
	5050 2500 5050 1650
Wire Wire Line
	5050 1650 4350 1650
Wire Wire Line
	4350 1750 5250 1750
Wire Wire Line
	5250 1750 5250 2200
Wire Wire Line
	6900 1900 6800 1900
Wire Wire Line
	6800 1900 6800 2950
Wire Wire Line
	6900 2000 6800 2000
Connection ~ 6800 2000
Wire Wire Line
	4600 1500 4600 1850
Connection ~ 4600 1850
Wire Wire Line
	4450 1500 4450 2150
Connection ~ 4450 2150
Wire Wire Line
	6600 2100 6900 2100
Wire Wire Line
	6900 2200 6600 2200
$EndSCHEMATC
