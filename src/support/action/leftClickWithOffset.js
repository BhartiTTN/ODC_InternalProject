/**
 * Created by adamShanahan on 2/23/18.
 */
import {findElementInTable} from '../LookupTables/elementLookupTable';

/**
 * Left clicks on a given element with a given X, Y offset.
 * @param selectorKey Key for Element lookup table
 * @param x X offset, defaults to 0 (top left corner of element)
 * @param y Y offset, defaults to 0 (top left corner of element)
 * @param done
 */
module.exports = (selectorKey, x, y, done) => {
  const selector = findElementInTable(selectorKey);
  const xOffset = parseInt(x, 10) || 0;
  const yOffset = parseInt(y, 10) || 0;

  browser.leftClick(selector, xOffset,yOffset);

  done();
};


