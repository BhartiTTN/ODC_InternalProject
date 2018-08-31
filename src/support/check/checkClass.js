import {findElementInTable} from '../LookupTables/elementLookupTable';
import cssStyles from '../objects/cssStyles';

/**
 * Check if the given element has the given class
 * @param  {String}   selectorKey       Key for selector lookup table
 * @param  {String}   falseCase         Whether to check for the class to exist
 *                                      or not ('has', 'does not have')
 * @param  {String}   expectedClassName The class name to check
 * @param  {Function} done              Function to execute when finished
 */
module.exports = (selectorKey, falseCase, expectedClassName, done) => {
  const selector = findElementInTable(selectorKey);
  const expectedClass = cssStyles[expectedClassName];

  browser.waitForVisible(selector);
  /**
     * List of all the classes of the element
     * @type {Array}
     */
  const classesList = browser.getAttribute(selector, 'className').split(' ');

  if (falseCase === 'does not have') {
    expect(classesList).to.not
      .include(
        expectedClass,
        `Element ${selector} should not have the class ${expectedClass}`
      );
  } else {
    expect(classesList).to
      .include(
        expectedClass,
        `Element ${selector} should have the class ${expectedClass}`
      );
  }

  done();
};
