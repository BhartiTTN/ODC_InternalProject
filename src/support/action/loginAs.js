/**
 * Created by harinikodey on 9/2/17.
 */

module.exports = (email,password, done) => {
  browser.waitForExist('#email');
  browser.setValue('#email', email);
  browser.setValue('#password', password);
  browser.submitForm('#loginForm');

  done();
};
