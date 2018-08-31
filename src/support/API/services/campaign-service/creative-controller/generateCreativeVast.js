/**
 * Created by adamShanahan on 4/10/18.
 */
import rp from 'request-promise';
import {getVariable,setVariable} from '../../../../LookupTables/storedVariables';

// TODO: Refactor this for just /creatives/{id}/generateVast, and fix the Cucumber mapping

const options = {};
/**
 * Makes an API call to relevant uri and stores the response for later use
 * @param endpointKey Looks up uri in variable table
 * @param responseVariableName Key to store the API response as in the variable table
 * @param done Function to execute when finished
 */
module.exports = (endpointKey, responseVariableName,  done) => {
  const uri = getVariable(endpointKey);
  options.uri = uri;

  makeAPICall(responseVariableName, done);
};

function makeAPICall(responseVariableName,done) {
  return rp(options).then((repos) => {
    setVariable(responseVariableName, repos);

    done();
  }).catch((err) => {
    throw err;
  });
}
