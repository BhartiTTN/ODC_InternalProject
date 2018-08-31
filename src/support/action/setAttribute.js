import elementLookupTable from '../LookupTables/elementLookupTable';

/**
 * @param {String}   AttributeName  Name of the attribute to change
 * @param {String}   selectorKey    key for selector lookup table
 * @param {String}   AttributeValue Value to set the attribute to
 * @param {Function} done           Function to execute when finished
 */
module.exports = (AttributeName, selectorKey, AttributeValue,done) => {
  const selector = elementLookupTable.findElementInTable(selectorKey);
  const element = $(selector).value;

  browser.execute((element, AttributeName, AttributeValue) => {
    element.setAttribute(AttributeName,AttributeValue);
  }, element, AttributeName, AttributeValue);

  done();
};
