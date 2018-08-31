/**
 * Created by harinikodey on 02/12/18.
 */

import clickElement from '../../../action/clickElement';
import clickElementInDropDown from '../../../action/clickElementInDropDown';
import {getVariable} from '../../../LookupTables/storedVariables';
import setInput from '../../../action/setInput';
import setInputFieldWithDateAppended from '../../../action/setInputFieldWithDateAppended';

const permissionsSelectorTable = {
  'Read': ['Campaign Management: Read Select Checkbox'],
  'Write': ['Campaign Management: Write Select Checkbox'],
  'Read and Write': ['Campaign Management: Write Select Checkbox', 'Campaign Management: Read Select Checkbox']
};

/**
 * Create New Group by Selecting/Entering Mandatory fields data provided in the Feature Files
 *  @param {String}    permissions                List of Permissions (Read, Write, Read and Write)
 *  @param {String}    usingStoredAccountVariable Whether accountName refers to a stored variable or a string value
 *  @param {String}    accountName                Name of account that Group is under
 *  @param {String}    groupName                  Name of new Group
 *  @param {String}    usingStoredEmailVariable   Whether accountName refers to a stored variable or a string value
 *  @param {String}    userEmail                  Name of User Email to add to this group
 *  @param {Function}  done                       Function to execute when finished
 */


module.exports = (groupName, usingStoredAccountVariable, accountName, usingStoredEmailVariable, userEmail, permissions, done) => {
  accountName = (usingStoredAccountVariable) ? getVariable(accountName) : accountName;
  userEmail = (usingStoredEmailVariable) ? getVariable(userEmail) : userEmail;

  clickElement('click', 'Groups Tab', () => {
    clickElement('click', 'New Group Button', () => {
      selectParameters(permissions, accountName, groupName, userEmail, () => {
        clickElement('click', 'Create Button', done);
      });
    });
  });
};


function selectParameters(permissionType, accountName, groupName, userEmail, callback) {
  setAccount(accountName, () => {
    setGroupName(groupName, () => {
      setGroupStatus(() => {
        setGroupPermissions(permissionType, () => {
          setMembers(userEmail, callback);
        });
      });
    });
  });
}

function setAccount(accountName, callback) {
  setInput('setValue', accountName, 'Group Account Name', () => {
    clickElement('click', 'Industry Value', callback);
  });
}

function setGroupName(groupName, callback) {
  clickElement('click', 'Group Name', () => {
    setInput('setValue', groupName, 'Group Name', callback);
  });
}

function setGroupStatus(callback) {
  clickElement('click', 'Group Status dropdown', () => {
    clickElement('click', 'Status Menu-Enable', callback);
  });
}

function setMembers(userEmail, callback) {
  if (userEmail === '') { // exit if no emails were passed
    callback();
  }

  setInput('setValue', userEmail, 'User Group InputField', () => {
    clickElementInDropDown(false, userEmail, 'Group Name Dropdown', () => {
      clickElement('click', 'Add', callback);
    });
  });
}


function setGroupPermissions(permissionType, callback) {
  const permissionSelectors = permissionsSelectorTable[permissionType];

  const clickFunctionChain = permissionSelectors.reduce((clickFunctions, currSelector) => {
    return () => clickElement('click', currSelector, clickFunctions);
  }, callback);

  clickFunctionChain();
}
