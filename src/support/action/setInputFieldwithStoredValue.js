/**
 * Created by hkodey.
 */
import {findElementInTable} from '../LookupTables/elementLookupTable';
import {getVariable} from '../LookupTables/storedVariables';

/**
 * Set the value of the given input field to a new value or add a value to the
 * current element value
 * @param  {String}   method  The method to use (add or set)
 * @param {String}    storedVariableName Name of stored variable to set value to
 * @param  {String}   knownElement Element selector
 * @param  {Function} done    Function to execute when finished
 */
module.exports = (method, storedVariableName, knownElement, done) => {

  const storedVariable = getVariable(storedVariableName);

  const command = (method === 'add') ? 'addValue' : 'setValue';

  const element = findElementInTable(knownElement);


  browser.waitForVisible(element);

  browser[command](element, storedVariable);

  done();
};
