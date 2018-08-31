/**
 * Created by adamShanahan on 4/17/18.
 */
const {addApiEntity} = require('../../../objects/apiEntities');
const {getKnownAccountId} = require('../../../../../fixtures/knownAccountIDs');
const rp = require('request-promise');
const {getVariable, setVariable} = require('../../../../LookupTables/storedVariables');
const {testAccountInvitationEmail} = require('../../../../VGSpecificStepMethods/EmailFunctionality/check/checkEmail');
const updateProfile = require('./update-profile');

function getOptions(userName, userEmail, accountName) {
  const options = {
    method: 'POST',
    uri: `${getVariable('apiBaseUrl')}/account-service/memberships`,
    headers: {
      'Authorization': getVariable('qa@viralgains.comAuthToken') // TODO: Make this configurable
    },
    body: {
      account: {
        id: getKnownAccountId(accountName),
        name: accountName
      },
      invitationName: userName,
      user: {
        email: userEmail
      }
    },
    json: true
  };

  return options;
}

module.exports = {
  createUserAndAcceptInvite
};

// TODO: Add ability to base email and account off stored value
function createUserAndAcceptInvite(userName, userEmail, password, accountName, done) {
  const uniqueEmail = getUniqueEmail(userEmail);
  const options = getOptions(userName, uniqueEmail, accountName);

  return createMembership(options, () => {
    return testAccountInvitationEmail(accountName, () => {
      const emailLink = getVariable('currentEmailLink'); // This is set inside testAccountInvitationEmail
      const token = getTokenFromInviteUrl(emailLink);
      return updateProfile(token, password, done);
    });
  });
}

function createMembership(options, callback) {
  return rp(options).then((response) => {
    addApiEntity(options.body.invitationName, 'account-service/memberships', response.data.id, options.headers.Authorization, true);
    return callback();
  });
}

function getUniqueEmail(userEmail) {
  const date = new Date().getTime();
  const [email, domain] = userEmail.split('@');
  const uniqueEmail = `${email}+${date}@${domain}`;
  setVariable('New User Email', uniqueEmail);
  return uniqueEmail;
}

// url is of the form: 'https://odc-ui.int.kube.viralgains.com/invitation/{token}'
function getTokenFromInviteUrl(inviteUrl) {
  const [, token] = inviteUrl.split('invitation/');
  return token;
}

