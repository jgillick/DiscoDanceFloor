/**
 * Builds a visual representation of the dance floor which scales with the page.
 */

import { 
  Component, 
  ElementRef, 
  OnInit,
  AfterViewInit,
  OnDestroy
} from '@angular/core';

import { FloorCell, IFloorCellChange } from '../../../shared/floor-cell';
import { StorageService } from '../services/storage.service';
import { FloorBuilderService } from '../services/floor-builder.service';
import { CommunicationService } from '../services/communication.service';
import { ProgramControllerService } from '../services/program-controller.service';
import { ProgramControllerComponent } from './program-controller';

@Component({
  selector: 'disco-floor',
  templateUrl: './html/disco-floor.html',
  styleUrls: ['./styles/floor.css'],
  directives: [ ProgramControllerComponent ],
})
export class DiscoFloorComponent implements OnInit, AfterViewInit {

  /**
   * The height/width CSS value for each floor cell
   */
  cellSize: string|number = "100%";

  /**
   * The x length of the floor
   */
  x:number = 0;

  /**
   * The y length of the floor
   */
  y:number = 0;

  /**
   * Is the floor preview enabled
   */
  previewEnabled:boolean = true;


  constructor(
    public comm:CommunicationService,
    private _element:ElementRef,
    private _store:StorageService,
    private _builder:FloorBuilderService,
    private _program:ProgramControllerService ) {
  }

  /**
   * Load floor
   */
  ngOnInit() {
    let settings = this._store.getItem('settings');

    if (settings && settings.dimensions) {
      this.x = settings.dimensions.x || 8;
      this.y = settings.dimensions.y || 8;
      this.cellSize = null;
    }

    this.previewEnabled = (settings.disablePreview !== true);
    if (this.previewEnabled) {
      this.buildFloor();
    }
  }

  /**
   * Once the view has been initialized.
   */
  ngAfterViewInit() {
    setTimeout(this.sizeFloor.bind(this), 10);
  }

  /**
   * Build the table for the floor.
   * For some reason this is slow in angular on the raspberry pi, so we do it here, manually.
   */
  buildFloor() {
    let table,
        tableCells = [],
        container = $(this._element.nativeElement).find('.floor-area');

    // Build Y/X axis for table
    for (let cell of this._builder.cellList) {
      let y = cell.y,
          x = cell.x;

      tableCells[y] = tableCells[y] || [];
      tableCells[y][x] = cell;
    }

    // Build markup
    table = document.createElement('table');
    for (let row of tableCells) {
      let tableRow = document.createElement('tr');

      row.forEach( (cell:FloorCell) => {
        let tableCell = document.createElement('td'),
            $tableCell = $(tableCell);

        tableCell.id = `floor-cell-${cell.index}`;

        // Click handler
        $(tableCell).click(() => {
          this.toggleSensorValue(cell)
        });

        // Observe changes
        cell.change$.subscribe( (change:IFloorCellChange) => {
          if (change.type == 'color') {
            let colorValues = change.value.map( c => Math.round(c) );
            $tableCell.css('backgroundColor', `rgb(${ colorValues })`)
          }
          else if (change.type === 'sensor') {
            $tableCell.toggleClass('touched', change.value);
          }
        });

        tableRow.appendChild(tableCell);
      });

      table.appendChild(tableRow);
    }

    // Add markup
    container.empty();
    container.append(table);
  }

  /**
   * Set the size of the floor to fit the window while maintain the aspect ratio
   * so all cells are square
   */
  sizeFloor() {
    if (!this.previewEnabled) {
      return;
    }
    
    let component = $(this._element.nativeElement),
        container = component.find('.floor-area'),
        width = container.width(),
        height = container.height(),
        ratio = this.x / this.y,
        size;

    if (!width || !height) {
      return;
    }

    // Set based on width
    if (width > ratio * height) {
      size = ratio * height;
      size = (size > height) ? height : size;
      this.cellSize = Math.floor(size / this.x);
    }
    // Set based on height
    else if (height > width / ratio) {
      size = width / ratio;
      size = (size > width) ? width : size;
      this.cellSize = Math.floor(size / this.y);
    }

    // Update all cells
    component.find('td').css({
      height: this.cellSize,
      width: this.cellSize
    });
  }

  /**
   * Toggle the touch sensor value for a cell
   */
  toggleSensorValue(floorCell: FloorCell): void {
    floorCell.sensorValue = !floorCell.sensorValue; 
  }

  /**
   * Retrn the name of the currently running program, or 'none'
   */
  getRunningProgram(): String {
    if (this._program.runningProgram) {
      return this._program.runningProgram.info.name;
    }
    return 'none';
  }
}