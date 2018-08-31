/**
 * Created by adamShanahan on 5/9/18.
 */

const rp = require('request-promise');
const {getVariable} = require('../../../../LookupTables/storedVariables');


function getOptions(token, password) {
  const options = {
    method: 'POST',
    uri: `${getVariable('apiBaseUrl')}/account-service/memberships/update-profile/${token}`,
    headers: {
      'Authorization': getVariable('qa@viralgains.comAuthToken') // TODO: Make this configurable
    },
    body: {
      'firstName': 'Default API First Name',
      'lastName': 'Default API Last Name',
      'jobTitle': 'API Job Title',
      password
    },
    json: true
  };

  return options;
}

module.exports = (token, password, callback) => {
  const options = getOptions(token, password);

  return updateProfile(options, callback);
};


function updateProfile(options, callback) {
  return rp(options).then(() => {
    callback();
  });
}
