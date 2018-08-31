/* Created by hkodey */

import storedVariables from '../LookupTables/storedVariables';
import RegExLookupTable from '../LookupTables/RegExLookupTable';
import {findElementInTable} from '../LookupTables/elementLookupTable';


/**
 * TODO: This step method has no description
 * @param  {String}   selectorKey   key for selector table
 * @param  {String}   variableName  Name to store the variable as
 * @param  {Function} done          Function to execute when finished
 */
module.exports = (selectorKey, variableName, done) => {

  const element = findElementInTable(selectorKey);

  const elm = browser.getText(element);

  const reg = RegExLookupTable.findRegEXInTable(selectorKey);
  const [, numberOfElements] = reg.exec(elm);

  storedVariables.setVariable(variableName, numberOfElements);

  done();
};


