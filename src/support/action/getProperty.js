/**
 * Created by adamShanahan on 10/23/17.
 */
/**
 * Get the given property of the given element
 * @param  {String}   isCSS         Whether to get a CSS property or an
 *                                  attribute
 * @param  {String}   attrName      The name of the attribute to get
 * @param  {String}   elem          Element selector
 */
module.exports = (isCSS, attrName, elem, done) => {
  /**
   * The command to use for fetching the expected value
   * @type {String}
   */
  const command = isCSS ? 'getCssProperty' : 'getAttribute';

  /**
   * The actual attribute value
   * @type {Mixed}
   */
  let attributeValue = browser[command](elem, attrName);

  /**
   * when getting something with a color WebdriverIO returns a color
   * object but we want to assert against a string
   */
  if (attrName.indexOf('color') > -1) {
    attributeValue = attributeValue.value;
  }

  done(attributeValue); // passing value to be used by other functions
};
