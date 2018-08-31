import {findElementInTable} from '../LookupTables/elementLookupTable';
/**
 * Created by hkodey.
 */

/**
 * Check if the given elements contains text
 * @param  {String}   knownElement       Element selector
 * @param  {String}   falseCase     Whether to check if the content contains
 *                                  the given text or not
 * @param  {String}   expectedText  The text to check against
 * @param  {Function} done          Function to execute when finished
 */

module.exports = (knownElement, falseCase, expectedText, done) => {
  const gridSelector = findElementInTable(knownElement);

  browser.waitForVisible(gridSelector);
  const errorMessage = `Could not find "${expectedText}" in "${knownElement}"`;

  browser.waitUntil(()=> checkGridContainsText(gridSelector,falseCase, expectedText), browser.options.waitForTimeout, errorMessage);

  done();

};

function checkGridContainsText(gridSelector, falseCase, expectedText) {
  const grid = browser.getText(gridSelector);
  if (Array.isArray(grid)) {
    return testArray(grid, falseCase, expectedText);
  }

  return grid.includes(expectedText) === !falseCase;
}

function testArray(grid, falseCase, expectedText) {
  grid = grid.filter((element) => {
    return element.length > 0;
  });

  return grid.some((element)=> {
    return element.includes(expectedText);
  }) === !falseCase;
}
