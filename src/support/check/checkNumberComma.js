/**
 * Created by hkodey on 02/08.
 */

import storedVariables from '../LookupTables/storedVariables';

/**
 * Check to compare Number Entered with the Comma Separated Value displayed
 * @param  {String}   variableName  Stored Value that is comma seperated and displayed(which is required to be validated for the format)
 * @param {String}    expectedText  Original Number entered that is non-comma separated value
 * @param  {Function} done          Function to execute when finished
 */
module.exports = (variableName,expectedText,done) => {


  const CommaValue = storedVariables.getVariable(variableName);

  const OriginalValueWithoutCommas = Number(parseFloat(expectedText).toFixed(8)).toLocaleString('en-US');

  expect(CommaValue).to.equal(OriginalValueWithoutCommas, 'Equals Value');

  done();

};


