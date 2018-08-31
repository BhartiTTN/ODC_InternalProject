/**
 * Created by harinikodey on 9/23/17.
 */
import elementLookupTable from '../LookupTables/elementLookupTable';

/**
 * Check if the given elements contains text
 * @param  {String}   selectorKey   key for selector lookup table
 * @param {String}   ascendOrDescend Whether to check if it is ascending or descending
 * @param  {Function} done          Function to execute when finished
 * @returns {Promise} promise object to reflect when the logic is done.
 */
module.exports = (selectorKey, ascendOrDescend, done) => {
  const element = elementLookupTable.findElementInTable(selectorKey);

  let text = browser.getText(element);

  if (Array.isArray(text)) {
    testArraySortOrder(text,ascendOrDescend);
  }

  done();
};

function testArraySortOrder(array, ascendOrDescend) {
  array = array.reduce((filtered, element) => {
    if (element.length > 0) {
      filtered.push(element.replace(/[^a-zA-Z]/g, '')); // ODC ignores special characters when sorting
    }
    return filtered;
  }, []);

  const checkDescending = (ascendOrDescend === 'Descending');
  expect(array).to.be.sorted(checkDescending);

}

