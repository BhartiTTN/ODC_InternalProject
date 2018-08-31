import {findElementInTable} from '../LookupTables/elementLookupTable';
import {getVariable} from '../LookupTables/storedVariables';

let text = null;

/**
 * Check if the given elements contains text
 * @param  {String}   type               Type of element (inputfield or element)
 * @param  {String}   selectorKey         Key for selector table
 * @param  {String}   falseCase           Whether to check if the content contains the given text or not
 * @param  {String}   useStoredValue      type of expected text: stored value, text
 * @param  {String}   expectedText  The text to check against.
 * @param  {Function} done               Function to execute when finished
 */

module.exports = (type, selectorKey, falseCase, useStoredValue, expectedText, done) => {
  text = null; // Resetting text value. Globals are saved between scenarios in Cucumber.

  const selector = findElementInTable(selectorKey);
  const command = (type !== 'inputfield') ? 'getText' : 'getValue';

  expectedText = (useStoredValue === 'stored value') ? getVariable(expectedText) : expectedText;

  browser.waitForVisible(selector);
  checkContainsText(selector, command, expectedText, falseCase);

  done();
};

function checkContainsText(selector, command, expectedText, falseCase) {
  // Catching the error allows us to show updated textValue in error message
  try {
    browser.waitUntil(() => containsText(selector, command, expectedText, falseCase), browser.options.waitforTimeout);

  } catch (e) {
    assert.fail(-1, -1, `Expected "${text}" to ${falseCase ? 'not ' : ''}include "${expectedText}"`);
  }
}

function containsText(selector, command, expectedText, falseCase) {
  if (!browser.isVisible(selector)) {
    assert.fail(-1, -1, `Element is no longer visible. Last known text value was "${text}", but it was expected to ${falseCase ? 'not ' : ''}include "${expectedText}"`);
  }

  text = browser[command](selector);

  return text.includes(expectedText) === !falseCase;
}
