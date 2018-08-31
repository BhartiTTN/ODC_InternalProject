/**
 * Created by harinikodey on 9/16/17.
 */
import currentVastUrl from '../objects/currentVastUrl';
import {findElementInTable} from '../LookupTables/elementLookupTable';
import storedVariables from '../LookupTables/storedVariables';

/**
 * Tests that the vastId from the currentVastUrl shows up in Druid using the given selector
 * Then stores how many times this adunit has been bid on
 * @param  {String}   adUnitIdSelector       selector for adUnitId in Druid
 * @param {String} variableName   Name to store variable as
 * @param  {Function} done          Function to execute when finished
 */
module.exports = (adUnitIdSelector,variableName, done) => {
  const element = findElementInTable(adUnitIdSelector);
  const arr = browser.getText(element);

  const exptext = currentVastUrl.getInstance().getVastId();

  const index = arr.indexOf(exptext);
  assert.notEqual(index, -1, `Ad id not found ${exptext}`);
  const text = arr[index + 1];
  storedVariables.setVariable(variableName, parseInt(text, 10));

  done();
};
