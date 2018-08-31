/**
 * Created by adamShanahan on 5/17/18.
 */
import clickElement from '../../../action/clickElement';
import colorHexValues from '../../../objects/colorHexValues';
import scrollAndClick from '../../../action/scroll';
import setInput from '../../../action/setInput';

/**
 * Opens a color picker and sets it to a color located in the colorRBGAValues table
 * @param colorPickerType  {String} Name of the color picker to change. Possible Values: (CTA Header, Line2, Line 3)
 * @param color {String}                  Color to set the picker to. (Green, Black, etc)
 * @param done {Function}                 Function to execute when finished
 */
export default function setColorPicker(colorPickerType, color, done) {
  const hex = colorHexValues[color];

  if (!hex) {
    assert.fail(-1, -1, `No hex values are known for ${color}`);
  }
  setColorPickerWithHex(colorPickerType, hex, done);
}

/**
 * Opens a color picker and sets it to a certain RGB value
 * @param colorPickerType  {String} Name of the color picker to change. Possible Values: (CTA Header, Line2, Line 3)
 * @param hexValue {String}         Hex Value to set picker to
 * @param done {Function}           Function to execute when finished
 */
function setColorPickerWithHex(colorPickerType, hexValue, done) {
  openColorPicker(colorPickerType, () => {
    updateColorPicker(hexValue, () => {
      exitColorPicker(colorPickerType, done);
    });
  });
}

function openColorPicker(colorPickerType, callback) {
  scrollAndClick(`${colorPickerType} Color Icon`, callback);
}

function updateColorPicker(hexValue, callback) {
  setInput('set', hexValue, 'RGBA red input', callback);
}

function exitColorPicker(colorPicker, callback) {
  clickElement('click', `Close ${colorPicker} Color Picker`, callback);
}
