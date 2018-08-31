/**
 * Created by adamShanahan on 5/30/18.
 */
const {getVariable} = require('../../../../LookupTables/storedVariables');
const rp = require('request-promise');

function getOptions(type, name, id, graphId, positionX, positionY) {
  const options = {
    method: 'PATCH',
    uri: `${getVariable('apiBaseUrl')}/campaign-service/nodes/${id}`,
    headers: {
      'Authorization': getVariable('qa@viralgains.comAuthToken') // TODO: Make this configurable
    },
    body: {
      'campaignId' : getVariable('Current Campaign ID'),
      type,
      name,
      graphId,
      positionX,
      positionY
    },
    json: true
  };
  return options;
}

/**
 * Currently used to update a Node's X and Y position. Type and Name are required parameters
 * @param type {String} Node Type. Examples: Creative, Targeting, etc
 * @param name {String} Name of the node
 * @param positionX {String} New X position on the canvas
 * @param positionY {String} New Y position on the canvas
 * @param callback {Function} Function to be executed when finished
 */
module.exports = (type, name, positionX, positionY, callback) => {
  const id = getVariable('Newest Node ID');
  const currentGraphId = getVariable('Newest Graph ID');
  const options = getOptions(type, name,id, currentGraphId, positionX, positionY);
  return patchNode(options, callback);
};

function patchNode(options, callback) {
  return rp(options).then(() => {
    callback();
  });
}
