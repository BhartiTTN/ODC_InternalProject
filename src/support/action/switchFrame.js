/**
 * Created by adamShanahan on 7/31/17.
 */
const traversalFunctions = {
  'engagement card'() {
    switchToFrame('iframe:not([id])');
  },
  'YouTube Video'() {
    switchToYouTube();
  },
  'GoogleFrame'() {
    switchToFrame('iframe.inherit-locale');
  },
  'YouTubeGVVideo'() {
    switchToYouTubeGV();
  },
  'player'() {
    switchToFrame('.playerIframe');
  }
};

function switchToFrame(selector) {
  browser.waitForExist(selector);
  const frame = $(selector).value;
  browser.frame(frame);
}

function switchToYouTube() {
  switchToFrame('iframe:not([id])');
  switchToFrame('iframe#player');
}

function switchToYouTubeGV() {
  switchToFrame('iframe.inherit-locale');
  switchToFrame('iframe'); // gtFrame
  switchToFrame('iframe:not([id])'); // innerFrame
  switchToYouTube();
}

/*
Harini this is for you:
 var outerHTML = browser.getHTML('iframe'); // find the elements that match a query (in this case, iframe) and return their HTML in the console.
 console.log(outerHTML);
*/

/**
 *Steps into the given IFrame
 *@param {String} frame IFrame to step into
 */
module.exports = (frame, done) => {
  browser.frame(); // reset to outer window

  const traversalFunction = traversalFunctions[frame];
  expect(traversalFunction).not.to.equal(undefined, `Requested frame to switch to is unknown ${frame}`);
  traversalFunction();

  done();
};
