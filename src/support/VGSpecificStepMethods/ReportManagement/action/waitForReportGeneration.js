/**
 * Created by adamShanahan on 7/3/18.
 */

module.exports = (done) => {
  waitForReportGeneration();
  done();
};


function waitForReportGeneration() {
  while (!isReportGenerated()) {
    browser.refresh();
    acceptAlert();
    browser.pause(5000);
  }
}


function acceptAlert() {
  try {
    browser.alertAccept();
  } catch (e) {
    // no alert found
  }
}

function isReportGenerated() {
  return browser.isExisting('.ReactTable');
}

