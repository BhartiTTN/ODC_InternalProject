/**
 * Created by adamShanahan on 7/12/18.
 */
const {getVariable} = require('../../LookupTables/storedVariables');
const rp = require('request-promise');

const options = {
  method: 'DELETE',
  json: true,
  headers: {}
};


module.exports = (deletionObject)=> {
  options.uri = `${getVariable('apiBaseUrl')}/${deletionObject.endpoint}/${deletionObject.id}`;
  options.headers.Authorization = deletionObject.authToken;

  return rp(options);
};
