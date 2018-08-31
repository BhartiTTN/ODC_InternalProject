/**
 * Created by adamShanahan on 7/20/18.
 */
const {addApiEntity} = require('../../../objects/apiEntities');
const {getVariable, setVariable} = require('../../../../LookupTables/storedVariables');
const rp = require('request-promise');

function getOptions(creativeName, graphId) {
  const options = {
    method: 'POST',
    uri: `${getVariable('apiBaseUrl')}/campaign-service/creativegroups`,
    headers: {
      'Authorization': getVariable('qa@viralgains.comAuthToken') // TODO: Make this configurable
    },
    body: {
      'campaignId' : getVariable('Current Campaign ID'),
      'name': creativeName,
      graphId
    },
    json: true
  };

  return options;
}

module.exports = (creativeName, callback) => {
  const currentGraphId = getVariable('Newest Graph ID');
  const options = getOptions(creativeName, currentGraphId);

  return addCreativeGroupNode(options, callback);
};

function addCreativeGroupNode(options, callback) {
  return rp(options).then((response) => {
    addApiEntity(options.body.name, 'campaign-service/creativegroups', response.data.id, options.headers.Authorization, false);
    setVariable('Newest Node ID', response.data.id); // For use with the nodes patch endpoint
    setVariable('Newest Creative Group ID', response.data.id);
    callback();
  });
}
