/**
 * Created by harinikodey on 01/29/18.
 */

import clickElement from '../../../action/clickElement';
import setInputFieldWithDateAppended from '../../../action/setInputFieldWithDateAppended';
import storeValueFromElementOrInputField from '../../../action/storeValueFromElementOrInputField';

/**
 * Create Campaign and Click on the Newly Created Campaign Name link to navigate to Creative Page in the Feature Files
 * @param {String}    newCampaignName Name of the new campaign
 * @param  {Function} done    Function to execute when finished
 */

module.exports = (newCampaignName, done) => {

  goToCampaignPage(() => {
    createCampaign(newCampaignName, () => {
      openNewCampaign(done);
    });
  });
};


function goToCampaignPage(callBack) {
  clickElement('click', 'Campaign Management', callBack);
}

function createCampaign(campaignNameValue, callBack) {
  const campaignNameSelector = 'Campaign Name';

  clickElement('click', 'New Campaign', () => {
    setInputFieldWithDateAppended('setValue', campaignNameValue, campaignNameSelector, () => {
      storeValueFromElementOrInputField('inputfield', campaignNameSelector, 'New Campaign Name', () => {
        clickElement('click', 'Save', callBack);
      });
    });
  });
}

function openNewCampaign(callBack) {
  clickElement('click', 'Campaign Name Link', callBack);
}

