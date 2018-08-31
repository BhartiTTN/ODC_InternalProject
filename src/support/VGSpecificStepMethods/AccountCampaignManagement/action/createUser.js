/**
 * Created by harinikodey on 01/26/18.
 */

import clickElement from '../../../action/clickElement';
import {getVariable} from '../../../LookupTables/storedVariables';
import setElement from '../../../action/setElement';
import setInput from '../../../action/setInput';
import storeValueFromElementOrInputField from '../../../action/storeValueFromElementOrInputField';
import setInputFieldWithDateAppended from '../../../action/setInputFieldWithDateAppended';

/**
 *  Create New User by Selecting/Entering Mandatory fields data provided in the Feature Files
 *
 * @param {String}    userName name of new user
 * @param {String}    userEmailId email address of new user
 * @param {String}    usingStoredVariable Whether accountName refers to a stored variable or a string value
 * @param {String}    accountName account that new user is under
 * @param  {Function} done    Function to execute when finished
 */
module.exports = (userName, userEmailId, usingStoredVariable, accountName, done) => {
  accountName = (usingStoredVariable)? getVariable(accountName) : accountName;

  clickElement('click', 'New User Button', () => {
    selectParameters(accountName, userName, userEmailId, () => {
      clickInvite(done);
    });
  });
};

function selectParameters(accountName, userName, userEmailId, callBack) {
  setAccount(accountName, () => {
    setUser(userName, () => {
      setEmail(userEmailId, callBack);
    });
  });
}

function setAccount(accountName, callBack) {
  clickElement('click', 'Parent dropdown', () => {
    setInput('setValue', accountName, 'Group Account Name', () => {
      clickElement('click', 'Industry Value', callBack);
    });
  });
}

function setUser(userName, callBack) {
  setElement('set', userName, 'User Name', callBack);
}

function setEmail(userEmailId, callBack) {
  setInputFieldWithDateAppended('set', userEmailId, 'User Email Id', () => {
    storeValueFromElementOrInputField('inputfield', 'User Email Id', 'New User Email', callBack);
  });
}

function clickInvite(callBack) {
  clickElement('click', 'Invite', callBack);
}
