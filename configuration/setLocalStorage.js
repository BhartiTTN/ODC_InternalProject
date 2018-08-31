/**
 * Created by adamShanahan on 5/24/18.
 */

module.exports = (key, value) => {
  if (noUrlOpen()) {
    openODCSite();
  }

  browser.localStorage('POST', {key, value});
};


function noUrlOpen() {
  const url = browser.getUrl();

  if (usingMultiRemote(url)) {
    return anyBrowserHasNoUrlOpen(url);
  }

  return url === 'data:,';
}


function anyBrowserHasNoUrlOpen(url) {
  return Object.keys(url).some((key) => {
    return url[key] === 'data:,';
  });
}

function openODCSite() { // ODC must be open to set tokens
  browser.url('/');
  browser.alertAccept();
}


function usingMultiRemote(url) {
  return typeof url === 'object';
}
