/**
 * Created by adamShanahan on 8/15/17.
 */
import currentRequests from '../../../objects/currentRequests';
import currentVastUrl from '../../../objects/currentVastUrl';

module.exports = () => {
  const requestArray = currentRequests.getInstance().getRequestArray();

  return testBidResponses(0, requestArray);
};

function testBidResponses(index, requestArray) {
  assert.isBelow(index, requestArray.length, `Sent ${requestArray.length} requests to RTB, and none of them were a success`);

  return requestArray[index].then(response => {
    if (!testBidResponse(response)) {
      return testBidResponses(++index, requestArray); // response failed the test, send another request.
    }
    currentVastUrl.getInstance().setVastUrl(response.body.seatbid[0].bid[0].adm);
  });
}

function testBidResponse(response) {
  return checkResponseCode(response) && checkBidResponse(response);
}

function checkResponseCode(response) {
  return response.statusCode === 200;
}

function checkBidResponse(response) {
  return propertyExists(response.body, 'seatbid[0].bid[0].adm');
}

const arrayRegex = /(.+)\[(.+)\]/;

function propertyExists(obj, path) {
  const ps = path.split('.');

  for (let i = 0; i < ps.length; i++) {
    const mp = ps[i];
    const arrayMP = arrayRegex.exec(mp);

    if (arrayMP) {
      const [, propName, arrayIndex] = arrayMP;

      if (!(propName in obj)) {
        return null;
      }

      obj = obj[propName];

      if (!(arrayIndex in obj)) {
        return null;
      }

      obj = obj[arrayIndex];
    } else {
      if (!(mp in obj)) {
        return null;
      }

      obj = obj[mp];
    }
  }
  return obj;
}
