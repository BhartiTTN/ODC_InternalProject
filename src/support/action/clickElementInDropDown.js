import elementLookupTable from '../LookupTables/elementLookupTable';
import {getVariable} from '../LookupTables/storedVariables';
/**
 * Created by hkodey.
 */


/**
 * Clicks on a drop down element that contains the given text
 * @param  {String }  useStoredValue      whether a target refers to a stored variable, or a string
 * @param {String}    targetText          text we are looking for
 * @param  {String}   dropdownSelectorKey key for element selector table. Optional, defaults to .select-option
 * @param  {Function} done                Function to execute when finished
 */

module.exports = (useStoredValue, targetText, dropdownSelectorKey, done) => {
  const selector = (dropdownSelectorKey) ? elementLookupTable.findElementInTable(dropdownSelectorKey) : '.Select-option';

  browser.waitForVisible(`${selector}:nth-child(1)`);

  const dropdownElements = $$(selector);

  targetText = (useStoredValue) ? getVariable(targetText) : targetText;

  const dropdownElement = dropdownElements.find(elObj => {
    return elObj.getText().trim().toLowerCase() === targetText.trim().toLowerCase();
  });

  dropdownElement.click();

  done();
};
