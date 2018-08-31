/**
 * Created by adamShanahan on 4/13/18.
 */
const {addApiEntity} = require('../../../objects/apiEntities');
const getCampaign = require('./getCampaign');
const {getKnownAccountId} = require('../../../../../fixtures/knownAccountIDs');
const {getVariable, setVariable} = require('../../../../LookupTables/storedVariables');
const openWebsite = require('../../../../action/openWebsite');
const rp = require('request-promise');

function getOptions(campaignName, accountName) {
  const uniqueCampaignName = getUniqueCampaignName(campaignName);

  const options = {
    method: 'POST',
    uri: `${getVariable('apiBaseUrl')}/campaign-service/campaigns`,
    headers: {
      'Authorization': getVariable('qa@viralgains.comAuthToken') // TODO: Make this configurable
    },
    body: {
      'name': uniqueCampaignName,
      'accountId': getKnownAccountId(accountName)
    },
    json: true
  };

  return options;
}

/**
 * Creates a new Campaign through the API. This is used for setup purposes
 * @param campaignName name of the new Campaign
 * @param accountName Name of the Account this Group is under
 * @param openCanvas Opens the campaign canvas page for this campaign if not undefined
 * @param done Function to execute when finished
 */
export default (campaignName, accountName, openCanvas, done) => {
  const options = getOptions(campaignName, accountName);
  const campaignUrl = browser.call(() => {
    return createCampaign(options);
  });

  if (openCanvas) {
    openCampaignUrl(campaignUrl, done);
  }

  done();
};


function getUniqueCampaignName(campaignName) {
  const date = new Date().getTime();
  const uniqueCampaignName = `${campaignName}${date}`;
  setVariable('Newest Campaign Name', uniqueCampaignName); // Saves this campaigns name for testing in other steps. This will be overwritten with every Campaign POST

  return uniqueCampaignName;
}

function createCampaign(options) {
  return rp(options).then((response) => {
    const {accountId, id} = response.data;
    setVariable('Current Campaign ID', id);

    addApiEntity(options.body.name, 'campaign-service/campaigns', id, options.headers.Authorization, true);
    return setCurrentGraphId(id, () => {
      return getCampaignUrl(id, accountId);
    });
  });
}

function setCurrentGraphId(campaignId, callback) {
  return getCampaign(campaignId, (response) => {
    const graphID = response.data.graph.id;
    setVariable('Newest Graph ID', graphID); // Saves this campaigns graphID testing in other steps. This will be overwritten with every Campaign POST
    return callback();
  });
}

function getCampaignUrl(campaignId, accountId) {
  const campaignURL = `/campaign?campaignId=${campaignId}&currentAccountId=${accountId}`;
  setVariable('Current CampaignUrl', campaignURL); // Saves this URL for other steps. Will be overwritten with each post request
  return campaignURL;
}

export function openCampaignUrl(campaignUrl, done) {
  return openWebsite(undefined, campaignUrl, () => {
    browser.waitForLoadingDivOrModal('Loading Messages');
    return done();
  });
}
