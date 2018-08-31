/**
 * Created by adamShanahan on 5/8/18.
 */
import {findElementInTable} from '../../elementLookupTable';
import {getVariable} from '../../storedVariables';

/**
 * Returns the row number of a Report with a specified name that is paired with a given account
 * @param {String} usingStoredReport Indicates if reportName refers to the name of a stored variable, or the actual string value of the name of the report
 * @param {String} reportName Name of Report to find
 * @param {String} usingStoredAccount Indicates if accountName refers to the name of a stored variable, or the actual string value of the name of the account
 * @param {String} accountName name of the account the report is paired with
 */
module.exports = (usingStoredReport, reportName, usingStoredAccount, accountName) => {
  reportName = (usingStoredReport)? getVariable(reportName) : reportName;
  accountName = (usingStoredAccount)? getVariable(accountName) : accountName;

  const reportColumnSelector = findElementInTable('Report Name Column');
  const accountColumnSelector = findElementInTable('Report Management Account Name Column');

  const reportNames = browser.getText(reportColumnSelector);
  const accountNames = browser.getText(accountColumnSelector);

  let rowIndex = -1;

  for (let i = 0; i < 10; i++) {
    if (accountNames[i] === accountName && reportNames[i] === reportName) {
      rowIndex = i;
      break;
    }
  }

  if (rowIndex === -1) {
    assert.fail(-1, -1, `Row with Report named ${reportName} paired with Account ${accountName} was not found`);
  }

  return rowIndex + 1;
};
