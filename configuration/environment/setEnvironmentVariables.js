/**
 * Sets baseUrl to staging if a Scenario is marked as regression.
 * @param scenario
 */
const {setKnownAccountIds} = require('../../src/fixtures/knownAccountIDs');
const setupAPIEnvironmentVariables = require('../../src/support/API/APISetup/setupAPIEnvironmentVariables');

module.exports = (environment) => {
  environment = environment || 'int';

  setEnvironmentVariables(environment);
};

function setEnvironmentVariables(environment) {
  setBaseUrl(environment);

  setupAPIEnvironmentVariables(environment);

  setKnownAccountIds(environment);
}

function setBaseUrl(environment) {
  switch (environment) {
    case 'production':
      browser.options.baseUrl = 'https://odc-ui.kube.viralgains.com';
      break;
    case 'int':
      browser.options.baseUrl = 'https://odc-ui.int.kube.viralgains.com';
      break;
    case 'local' :
      browser.options.baseUrl = 'http://localhost:3003/'; // TODO: Might not always be 3003
      break;
  }
}

