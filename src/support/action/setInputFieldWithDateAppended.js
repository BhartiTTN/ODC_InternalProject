/**
 * Created by hkodey.
 */
import {findElementInTable} from '../LookupTables/elementLookupTable';

/**
 * Set the value of the given input field to a new value or add a value to the
 * current element value, append a date to the value to make it unique
 * @param  {String}   method  The method to use (add or set)
 * @param  {String}   value   The value to set the element to
 * @param  {String}   selectorKey key for selector lookup table
 * @param  {Function} done    Function to execute when finished
 */
module.exports = (method, value, selectorKey, done) => {

  const command = (method === 'add') ? 'addValue' : 'setValue';

  const selector = findElementInTable(selectorKey);

  browser.waitForClickable(selector);

  if (!value) {
    browser[command](selector, '');
  } else {

    const date = new Date().getTime();
    const [emailOrName, domain] = value.split('@');
    const updatedDomain = (domain == null) ? '' : `@${domain}`;

    const valueWithDate = `${emailOrName}+${date}${updatedDomain}`;
    browser[command](selector, valueWithDate);
  }

  done();
};

