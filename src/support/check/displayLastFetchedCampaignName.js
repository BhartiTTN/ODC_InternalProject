/**
 * Created by adamShanahan on 11/29/17.
 */
import {getVariable} from '../LookupTables/storedVariables';

module.exports = (done) => {

  const lastCampaignName = getVariable("LastCampaignNameValue");
  console.log("Last Campaign name present on Last Page is: " + lastCampaignName);
  done();
};




