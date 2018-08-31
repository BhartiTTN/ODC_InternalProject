/**
 * Created by hkodey.
 */


import {findElementInTable} from '../LookupTables/elementLookupTable';

/**
 * Created by harinikodey on 9/4/17.
 */

/**
 * Check if the given elements contains text
 * @param  {String}   selectorKey  Element selector
 * @param  {String}   expectedText  The text to check against
 * @param  {Function} done          Function to execute when finished
 */
module.exports = (selectorKey, expectedText, done) => {
  const element = findElementInTable(selectorKey);

  const arr = browser.getText(element);
  expect(arr).to.include(expectedText, `expectedText does not match: ${expectedText}`);

  done();
};
