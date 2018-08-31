/**
 * Created by adamShanahan on 6/14/18.
 */
import {addCreativeToCreativeGroup} from '../../support/API/services/campaign-service/creative-controller/patchCreative';
import patchNode from '../../support/API/services/campaign-service/node-controller/patchNode';
import postAccount from '../../support/API/services/account-service/account-controller/postAccount';
import postCampaign, {openCampaignUrl} from '../../support/API/services/campaign-service/campaign-controller/postCampaign';
import postCreative from '../../support/API/services/campaign-service/creative-controller/postCreative';
import postCreativeGroup from '../../support/API/services/campaign-service/creative-group-controller/postCreativeGroup';
import postGroup from '../../support/API/services/account-service/group-controller/postGroup';
import postMembership from '../../support/API/services/account-service/membership-controller/postMembership';
import postReport from '../../support/API/services/reporting-service/report-config-controller/postReport';
import {getVariable} from '../../support/LookupTables/storedVariables';

module.exports = function given() {
  this.Given(
    /^I have a(n enabled| disabled)? Group named "([^"]+)" under Account "([^"]+)" with(?: (stored))? user emails "([^"]*)?" and permissions "([^"]*)?"$/,
    postGroup
  );
  this.Given(
    /^I have a Campaign named "([^"]+)" under Account "([^"]+)"( and I am on the canvas screen)?$/,
    postCampaign
  );
  this.Given(
    /^I am on the canvas screen for the newly created campaign$/,
    (done) => {
      openCampaignUrl(getVariable('Current CampaignUrl'), done);
    }
  );

  this.Given(
    /^that Campaign has a Creative Node named "([^"]+)"(?: with vast tag url "([^"]+)")?(?: under creative group "([^"]+)")?$/,
    postCreative
  );

  this.Given(
    /^The creative "([^"]+)" is added to creative group "([^"]+)"$/,
    addCreativeToCreativeGroup
  );

  this.Given(
    /^that Campaign has a Creative Group Node named "([^"]+)"$/,
    postCreativeGroup
  );

  this.Given(
    /^That "([^"]+)" node is updated to be named "([^"]+)", and have x position "([^"]+)" and y position "([^"]+)"$/,
    patchNode
  );

  this.Given(
    /^I have a(n enabled| disabled)? Account named "([^"]+)" with contact email "([^"]+)" dsp login "([^"]+)" dsp password "([^"]+)" (?:and image "([^"]+)" )?under parent account "([^"]+)"$/,
    postAccount
  );
  this.Given(
    /^I have a user named "([^"]+)" with email "([^"]+)" and password "([^"]+)" under account "([^"]+)"$/,
    postMembership.createUserAndAcceptInvite
  );

  this.Given(
    /^I have a report named "([^"]+)" under Account "([^"]+)" with dimensions "([^"]+)" and metrics "([^"]+)"(?: and I am on the (edit|view report) screen)?$/,
    postReport
  );

};
