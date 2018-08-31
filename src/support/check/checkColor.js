/**
 * Created by adamShanahan on 6/14/18.
 */
import {findElementInTable} from '../LookupTables/elementLookupTable';
import rgbaValues from '../objects/colorRgbaValues';

module.exports = (background, selectorKey, falseCase, expectedColorName, done) => {
  const selector = findElementInTable(selectorKey);
  const attribute = (background)? 'backgroundColor' : 'color';

  browser.waitForVisible(selector);
  const color = browser.getCssProperty(selector, attribute).value;
  const expectedColor = rgbaValues[expectedColorName];

  testColor(attribute, selectorKey, color, expectedColor, falseCase);

  done();
};

function testColor(attribute,selectorKey, color, expectedColor, falseCase) {
  if (falseCase) {
    expect(color).to.not
      .equal(
        expectedColor,
        `${attribute} of element "${selectorKey}" should not contain ` +
        `"${color}"`
      );
  } else {
    expect(color).to
      .equal(
        expectedColor,
        `${attribute} of element "${selectorKey}" should not contain ` +
        `"${color}", but "${expectedColor}"`
      );
  }
}
