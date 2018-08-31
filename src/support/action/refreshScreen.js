/**
 * Created by adamShanahan on 7/24/18.
 */

/**
 * Refreshes the screen, and potentially accepts an alert
 * @param acceptAlert {String}   Accepts an alert after refreshing the page if set
 * @param done        {Function} Callback function to execute when finished
 */
module.exports = (acceptAlert, done) => {
  browser.refresh();

  if(acceptAlert) {
    handlePopup();
  }
  done();
};


function handlePopup() {
  try {
    browser.alertAccept();
  } catch (e) {
    // no alert found
  }
}


