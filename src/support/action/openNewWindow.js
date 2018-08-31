/**
 * Created by adamShanahan on 10/23/17.
 */
module.exports = (url, done) => {
  browser.newWindow(url);
  done();
};
