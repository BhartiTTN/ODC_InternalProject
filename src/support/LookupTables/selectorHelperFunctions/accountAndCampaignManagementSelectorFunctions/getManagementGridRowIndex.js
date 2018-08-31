/**
 * Created by adamShanahan on 4/27/18.
 */
import {findElementInTable} from '../../elementLookupTable';
import {getVariable} from '../../storedVariables';

module.exports = {
  getAccountCampaignOrCreativeRowNumber,
  getGroupOrUserRowNumber
};



/**
 * Returns the row number of an Account, Campaign, or Creative with a specified name. Currently must be visible in the current grid
 * @param {String} gridType Account, Campaign, or Creative
 * @param {String} usingStoredVariable Indicates if nameOfElementToDelete refers to the name of a stored variable, or the actual string value of the name of the campaign or creative.
 * @param {String} elementName Name of Account, Campaign, or Creative to find
 */
function getAccountCampaignOrCreativeRowNumber(gridType, usingStoredVariable, elementName) {
  elementName = (usingStoredVariable)? getVariable(elementName) : elementName;

  const columnSelector = findElementInTable(`${gridType} Name Column`);

  const names = getColumnText(columnSelector);

  const rowIndex = names.findIndex((name) => name.startsWith(elementName));

  if (rowIndex === -1) {
    assert.fail(-1, -1, `Row with ${gridType} named ${elementName} was not found`);
  }

  return rowIndex + 1;
}

/**
 * Returns the row number of a Group or User with a specified name that is paired with a given account
 * @param {String} gridType User or Group
 * @param {String} usingStoredGroupOrUser Indicates if GroupOrUserName refers to the name of a stored variable, or the actual string value of the name of the User or Group.
 * @param {String} GroupOrUserName Name of User or Group to find
 * @param {String} usingStoredAccount Indicates if accountName refers to the name of a stored variable, or the actual string value of the name of the account.
 * @param {String} accountName name of the account the user or group is paired with
 */
function getGroupOrUserRowNumber(gridType, usingStoredGroupOrUser, GroupOrUserName, usingStoredAccount,  accountName) {
  GroupOrUserName = (usingStoredGroupOrUser)? getVariable(GroupOrUserName) : GroupOrUserName;
  GroupOrUserName = (gridType === 'User') ? GroupOrUserName.toLowerCase() : GroupOrUserName; // Temporary Measure, see ODC-716

  accountName = (usingStoredAccount)? getVariable(accountName) : accountName;

  const columnSelector = findElementInTable(`${gridType} Name Column`);
  const accountColumnSelector = findElementInTable('Account Name Column');

  const groupOrUserNames = browser.getText(columnSelector);
  const accountNames = browser.getText(accountColumnSelector);

  let rowIndex = -1;

  for (let i = 0; i < 10; i++) {
    if (accountNames[i] === accountName && groupOrUserNames[i] === GroupOrUserName) {
      rowIndex = i;
      break;
    }
  }

  if (rowIndex === -1) {
    assert.fail(-1, -1, `Row with ${gridType} named ${GroupOrUserName} paired with Account ${accountName} was not found`);
  }

  return rowIndex + 1;
}

function getColumnText(columnSelector) {
  const names = browser.getText(columnSelector);

  // browserA and browserB should be seeing the same text.
  if (usingMultiremote(names)) {
    return names.browserA;
  }
  return names;
}

function usingMultiremote() {
  return typeof browser.getTitle() === 'object';
}
