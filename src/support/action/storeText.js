/**
 * Created by hkodey.
 */

import storedVariables from '../LookupTables/storedVariables';

/**
 * // TODO: Rename step method to accurately describe what it does, and add description here
 * @param  {String}  type          Type of element (inputfield or element)
 * @param  {String}   element       Element selector
 * @param  {Function} done          Function to execute when finished
 */
module.exports = (type, element, expectedText,done) => {

  const command = (type !== 'inputfield') ? 'getText' : 'getValue';

  const arr = browser[command](element);
  let text='0';

  if (typeof arr != undefined && arr != null && arr.length > 0) {
    for (let i = 0; i < arr.length; i++) {
      if (arr[i] === expectedText) {
        text = arr[i + 1];
        break;
      }
    }
  }
  storedVariables.setVariable('perfCount', parseInt(text,10));

  done();
};
