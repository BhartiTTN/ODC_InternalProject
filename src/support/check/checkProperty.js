import elementLookupTable from '../LookupTables/elementLookupTable';
/**
 * Check the given property of the given element
 * @param  {String}   isCSS         Whether to check for a CSS property or an
 *                                  attribute
 * @param  {String}   attrName      The name of the attribute to check
 * @param  {String}   elem          Element selector
 * @param  {String}   falseCase     Whether to check if the value of the
 *                                  attribute matches or not
 * @param  {String}   expectedValue The value to match against
 * @param  {Function} done          Function to execute when finished
 */

module.exports = (isCSS, attrName, elem, falseCase, expectedValue, done) => {
  /**
   * The command to use for fetching the expected value
   * @type {String}
   */
  const element = elementLookupTable.findElementInTable(elem);
  const command = isCSS ? 'getCssProperty' : 'getAttribute';

  /**
   * The label to identify the attribute by
   * @type {String}
   */


  const attrType = (isCSS ? 'CSS attribute' : 'Attribute');

  /**
   * The actual attribute value
   * @type {Mixed}
   */

  browser.waitForExist(element);
  const attributeValue = browser[command](element, attrName).value;

  if (falseCase) {
    expect(attributeValue).to.not
      .equal(
        expectedValue,
        `${attrType} of element "${element}" should not contain ` +
                `"${attributeValue}"`

      );
  } else {
    expect(attributeValue).to
      .equal(
        expectedValue,
        `${attrType} of element "${element}" should not contain ` +
                `"${attributeValue}", but "${expectedValue}"`
      );
  }

  done();
};
