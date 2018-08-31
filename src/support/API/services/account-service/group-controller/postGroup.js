/**
 * Created by adamShanahan on 4/13/18.
 */
const {addApiEntity} = require('../../../objects/apiEntities');
const rp = require('request-promise');
const {groupPermissions} = require('../../../fixtures/permissions');
const getMembership = require('../membership-controller/getMembership');
const {getKnownAccountId} = require('../../../../../fixtures/knownAccountIDs');
const {getVariable} = require('../../../../LookupTables/storedVariables');

function getOptions(enabledDisabled, groupName, accountName, memberships, permissions) {
  const options = {
    method: 'POST',
    uri: `${getVariable('apiBaseUrl')}/account-service/groups`,
    headers: {
      'Authorization': getVariable('qa@viralgains.comAuthToken') // TODO: Make this configurable
    },
    body: {
      'accountId': getKnownAccountId(accountName),
      memberships,
      'name': groupName,
      permissions,
      'status': enabledDisabled
    },
    json: true
  };

  return options;
}


/**
 * Creates a new Group through the API. This is used for setup purposes.
 * @param enabledDisabled. Optional argument indicating if the new Group should be enabled or disabled. Defaults to Enabled.
 * @param groupName name of the new Group
 * @param accountName Name of the Account this Group is under
 * @param usingStoredEmails Indicates if userEmails refer to the names of stored variables, or the actual string values of the emails
 * @param userEmails  A String of comma separated email variable names to add under this Group. Example: 'New User Email,New Email2,...'
 * @param permissionsList List of Permissions this Group Gives
 * @param done Function to execute when finished
 */

module.exports = (enabledDisabled, groupName, accountName, usingStoredEmails, userEmails, permissionsList, done) => {
  enabledDisabled = (enabledDisabled === ' disabled') ? 'DISABLED' : 'ENABLED';

  userEmails = getUserEmails(usingStoredEmails, userEmails);
  const permissions = getPermissions(permissionsList);

  return addMemberships(accountName, userEmails).then((memberships) => {
    const options = getOptions(enabledDisabled, groupName, accountName, memberships, permissions);
    return createGroup(options, done);
  });
};

function getUserEmails(usingStoredEmails, userEmailVariableNames) {
  if (userEmailVariableNames == null) {
    return [];
  }
  const userEmailsArray = userEmailVariableNames.split(',').map((email)=>email.trim());

  if (usingStoredEmails) {
    return userEmailsArray.map((userEmail)=> getVariable(userEmail));
  }


  return userEmailsArray;
}

function getPermissions(permissionList) {
  if (permissionList == null) {
    return [];
  }
  const permissionCodes = permissionList.split(',').map((permission) => groupPermissions[permission.trim()]);
  return permissionCodes;
}

function addMemberships(accountName, userEmails) {
  return Promise.all(userEmails.map((userEmail) => getMembership(accountName, userEmail))).then((memberships) => {
    const flattenedMemberships = [].concat.apply([], memberships);
    return Promise.resolve(flattenedMemberships);
  });
}

function createGroup(options, done) {
  return rp(options).then((response) => {
    addApiEntity(options.body.name,'account-service/groups', response.data.id, options.headers.Authorization, true);
    done();
  });
}
