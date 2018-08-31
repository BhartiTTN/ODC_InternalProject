/**
 * Created by adamShanahan on 6/1/18.
 */

// Overwriting Webdriver's isVisible method to work with multiconfig
module.exports = (selector) => {
  if (usingMultiremote()) {
    return browserA.isVisible(selector);
  }
  return browser.isVisible(selector);
};

// Webdriver returns an object of { browserA: title, browserB: title} if multiremote is running
function usingMultiremote() {
  return typeof browser.getTitle() === 'object';
}
