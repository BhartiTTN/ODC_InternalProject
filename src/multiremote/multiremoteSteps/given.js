/**
 * Created by adamShanahan on 5/31/18.
 */
import openWebsite from '../../support/action/openWebsite';

module.exports = function given() {

  // Can't use the openCampaignUrl function from postCampaign because it calls waitForLoadingDiv
  this.Given(
    /^Both users are on the canvas screen for the newly created campaign$/,
    (done) => {
      openWebsite(true, 'Current CampaignUrl', done);
    }
  );
};
