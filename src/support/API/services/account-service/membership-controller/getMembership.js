/**
 * Created by adamShanahan on 4/16/18.
 */

const {getKnownAccountId} = require('../../../../../fixtures/knownAccountIDs');
const rp = require('request-promise');
const {getVariable} = require('../../../../LookupTables/storedVariables');

function getOptions(accountName, userEmail) {
  const options = {
    method: 'GET',
    uri: getUri(accountName, userEmail),
    headers: {
      'Authorization' : getVariable('qa@viralgains.comAuthToken') // TODO: Make this configurable
    },
    json: true
  };

  return options;
}

module.exports = (accountName, userEmail) => {
  const formattedEmail = getFormatedEmail(userEmail);
  const options = getOptions(accountName, formattedEmail);

  return getMembership(options);
};

function getUri(accountName, userEmail) {
  let uri = `${getVariable('apiBaseUrl')}/account-service/memberships?pageSize=2&deleted=false`;
  uri += `&user.email=${userEmail}`;
  uri += `&accountId=${getKnownAccountId(accountName)}`;
  return uri;
}

function getMembership(options) {
  return rp(options).then((response) => {
    return response.data;
  });
}

// '%2B' is the code for '+'. Need this change for the getMemberships endpoint
function getFormatedEmail(email) {
  return email.replace('+', '%2B');
}
