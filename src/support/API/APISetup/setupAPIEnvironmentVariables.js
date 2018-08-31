/**
 * Created by adamShanahan on 5/3/18.
 */
const {setVariable} = require('../../LookupTables/storedVariables');

/**
 * Sets up all environment specific variables
 * @param environment name of the environment for the current script (int, staging)
 */
module.exports = (environment)=> {
  setAPIBaseUrl(environment);
};

function setAPIBaseUrl(environment) {
  switch (environment) {
    case 'production':
      setVariable('apiBaseUrl', `https://odc.kube.viralgains.com/api/v1`);
      break;
    case 'int':
       setVariable('apiBaseUrl', `https://int.kube.viralgains.com/api/v1`);
      break;
    case 'local' :
      setVariable('apiBaseUrl', 'http://localhost:5000/v1');
      break;
  }
}
