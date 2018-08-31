import {findElementInTable} from '../LookupTables/elementLookupTable';

/**
 * Created by hkodey.
 */


/**
 * Check if the given elements contains text
 * @param  {String}   type      Type of element (inputfield or element)
 * @param  {String}   selectorKey   element selector
 * @param  {String}   falseCase Whether to check if the content contains text
 *                              or not
 * @param  {Function} done      Function to execute when finished
 */
module.exports = (type, selectorKey, falseCase, done) => {

  const selector = findElementInTable(selectorKey);
  const command = (type !== 'inputfield') ? 'getText' : 'getValue';

  const text = browser[command](selector);

  if (falseCase) {
    expect(text).to.not.equal('');
  } else {
    expect(text).to.equal('');
  }

  done();
};
