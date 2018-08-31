const {addApiEntity} = require('../../../objects/apiEntities');
const {getVariable, setVariable} = require('../../../../LookupTables/storedVariables');
const rp = require('request-promise');

function getOptions(creativeName, graphId, vastTagUrl, creativeGroupName) {
  const options = {
    method: 'POST',
    uri: `${getVariable('apiBaseUrl')}/campaign-service/creatives`,
    headers: {
      'Authorization': getVariable('qa@viralgains.comAuthToken') // TODO: Make this configurable
    },
    body: {
      'campaignId' : getVariable('Current Campaign ID'),
      'creativeGroupId' : getVariable(creativeGroupName),
      'name': creativeName,
      graphId
    },
    json: true
  };
  attachVideo(options, vastTagUrl);

  return options;
}

function attachVideo(options, vastTagUrl) {
  if (vastTagUrl) {
    options.body.video = {
      'videoType': 'VAST_TAG_URL',
      vastTagUrl
    };
  }
}

/**
 *
 * @param creativeName {String} Name of the new creative
 * @param vastTagUrl {String} vastTagUrl for the video. This argument is optional
 * @param creativeGroupVariableName {String} Name of the stored variable that holds the ID of the creative group this creative falls under. Optional argument
 * @param callback {Function} Function to execute when finished
 */
module.exports = (creativeName, vastTagUrl, creativeGroupVariableName, callback) => {
  const currentGraphId = getVariable('Newest Graph ID');
  const options = getOptions(creativeName, currentGraphId, vastTagUrl,creativeGroupVariableName);

  return addCreativeNode(options, callback);
};

function addCreativeNode(options, callback) {
  return rp(options).then((response) => {
    addApiEntity(options.body.name, 'campaign-service/creatives', response.data.id, options.headers.Authorization, false);
    setVariable('Newest Node ID', response.data.id); // For use with the nodes patch endpoint
    callback();
  });
}
