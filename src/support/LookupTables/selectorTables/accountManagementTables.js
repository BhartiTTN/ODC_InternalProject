/**
 * Created by adamShanahan on 5/15/18.
 */

const accountManagement = {
  'List Element': 'div[class=\'rt-resizable-header-content\']',

  // Account Management - Buttons
  'New Account Button': '.tab__createButton___3W3Z_:nth-child(1)',
  'New Group Button': '.tab__createButton___3W3Z_:nth-child(2)',
  'New User Button': '.tab__createButton___3W3Z_:nth-child(3)',

  'Newest User': '.tab__tabContentActive___3V4vx .datagrid__rtTrGroup___2oDPX .datagrid__rtTd___-YAv-:nth-child(4)' // TODO: Remove this for QA-178
};

const accountManagementAccountsTab = {
  'Status Column': '.tab__tabContentActive___3V4vx .datagrid__rtTd___-YAv-:nth-child(2)',
  'Account Name Column': '.tab__tabContentActive___3V4vx .datagrid__rtTd___-YAv-:nth-child(3)',
  'Contact Email Column': '.tab__tabContentActive___3V4vx .datagrid__rtTd___-YAv-:nth-child(6)',
};

const accountManagementGroupsTab = {
  'Group Name Column': '.tab__tabContentActive___3V4vx .datagrid__rtTd___-YAv-:nth-child(4)',
};

const accountManagementUsersTab = {
  'Email Column': '.tab__tabContentActive___3V4vx .datagrid__rtTd___-YAv-:nth-child(4)',
  'User Name Column': '.tab__tabContentActive___3V4vx .datagrid__rtTd___-YAv-:nth-child(4)',
  'First Name Column': '.tab__tabContentActive___3V4vx .datagrid__rtTd___-YAv-:nth-child(5)',
  'Last Name Column': '.tab__tabContentActive___3V4vx .datagrid__rtTd___-YAv-:nth-child(6)',
};

export function getAccountManagementSelector(key) {
  if (key in accountManagement) {
    return accountManagement[key];
  }
  if (key in accountManagementAccountsTab) {
    return accountManagementAccountsTab[key];
  }
  if (key in accountManagementGroupsTab) {
    return accountManagementGroupsTab[key];
  }
  if (key in accountManagementUsersTab) {
    return accountManagementUsersTab[key];
  }
  return null;
}
