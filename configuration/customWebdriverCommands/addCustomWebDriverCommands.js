/**
 * Created by adamShanahan on 12/18/17.
 */
const customSynchronouslyGetTexts = require('./customSynchronouslyGetTexts');
const multiremoteIsVisible = require('./multiremoteIsVisible');
const waitForAllVisible = require('./waitForAllVisible');
const waitForLoadingDivOrModal = require('./waitForLoadingDivOrModal');

module.exports = () => {
  browser.addCommand('highlightElement', (element) => {
    browser.execute((element) => {
      element.style.border = '5px solid black';
    }, element);
  });
  browser.addCommand('waitForClickable', function (selector, timeout) {
    this.waitForVisible(selector, timeout);
    return this.waitForEnabled(selector, timeout);
  });

  // Waits for an element to exist, but doesn't throw an error if it isn't there.
  browser.addCommand('waitForExistNoError', function (selector, timeout) {
    try {
      return this.waitForExist(selector, timeout);
    } catch (e) {
      // Don't throw an error if the element isn't there.
    }
  });

  browser.addCommand('waitForAllVisible', waitForAllVisible);

  // wait for loading div to appear and disappear.
  browser.addCommand('waitForLoadingDivOrModal', waitForLoadingDivOrModal);

  // works with both multiremote and non multiremote
  browser.addCommand('multiremoteIsVisible', multiremoteIsVisible, true);

  // Sometimes Selenium can be overloaded if too many requests are sent asynchronously: https://github.com/webdriverio/webdriverio/issues/2406
  browser.addCommand('customSynchronouslyGetTexts', customSynchronouslyGetTexts);
};

