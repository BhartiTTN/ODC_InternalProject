import {findElementInTable} from '../LookupTables/elementLookupTable';

/**
 * Scroll the page to the given element
 * @param  {String}   selectorKey key for selector lookup table
 * @param  {Function} done     Function to execute when finished
 */
export default function (selectorKey, done) {
  const selector = findElementInTable(selectorKey);
  browser.waitForVisible(selector);

  browser.execute((selector) => {
    selector.scrollIntoView();
    selector.click();
  }, $(selector).value);

  done();
};

// TODO: this should be the default function. This requires additional refactoring.
export function scrollWithoutClick(selectorKey, done) {
  const selector = findElementInTable(selectorKey);

  browser.waitForVisible(selector);
  browser.scroll(selector);

  done();
}
