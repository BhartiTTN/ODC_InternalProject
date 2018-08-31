/**
 * Created by adamShanahan on 4/27/18.
 */

import clickElement from '../../../action/clickElement';
import {getAccountCampaignOrCreativeRowNumber, getGroupOrUserRowNumber} from '../../../LookupTables/selectorHelperFunctions/accountAndCampaignManagementSelectorFunctions/getManagementGridRowIndex';

module.exports = {
  editEnableOrDisableAccountCampaignOrCreative,
  editEnableOrDisableGroupOrUser
};

function rowInteraction(action, rowNumber, done) {
  clickElement('click', `Checkbox in row #${rowNumber}`, () => {
    clickElement('click', `${action} Button in row #${rowNumber}`, done);
  });
}


/**
 * Edits Enables or Disables an Account, Campaign, or Creative with a specified name
 * @param {String} action edit, enable, or disable
 * @param {String} gridType Account, Campaign, or Creative
 * @param {String} usingStoredVariable Indicates if nameOfElementToDelete refers to the name of a stored variable, or the actual string value of the name of the campaign or creative.
 * @param {String} nameOfElementToDelete Name of Account, Campaign, or Creative to delete
 * @param {Function} done Function to execute when finished
 */
function editEnableOrDisableAccountCampaignOrCreative(action, gridType, usingStoredVariable, nameOfElementToDelete, done) {
  const rowIndex = getAccountCampaignOrCreativeRowNumber(gridType, usingStoredVariable, nameOfElementToDelete);
  rowInteraction(action, rowIndex, done);
}


/**
 * Edits Enables or Disables a User or Group with a specified name that is paired with a given account
 * @param {String} action edit, enable, or disable
 * @param {String} gridType User or Group
 * @param {String} usingStoredGroupOrUser Indicates if GroupOrUserName refers to the name of a stored variable, or the actual string value of the name of the User or Group.
 * @param {String} GroupOrUserName Name of User or Group to delete
 * @param {String} usingStoredAccount Indicates if accountName refers to the name of a stored variable, or the actual string value of the name of the account.
 * @param {String} accountName name of the account the user or group is paired with
 * @param {Function} done Function to execute when finished
 */
function editEnableOrDisableGroupOrUser(action, gridType, usingStoredGroupOrUser, GroupOrUserName, usingStoredAccount, accountName, done) {
  const rowIndex = getGroupOrUserRowNumber(gridType, usingStoredGroupOrUser, GroupOrUserName, usingStoredAccount, accountName);
  rowInteraction(action, rowIndex, done);
}
