/**
 * Created by adamShanahan on 1/18/18.
 */
import elementLookupTable from '../LookupTables/elementLookupTable';
// TODO: Merge with setInputFieldWithDateAppended. Not yet sure how to do this in a clean way


/**
 * Set the value of the given input field to a given date
 * @param  {String}   selectorKey key for selector lookup table
 * @param  {String}   current Whether or not to use the current date
 * @param  {Function} done    Function to execute when finished
 */
module.exports = (selectorKey, current, numberOfDays, agoOrFromNow, done) => {
  const selector = elementLookupTable.findElementInTable(selectorKey);

  const date = getDate(numberOfDays,agoOrFromNow);

  browser.setValue(selector, date);

  done();
};

function getDate(numberOfDays, agoOrFromNow) {
  numberOfDays = parseInt(numberOfDays) || 0;

  numberOfDays = agoOrFromNow === 'ago' ? numberOfDays * -1 : numberOfDays;

  const date = new Date();
  date.setDate(new Date().getDate() + numberOfDays);


  return date.toLocaleDateString();
}
