/**
 * Created by adamShanahan on 9/27/17.
 */
import configFile from '../../../configuration/wdio.conf';

module.exports = {
  compareEntireScreen,
  compareElements
};

function compareEntireScreen(screenshotName, done) {
  configFile.setScreenshotTestName(screenshotName);
  const report = browser.checkDocument({});
  assertDiff(report,screenshotName);

  done();
}

function compareElements(element, screenshotName, done) {
  configFile.setScreenshotTestName(screenshotName);
  const report = browser.checkElement(element, {});
  assertDiff(report,screenshotName);

  done();
}

function assertDiff(results, screenshotName) {
  results.forEach((result) => assert.ok(result.isExactSameImage, `Expected screenshot ${screenshotName} to match reference screenshot`));
}
