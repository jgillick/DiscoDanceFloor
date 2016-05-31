'use strict';

var floorCellList,
    countdown,
    startColor;

const ANIMATION_TIME = 1000;

module.exports = {
  info: {
    name: 'Primaries',
    description: 'Fades in primary colors, chasing from one cell to the next',
    interactive: false,
    lightShow: true,
    miniumumTime: 1
  },

  /**
   * Start the program
   */
  start: function(cellList) {
    floorCellList = cellList;
    startColor = 0;
    countdown = 0;
    return floorCellList.fadeToColor([0,0,0], ANIMATION_TIME);
  },
  
  /**
   * Shutdown the program
   */
  shutdown: function() {
    return Promise.resolve();
  },

  /**
   * Floor run loop
   */
  loop: function(time) {
    countdown -= time;

    if (countdown > 0) {
      return;
    }

    let colorIndex = startColor,
        dimensions = floorCellList.dimensions;

    for (let y = 0; y < dimensions.y; y++) {
      for (let x = 0; x < dimensions.x; x++) {
        let color = [0, 0, 0],
            cell = floorCellList.at(x, y);
        
        if (!cell) continue;

        color[colorIndex] = 255;
        cell.fadeToColor(color, ANIMATION_TIME);

        if (++colorIndex > 2) {
          colorIndex = 0;
        }
      }
    }

    if (++startColor > 2) {
      startColor = 0;
    }
    countdown = ANIMATION_TIME + countdown;
  }
};

// var Promise = require("bluebird"),
//     discoUtils = require('../lib/utils.js');

// var floorController = null,
//     running = true,
//     colorSelect = [],
//     globalSelect = 0,
//     offsState = 0,
//     fadeDuration = 500,
//     timeout, modeTimeout,
//     mode = 'running';

// module.exports = {

//   info: {
//     name: 'Primaries',
//     description: 'Fades in primary colors, chasing from one cell to the next',
//     interactive: false,
//     lightShow: true,
//     miniumumTime: 1
//   },

//   /**
//     Setup the program
//   */
//   init: function(controller){
//     running = true;
//     floorController = controller;
//     return Promise.resolve();
//   },

//   /**
//     Shutdown this program and clear memory
//   */
//   shutdown: function(){
//     running = false;
//     clearTimeout(timeout);
//     return floorController.changeAllCells([0,0,0], 500);
//   },

//   /**
//     Run the program
//   */
//   run: function(){
//     if (!running) return;

//     modeTimeout = setInterval(function(){
//       switch(mode) {
//         case 'running':
//           mode = 'offs';
//           break;
//         case 'offs':
//           mode = 'all';
//           break;
//         case 'all':
//           mode = 'running';
//           break;
//       }
//     }, 6000);

//     program();
//   }

// };

// function program() {
//   var dimensions = floorController.getDimensions(),
//       i = 0, last = 0,
//       rgb, color, cell;

//   offsState = (offsState) ? 0 : 1;
//   globalSelect = discoUtils.wrap(globalSelect + 1, 0, 2);

//   for (var y = 0; y < dimensions.y; y++) {
//     for (var x = 0; x < dimensions.x; x++) {
//       try {
//         color = [0,0,0];
//         rgb = colorSelect[i] || last;
//         cell = floorController.getCell(x, y);

//         if (!cell) continue;
//         if (mode == 'running') {
//           rgb = discoUtils.wrap(rgb + 1, 0, 2);
//           last = rgb;
//           colorSelect[i] = rgb;

//           color[rgb] = 255;
//         }
//         else if (mode == 'offs' && offsState){
//           color[rgb] = 255;
//         }
//         else if (mode == 'all') {
//           color[globalSelect] = 255;
//         }

//         cell.fadeToColor(color, fadeDuration);

//       } catch(e) {
//         console.error(e);
//         // console.error(e.stack);
//       }
//       i++;
//     }
//   }

//   floorController.updateFadeFrame();
//   timeout = setTimeout(program, fadeDuration * 1.5);
// }