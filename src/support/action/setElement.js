import {findElementInTable} from '../LookupTables/elementLookupTable';

/**
 * Set the value of the given input field to a new value or add a value to the
 * current element value
 * @param  {String}   method  The method to use (add or set)
 * @param  {String}   value   The value to set the element to
 * @param  {String}   selectorKey key used in the selector lookup table
 * @param  {Function} done    Function to execute when finished
 */
module.exports = (method, value, selectorKey, done) => {
  /**
   * The command to perform on the browser object (addValue or setValue)
   * @type {String}
   */
  const command = (method === 'add') ? 'addValue' : 'setValue';

  const selector = findElementInTable(selectorKey);

  browser.waitForClickable(selector);

  browser[command](selector, value || '');

  done();
};
