import bidResponseDataContent from './bidResponseData.json';
import customBidRequest from './customBidRequest.json';
import noBidResponseDataContent from './noBidResponseData.json';

const bidRequestDictionary = {
// rtb should response with a bid
  bidResponseData : bidResponseDataContent,
  // RTB should not respond with a bid
  noBidResponseData : noBidResponseDataContent
};

module.exports = {
  bidRequestDictionary,
  getCustomBidRequest
};

function getCustomBidRequest(userAgent, buyeruid) {
  const newBidRequest = JSON.parse(JSON.stringify(customBidRequest));
  newBidRequest.device.ua = userAgent;
  newBidRequest.user.buyeruid = buyeruid;
  return newBidRequest;
}
