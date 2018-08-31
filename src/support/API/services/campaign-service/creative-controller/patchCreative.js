/**
 * Created by adamShanahan on 7/26/18.
 */
const {apiEntities} = require('../../../objects/apiEntities');
const {getVariable} = require('../../../../LookupTables/storedVariables');
const rp = require('request-promise');

function getOptions(id, creativeGroupId) {
  const options = {
    method: 'PATCH',
    uri: `${getVariable('apiBaseUrl')}/campaign-service/creatives/${id}`,
    headers: {
      'Authorization': getVariable('qa@viralgains.comAuthToken') // TODO: Make this configurable
    },
    body: {
      'campaignId': getVariable('Current Campaign ID'),
      creativeGroupId,
      version: 0 // TODO: This only allows patching one time per creative
    },
    json: true
  };

  return options;
}


module.exports = {
  addCreativeToCreativeGroup
};

/**
 * Adds an existing Creative to an existing Creative Group. Both of these entities must have been created through the API in cucumber-salad.
 * @param {String}   creativeName Name of the creative. Used to look up apiObject
 * @param {String}   creativeGroupName  Name of the stored variable that holds the ID of the creative group this creative falls under. Optional argument
 * @param {Function} done  Function to execute when finished
 */
function addCreativeToCreativeGroup(creativeName, creativeGroupName, done) {
  const creativeId = apiEntities[creativeName].id;
  const creativeGroupId = apiEntities[creativeGroupName].id;

  const options = getOptions(creativeId, creativeGroupId);

  return patchCreativeNode(options, done);
}


function patchCreativeNode(options, callback) {
  return rp(options).then(() => {
    callback();
  })
}
