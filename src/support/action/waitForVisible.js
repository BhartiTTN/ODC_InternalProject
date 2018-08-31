const elementLookupTable = require('../LookupTables/elementLookupTable');

/**
 * Wait for the given element to become visible
 * @param  {String}   all       Whether to check if all instances of a selector are visible, or check if a single instance is visible
 * @param  {String}   elem      Element selector
 * @param  {String}   falseCase Whether or not to expect a visible or hidden
 *                              state
 * @param  {Function} done      Function to execute when finished
 *
 * @todo  merge with waitfor
 */
module.exports = (all, elementKey, falseCase, done) => {
  const selector = elementLookupTable.findElementInTable(elementKey);

  if (all) {
    browser.waitUntil(() => allVisible(selector, !!falseCase), browser.options.waitforTimeout);
  } else {
    browser.waitForVisible(selector, browser.options.waitForTimeout, !!falseCase);
  }
  done();
};

// If multiple elements match a selector, webDriver's waitForVisible returns true if at least 1 element is visible, or 1 element is not visible if the reverse parameter is set to true
// This checks that all elements that match the selector are or are not visible
function allVisible(selector, falseCase) {
  const visibility = browser.isVisible(selector);

  return Array.isArray(visibility) ? visibility.every((visibility) => visibility ^ falseCase) : visibility ^ falseCase;
}
