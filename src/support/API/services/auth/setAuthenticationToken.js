/**
 * Created by adamShanahan on 4/13/18.
 */
const rp = require('request-promise');
const {getVariable, setVariable} = require('../../../LookupTables/storedVariables');

function getOptions(email, password) {
  const options = {
    method: 'POST',
    uri: `${getVariable('apiBaseUrl')}/auth/authenticate`,
    body: {
      email: 'qa@viralgains.com' || email, // Default Email and Password
      password: 'mypassword' || password
    },
    json: true // Automatically parses the JSON string in the response
  };
  return options;
}


/**
 * Gets an Authentication Token for a given Email and Password, and saves it under a given variable name
 * @param email            Email to send. Defaults to "qa@viralgains.com" or the last email sent
 * @param password         Password to send. Defaults to "mypassword" or the last password sent
 * @param authVariableName Name of the Global Variable to store the Authentication Token under
 */
module.exports = (email, password, authVariableName) => {
  const options = getOptions(email,password);

  return getAuthenticationToken(options, authVariableName);
};

function getAuthenticationToken(options, authVariableName = 'qa@viralgains.comAuthToken') {
  return rp(options).then((authToken) => {
    const {token} = authToken;
    setVariable(authVariableName, `Bearer ${token}`);
    return Promise.resolve(token);
  });
}
