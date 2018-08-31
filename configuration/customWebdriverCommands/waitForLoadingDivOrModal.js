/**
 * Created by adamShanahan on 6/1/18.
 */

// wait for loading div to appear and disappear.
module.exports = (selector) => {
  const currentScreenshotPath = browser.options.screenshotPath;
  browser.options.screenshotPath = null; // turn off error screen shots for the try catch

  try {
    waitForVisible(selector);
  } catch (e) {
    // Don't throw an error if the loading div disappears before the waitForVisible check is ran. QA-184
  }
  browser.options.screenshotPath = currentScreenshotPath; // turn screenshots back on
  browser.waitForAllVisible(selector, browser.options.waitforTimeout, true); // ODC-604
};

function waitForVisible(selector) {
  if (usingMultiremote()) {
    multiremoteWait(selector);
    return;
  }
  browser.waitForVisible(selector, 4000);
}

// Webdriver returns an object of { browserA: title, browserB: title} if multiremote is running
function usingMultiremote() {
  return typeof browser.getTitle() === 'object';
}

function multiremoteWait(selector) {
  browserA.waitForVisible(selector, 4000);
  browserB.waitForVisible(selector, 4000);
}
