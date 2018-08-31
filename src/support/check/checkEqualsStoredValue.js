/**
 * Created by hkodey.
 */

import {findElementInTable} from '../LookupTables/elementLookupTable';
import {getVariable} from '../LookupTables/storedVariables';


/**
 *  Compares element or inputfield to a stored variable
 *  @param {String}   type         inputfield or element
 * @param  {String}   selectorKey  key for selector lookup table
 * @param  {String}   falseCase Whether to check if the element exists or not
 * @param  {String}   storedValue Name of the stored value to compare against
 * @param  {Function} done      Function to execute when finished
 */
module.exports = (type, selectorKey, falseCase, storedValue, done) => {
  const storedText = getVariable(storedValue);

  const selector = findElementInTable(selectorKey);

  const command = (type !== 'inputfield') ? 'getText' : 'getValue';

  browser.waitForVisible(selector);

  const ElementsSearched = browser[command](selector);


  const FoundElement = (Array.isArray(ElementsSearched)) ? ElementsSearched.some(elTxt => elTxt === storedText) : (ElementsSearched === storedText);

  if (falseCase) {
    expect(FoundElement).not.to.equal(true, `Expected ${selectorKey} to not equal the text "${storedText}"`);
  } else {
    expect(FoundElement).to.equal(true, `Expected ${selectorKey} to equal the text "${storedText}", instead equaled "${ElementsSearched}"`);
  }


  done();

};
