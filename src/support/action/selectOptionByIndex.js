const KNOWN_ELEMENTS = {

  'User Group':'.gridSelector__selectContainer___1_79I .Select-placeholder',
  'User Group Field' :'.Select-placeholder',
  'User Group Value' :'.Select.Select--single .Select-menu-outer .Select-option[id$="--option-0"]',
  'User Group Value-Item' : '.Select-menu-outer .Select-option[id$="--list"]',


};
/**
 * Select a option from a select element by it's index
 * @param  {String}   index      The index of the option
 * @param  {String}   obsolete   The ordinal indicator of the index (unused)
 * @param  {String}   selectElem Element selector
 * @param  {Function} done       Function to execute when finished
 *
 * @todo  merge with selectOption
 */
module.exports = (index, obsolete, knownElement, done) => {
  /**
     * The index of the option to select
     * @type {Int}
     */
  const selectElem = KNOWN_ELEMENTS[knownElement];
  const optionIndex = parseInt(index, 10);

  browser.selectByIndex(selectElem, optionIndex);

  done();
};
