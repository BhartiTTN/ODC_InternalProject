/**
 * Created by adamShanahan on 4/13/18.
 */
const {addApiEntity} = require('../../../objects/apiEntities');
const rp = require('request-promise');
const {getVariable, setVariable} = require('../../../../LookupTables/storedVariables');
const {getKnownAccountId} = require('../../../../../fixtures/knownAccountIDs');
const postMedia = require('../../media-service/media-controller/postMedia');

function getOptions(enabledDisabled, accountName, contactEmail, parentAccount, dspLogin, dspPassword) {
  const options = {
    method: 'POST',
    uri: `${getVariable('apiBaseUrl')}/account-service/accounts`,
    headers: {
      'Authorization': getVariable('qa@viralgains.comAuthToken') // TODO: Make this configurable
    },
    body: {
      'parentAccount': {
        'id': getKnownAccountId(parentAccount),
        'name': parentAccount
      },
      'dsp' : 'APPNEXUS',
      dspLogin,
      dspPassword,
      'name': accountName,
      contactEmail,
      'status': enabledDisabled
    },
    json: true
  };

  return options;
}

/**
 * Creates a new account through the API. This is used for setup purposes
 * @param enabledDisabled. Optional argument indicating if the new Group should be enabled or disabled. Defaults to Enabled.
 * @param accountName Name of the new Account
 * @param contactEmail Email address for the new account
 * @param dspLogin dsp Login for this account
 * @param dspPassword password for the dspLogin
 * @param imageName Name of the logo to upload. This logo must exist under support/json/fixtures. This parameter is optional
 * @param parentAccount Name of the parent account this new account falls under
 * @param done Callback function to execute when finished
 */
module.exports = (enabledDisabled, accountName, contactEmail,  dspLogin, dspPassword, imageName, parentAccount, done) => {
  enabledDisabled = (enabledDisabled === ' disabled') ? 'DISABLED' : 'ENABLED';

  const uniqueAccountName = getUniqueAccountName(accountName);
  const options = getOptions(enabledDisabled, uniqueAccountName, contactEmail, parentAccount);

  if (imageName) {
    browser.call(() => {
      return createAccountWithImage(options, imageName, done);
    });
  }
  browser.call(() => {
    return createAccount(options, done);
  });
};

function getUniqueAccountName(accountName) {
  const date = new Date().getTime();
  const uniqueAccountName = `${accountName}${date}`;

  setVariable('Newest Account Name', uniqueAccountName); // Saves this Accounts name for testing in other steps. This will be overwritten with every Account POST

  return uniqueAccountName;
}


function createAccountWithImage(options, imageName, done) {
  return postMedia(imageName, (logoId) => {
    options.body.logoId = logoId;
    return createAccount(options, done);
  });
}

function createAccount(options, done) {
  return rp(options).then((response) => {

    addApiEntity(options.body.name,'account-service/accounts', response.data.id, getVariable('qa@viralgains.comAuthToken'), true);
    done();
  });
}
