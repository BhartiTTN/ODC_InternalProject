import {findElementInTable} from '../LookupTables/elementLookupTable';

let textValue = null;

/**
 * Check if the given elements text is the same as the given text
 * @param  {String}   type          Type of element (inputfield or element)
 * @param  {String}   selectorKey   Key for selector table
 * @param  {String}   falseCase     Whether to check if the content equals the
 *                                  given text or not
 * @param  {String}   expectedText  The text to validate against
 * @param  {Function} done          Function to execute when finished
 */
module.exports = (type, selectorKey, falseCase, expectedText, done) => {
  textValue = null; // Resetting text value. Globals are saved between scenarios in Cucumber.

  const selector = findElementInTable(selectorKey);
  const command = (type !== 'inputfield') ? 'getText' : 'getValue';

  browser.waitForVisible(selector);


  checkEqualsText(selector, command, expectedText, falseCase);

  done();
};

function checkEqualsText(selector, command, expectedText, falseCase) {
  // Catching the error allows us to show updated textValue in error message
  try {
    browser.waitUntil(() => equalsText(selector, command, expectedText, falseCase), browser.options.waitforTimeout);
  } catch (e) {
    assert.fail(-1, -1,  `Expected "${textValue}" to ${falseCase ? 'not ' : ''}equal "${expectedText}"`);
  }
}

function equalsText(selector, command, expectedText, falseCase) {
  if (!browser.isVisible(selector)) {
    assert.fail(-1, -1, `Element is no longer visible. Last known text value was "${textValue}", but it was expected to ${falseCase ? 'not ' : ''}equal "${expectedText}"`);
  }

  textValue = browser[command](selector);
  return (textValue === expectedText) === !falseCase;
}
