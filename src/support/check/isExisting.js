import elementLookupTable from '../LookupTables/elementLookupTable';

/**
 * Check if the given element exists in the current DOM
 * @param  {String}   selectorKey  key for selector lookup table
 * @param  {String}   falseCase Whether to check if the element exists or not
 * @param  {String}   numberOfExpectedInstances  Number of times the element should exist. Defaults to 1
 * @param  {Function} done      Function to execute when finished
 */
module.exports = (selectorKey, falseCase, numberOfExpectedInstances, done) => {
  const selector = elementLookupTable.findElementInTable(selectorKey);
  browser.waitForExist(selector, browser.options.waitforTimeout, !!falseCase);

  if (numberOfExpectedInstances > 0) {
    testMultipleExisting(numberOfExpectedInstances, falseCase, selectorKey, selector);
  }
  done();
};

function testMultipleExisting(numberOfExpectedInstances, falseCase, selectorKey, selector) {
  const numberOfInstances = browser.$$(selector).length;
  
  if (falseCase) {
    assert.notEqual(numberOfInstances, numberOfExpectedInstances, `Expected ${selectorKey} to not appear ${numberOfExpectedInstances} times`);
  } else {
    assert.equal(numberOfInstances, numberOfExpectedInstances, `Expected ${selectorKey} to appear ${numberOfExpectedInstances} times but only appeared ${numberOfInstances} times`);
  }
}
