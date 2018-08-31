import elementLookupTable from '../LookupTables/elementLookupTable';
/**
 * Check if the given element is (not) visible
 * @param  {String}   selectorKey  key for selector lookup table
 * @param  {String}   falseCase Check for a visible or a hidden element
 * @param  {Function} done      Function to execute when finished
 */
module.exports = (selectorKey, falseCase, done) => {
  const selector = elementLookupTable.findElementInTable(selectorKey);

  browser.waitForVisible(selector,browser.options.waitforTimeout, !!falseCase);

  done();
};
