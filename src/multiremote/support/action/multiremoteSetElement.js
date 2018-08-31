/**
 * Created by adamShanahan on 6/5/18.
 */
import {findElementInTable} from '../../../support/LookupTables/elementLookupTable';

/**
 * Sets or adds a value to a given input field for a particular multiremote browser.
 * Set the value of the given input field to a new value or add a value to the
 * current element value.
 * @param  {String}   clientName name of the multiremote browser to use. Examples: browserA, browserB
 * @param  {String}   method  The method to use (add or set)
 * @param  {String}   value   The value to set the element to
 * @param  {String}   selectorKey key used in the selector lookup table
 * @param  {Function} done    Function to execute when finished
 */
module.exports = (clientName, method, value, selectorKey, done) => {
  const client = browser.select(clientName);
  const command = (method === 'add') ? 'addValue' : 'setValue';

  const selector = findElementInTable(selectorKey);

  client.waitForVisible(selector);

  client[command](selector, value || '');

  done();
};
