/**
 * Created by hkodey.
 */

import storedVariables from '../LookupTables/storedVariables';

const KNOWN_ELEMENTS = {

  'Selected Rows' : '.tab__tabContentActive___3V4vx .datagrid__rtTrGroup___2oDPX .datagrid__selectedRow___3YsXr .datagrid__rtTd___-YAv- input[value="on"]'

};

/**
 * Check if the given elements text is the same as the given text
 * @param  {String}   selectorKey   key for selector table
 * @param {String}    variableName  Name to store variable as
 * @param  {Function} done          Function to execute when finished
 */

module.exports =  (selectorKey, variableName, done) => {

  const extcount = KNOWN_ELEMENTS[selectorKey];

  const elm = browser.elements(extcount).value;

  storedVariables.setVariable(variableName, elm.length);

  done();
};
