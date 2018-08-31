/**
 * Created by hkodey.
 */

// TODO: Combine this with storeText

import storedVariables from '../LookupTables/storedVariables';

/**
 *
 * @param  {String}   type          Type of element (inputfield or element)
 * @param  {String}   element       Element selector
 * @param  {String}   expectedText  The text to check against
 * @param  {Function} done          Function to execute when finished
 */
module.exports = (type, element, expectedText, done) => {

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
  storedVariables.setVariable('perfCountUpdated', parseInt(text,10));

  done();


};
