/**
 * Created by hkodey.
 */

import {setVariable} from '../LookupTables/storedVariables';
import {findElementInTable} from '../LookupTables/elementLookupTable';
import {findRegEXInTable} from '../LookupTables/RegExLookupTable';

/**
 * Stores the value from an element or inputfield in a stored variable
 * @param  {String}   type          element or inputfield
 * @param  {String}   selectorKey   key for selector lookup table
 * @param {String}    variableName  Name to store variable as
 * @param  {Function} done          Function to execute when finished
 */
module.exports = (type, selectorKey, variableName, done) => {
  const selector = findElementInTable(selectorKey);

  const command = (type !== 'inputfield') ? 'getText' : 'getValue';

 // browser.waitForVisible(selector);
  const value = browser[command](selector);
  console.log("Value is: " + value);
  const reg = findRegEXInTable(selectorKey);

  if (reg) {
    const [, regvalue] = reg.exec(value);
    setVariable(variableName, regvalue);
  } else {
    setVariable(variableName, value);
  }

  done();
};
