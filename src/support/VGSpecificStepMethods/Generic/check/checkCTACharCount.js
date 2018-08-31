/**
 * Created by hkodey on 02/08.
 */

import storedVariables from '../../../LookupTables/storedVariables';

/**
 * Check to character count field displays the exact count as per the text field value's length
 * @param  {String}   variableName  Character count of the text entered (x from the the field (x/y)in UI)
 * @param {String}    expectedText  Original Text entered in the field ( the length of the field would be compared to Variable name param)
 * @param  {Function} done          Function to execute when finished
 */
module.exports = (variableName,expectedText,done) => {


  const CharCountoftheField = storedVariables.getVariable(variableName);

  const OriginalText = expectedText.length;

  expect(parseInt(CharCountoftheField)).to.equal(parseInt(OriginalText), 'Equals Value');

  done();

};


