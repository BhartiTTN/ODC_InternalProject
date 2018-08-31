/**
 * Created by hkodey.
 */

import storedVariables from '../LookupTables/storedVariables';

const EXPECTED_COUNT = {

  'Groups in the modal grid': '.gridSelector__container___1zpWG .datagrid__rtTable___1jUh7  input[value="on"]',
  'Selected Rows' : '.tab__tabContentActive___3V4vx .datagrid__rtTrGroup___2oDPX .datagrid__selectedRow___3YsXr .datagrid__rtTd___-YAv- input[value="on"]'
};

/**
 * Check if a grid has a given count
 * @param {String}    variableName  Name of stored variable to compare against
 * @param {String}   selectorKey key for selector lookup table. This is compared against the value of variableName
 * @param {Function} done  Function to execute when finished
 */

module.exports = (variableName, selectorKey, done) => {

  const extcount = EXPECTED_COUNT[selectorKey];

  const elm = browser.elements(extcount).value;

  const count = storedVariables.getVariable(variableName);

  expect((elm.length)).to.equal(parseInt(count), 'Equals Count');

  done();
};

