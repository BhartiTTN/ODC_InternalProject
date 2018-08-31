/**
 * Created by adamShanahan on 5/14/18.
 */

import clickElement from '../../../action/clickElement';
import getReportGridRowIndex from '../../../LookupTables/selectorHelperFunctions/reportManagementSelectorFunctions/getReportGridRowIndex';

/**
 * Deletes a Report with a specified name that is paired with a given account
 * @param {String} usingStoredReport Indicates if reportName refers to the name of a stored variable, or the actual string value of the name of the report
 * @param {String} reportName Name of Report to find
 * @param {String} usingStoredAccount Indicates if accountName refers to the name of a stored variable, or the actual string value of the name of the account
 * @param {String} accountName name of the account the report is paired with
 * @param {Function} done Function to execute when finished
 */
module.exports = (usingStoredReport, reportName, usingStoredAccount, accountName, done) => {
  const rowIndex = getReportGridRowIndex(usingStoredReport, reportName, usingStoredAccount, accountName);
  deleteReportRow(rowIndex, done);

  done();
};

function deleteReportRow(rowNumber, done) {
  clickElement('click', `Checkbox in row #${rowNumber}`, () => {
    clickElement('click', `delete Button in row #${rowNumber}`, () => {
      clickElement('click', 'Delete Button in Delete Confirmation Pop-Up', done);
    });
  });
}
