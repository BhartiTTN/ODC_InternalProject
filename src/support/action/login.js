import {findElementInTable} from '../LookupTables/elementLookupTable';
import {getVariable} from '../LookupTables/storedVariables';


const logInTable = {
  'Facebook': logIntoFacebook,
  'Gmail': logIntoGmail,
  'QA2': logIntoOldVG,
  'QA3': logIntoOldVG,
  'Twitter': logIntoTwitter,
  'ODC':logIntoODC,
  'ODC UAT':logIntoODCAsOPs,

};

module.exports = (site, usingStoredUserName, user, password, done) => {
  user = (usingStoredUserName) ? getVariable(user) : user;

  const loginFunction = logInTable[site];
  if (loginFunction === logIntoOldVG) {
    logIntoOldVG(site);
    done();
    return;
  }
  loginFunction(user, password);
  done();
};

function logIntoOldVG(site) {
  browser.url(`https://${site}.viralgains.com/vg/`);

  const emailField = '#email';

  if (notLoggedIn(emailField)) { // Checking if already logged in.
    browser.setValue(emailField, 'hkodey@viralgains.com');
    browser.setValue('#password', 'sairam1.1');
    browser.submitForm('#loginForm');
  }
}

function logIntoODC(email, password) {
  browser.url('/');

  email = email || 'qa@viralgains.com';
  password = password || 'mypassword';
  const emailField = '[name=\'email\']';
  const passwordField = '[name=\'password\']';
  const submit = 'button[type=\'submit\']';

  browser.waitForVisible(emailField);

  browser.setValue(emailField, email );
  browser.setValue(passwordField, password);
  browser.click(submit);
  browser.waitForVisible(findElementInTable('Public groups'));
}

function logIntoODCAsOPs(email, password) {
  browser.url('/');

  email = email || 'eng+adops@viralgains.com';
  password = password || 'mypassword';
  const emailField = '[name=\'email\']';
  const passwordField = '[name=\'password\']';
  const submit = 'button[type=\'submit\']';

  browser.waitForVisible(emailField);

  browser.setValue(emailField, email );
  browser.setValue(passwordField, password);
  browser.click(submit);
  browser.waitForVisible(findElementInTable('Public groups'));
}

function logIntoFacebook() {
  browser.url('https://en-gb.facebook.com/login/');
  const emailField = '[name="email"]';

  if (notLoggedIn(emailField)) {
    browser.setValue(emailField, 'viralgainstestemail@gmail.com');
    browser.setValue('[name="pass"]', 'nerfguncup7');
    browser.submitForm('#loginbutton');
  }
}

function logIntoGmail() {
  browser.url('https://www.google.com/gmail/');
  const emailField = '#identifierId';
  const passwordField = '#password input';

  if (notLoggedIn(emailField)) {
    browser.setValue(emailField, 'viralgainstestemail@gmail.com');
    browser.click('#identifierNext');
    browser.waitForVisible(passwordField);
    browser.setValue(passwordField, 'nerfguncup7');
    browser.click('#passwordNext');
    browser.waitForVisible('#gbq1');
  }
}

function logIntoTwitter() {
  browser.url('https://twitter.com/login');
  const logInField = '.js-username-field';

  if (notLoggedIn(logInField)) {
    browser.setValue(logInField, 'ViralGainsTest');
    browser.setValue('.js-password-field', 'nerfguncup7');
    $('button.submit').submitForm();
  }
}

function notLoggedIn(LogInFieldSelector) {
  return browser.isVisible(LogInFieldSelector);
}
