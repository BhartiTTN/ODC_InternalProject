import elementLookupTable from '../LookupTables/elementLookupTable';

/**
 * Check the selected state of the given element
 * @param  {String}   selectorKey   Key for Selector Table
 * @param  {String}   falseCase Whether to check if the element is elected or
 *                              not
 * @param  {Function} done      Function to execute when finished
 */

module.exports = (selectorKey, falseCase, done) => {
  /**
     * The selected state
     * @type {Boolean}
     */

  const selector = elementLookupTable.findElementInTable(selectorKey);

  browser.waitForExist(selector);

  const isSelected = browser.isSelected(selector);


  if (falseCase) {
    expect(isSelected).to.not
      .equal(true, `"${selector}" should not be selected`);
  } else {
    expect(isSelected).to
      .equal(true, `"${selector}" should be selected`);
  }


  done();
};
