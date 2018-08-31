/**
 * Updated by hkodey.
 */
import {findElementInTable} from '../LookupTables/elementLookupTable';

/**
 * Clear a given input field
 * @param  {String}   selectorKey Key for selector lookup table
 * @param  {Function} done    Function to execute when finished
 */
module.exports = (selectorKey, done) => {
  const selector = findElementInTable(selectorKey);

  browser.clearElement(selector);

  done();
};
