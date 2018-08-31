/**
 * Created by adamShanahan on 8/14/17.
 */
import bidRequestJson from '../../../../fixtures/json/bidRequestJson';
import currentRequests from '../../../objects/currentRequests';
import request from 'superagent';

module.exports = {
  makeBidRequestWithParameters,
  makeBidRequestWithConfiguration
};

function makeBidRequestWithParameters(host, userAgent, buyeruid, done) {
  // host = host || 'https://perfrtb.viralgains.com/rtb/Harini_Valid_Exchange_RTB/bid';
  host = host || 'https://qa2.viralgains.com/rtb/spotx/bid';
  userAgent = userAgent || 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:52.0) Gecko/20100101 Firefox/52.0';
  buyeruid = buyeruid || 'BDA7C105-6847-4050-99F8-1407D2C86714';

  const postData = bidRequestJson.getCustomBidRequest(userAgent, buyeruid);
  sendMultiplePostRequests(host, postData, 1000);

  if (done) {
    done();
  }
}

function makeBidRequestWithConfiguration(host, configuration, done) {
  // host = host || 'https://perfrtb.viralgains.com/rtb/Harini_Valid_Exchange_RTB/bid';
  host = host || 'https://qa2.viralgains.com/rtb/spotx/bid';
  const bidDictionary = bidRequestJson.bidRequestDictionary;
  const postData = bidDictionary[configuration];
  sendMultiplePostRequests(host, postData, 1000);

  done();
}

function sendMultiplePostRequests(host, postData, howMany) {
  const requestArray = [];
  for (let i = 0; i < howMany; i++) {
    requestArray.push(request.post(host).type('json').send(JSON.stringify(postData)).set({
      'x-vgdebug': true,
      'x-openrtb-version': 2.3
    }));
  }
  currentRequests.getInstance().setRequestArray(requestArray);
}
