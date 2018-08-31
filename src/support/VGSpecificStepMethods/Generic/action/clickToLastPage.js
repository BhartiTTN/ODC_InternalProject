/**
 * Created by hkodey on 01/22/18...
 */

import elementLookupTable from '../../../LookupTables/elementLookupTable';
import RegExLookupTable from '../../../LookupTables/RegExLookupTable';

/**
 * Check if the given elements text is the same as the given text
 * @param  {String}   type          element or inputfield
 * @param  {String}   selectorKey   key for selector lookup table
 * @param {String}    TargetText    Total Rows Number
 * @param  {Function} done          Function to execute when finished
 */

module.exports = (type, selectorKey, TargetText, done) => {


  const element1 = elementLookupTable.findElementInTable(TargetText);
  const command = (type !== 'inputfield') ? 'getText' : 'getValue';
  const value = browser[command](element1);
  const reg = RegExLookupTable.findRegEXInTable(TargetText);
  let count = 0;

  if (reg) {
    const [, regvalue] = reg.exec(value);
    count = Math.floor(regvalue/10);
  }

  const element = elementLookupTable.findElementInTable(selectorKey);
  const method = 'click';
  browser.waitForClickable(element);

  for (let i = 0; i<count; i++)  {
    browser.waitForClickable(element);
    browser[method](element);

    const waitForLoadingKey = getElementFromRegex(selectorKey);
    if (waitForLoadingKey in browser.options.elementsThatCauseLoadingOrModalErrors) {
      waitForLoadingDivOrModal(browser.options.elementsThatCauseLoadingOrModalErrors[waitForLoadingKey]);
    }
    browser.waitForVisible(element, 4000);

  }

  done();

};

// wait for loading div to appear and disappear.
function waitForLoadingDivOrModal(selectorKey) {
  const selector = elementLookupTable.findElementInTable(selectorKey);
  try {
    browser.waitForVisible(selector, 4000);
    browser.waitForVisible(selector, browser.options.waitforTimeout, true);
  } catch (e) {
    // Don't throw an error if the loading div disappears before the waitForVisible check is ran. QA-184
    // TODO: Stop errorshots from being taken when this fails
  }
}

// Returns the name of element in the grid being clicked if using regex "/^(.+) in row #(\d+)$/"
function getElementFromRegex(selectorKey) {
  const rowMatcher = /^(.+) in row #(\d+)$/;
  const matches = selectorKey.match(rowMatcher);

  if (matches !== null) {
    const [, elName, rowNumber] = matches;
    return elName;
  }
  return selectorKey;
}
