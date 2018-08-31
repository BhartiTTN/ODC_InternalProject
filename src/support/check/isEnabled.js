import elementLookupTable from '../LookupTables/elementLookupTable';

/**
 * Check if the given element is enabled
 * @param  {String}   element   Element selector
 * @param  {String}   falseCase Whether to check if the given element is enabled
 *                              or not
 * @param  {Function} done      Function to execute when finished
 */

module.exports = (elementKey, falseCase, done) => {
  /**
   * The enabled state of the given element
   * @type {Boolean}
   */
  const element = elementLookupTable.findElementInTable(elementKey);
  const isEnabled = browser.isEnabled(element);
  if (falseCase) {
    expect(isEnabled).to.not
      .equal(true, `Expected element "${element}" not to be enabled`);
  } else {
    expect(isEnabled).to
      .equal(true, `Expected element "${element}" to be enabled`);
  }
  done();
};
