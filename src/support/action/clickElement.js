import {findElementInTable} from '../LookupTables/elementLookupTable';
/**
 * Perform an click action on the given element
 * @param  {String}   clickType click or doubleClick
 * @param  {String}   selectorKey key for selector lookup table
 * @param  {Function} done    Function to execute when finished
 */

module.exports = (clickType,selectorKey, done) => {
  const selector = findElementInTable(selectorKey);
  browser.waitForClickable(selector);

  const method = (clickType === 'click') ? 'click':'doubleClick';
  browser[method](selector);

  const waitForLoadingKey = getElementFromRegex(selectorKey);
  const {elementsThatCauseLoadingOrModalErrors} = browser.options;

  if (waitForLoadingKey in elementsThatCauseLoadingOrModalErrors) {
    const loadingDivsAndModals = elementsThatCauseLoadingOrModalErrors[waitForLoadingKey];

    loadingDivsAndModals.forEach((loadingDivOrModal)=> {
      const selector = findElementInTable(loadingDivOrModal);
      browser.waitForLoadingDivOrModal(selector);
    });
  }
  done();
};

// Returns the name of element in the grid being clicked if using regex "/^(.+) in row #(\d+)$/"
function getElementFromRegex(selectorKey) {
  const rowMatcher = /^(.+) in row #(\d+)$/;
  const matches = selectorKey.match(rowMatcher);

  if (matches !== null) {
    const [, elName] = matches;
    return elName;
  }
  return selectorKey;
}
