/**
 * Created by adamShanahan on 5/10/18.
 */
const {getVariable,} = require('../../../../LookupTables/storedVariables');
const rp = require('request-promise');

function getOptions(campaignId) {
  const options = {
    method: 'GET',
    uri: getUri(campaignId),
    headers: {
      'Authorization': getVariable('qa@viralgains.comAuthToken') // TODO: Make this configurable
    },
    json: true
  };
  return options;
}

module.exports = (campaignId, callback) => {
  const options = getOptions(campaignId);
  return getCampaign(options, callback);
};

function getUri(campaignId) {
  let uri =  `${getVariable('apiBaseUrl')}/campaign-service/campaigns/`;
  uri += campaignId;
  uri += '?expand=graph';
  return uri;
}

function getCampaign(options, callback) {
  return rp(options).then((response) => {
    return callback(response);
  });
}
