/**
 * Created by adamShanahan on 6/14/18.
 */
import checkEmail from '../../support/VGSpecificStepMethods/EmailFunctionality/check/checkEmail';

module.exports = function given() {
  this.Given(
    /^I am logged in to the email account "([^"]*)?"$/,
    checkEmail.setEmailUser
  );
  this.Given(
    /^I open an expired reset password email$/,
    checkEmail.testExpiredPasswordResetEmail
  );
  this.Given(
    /^I open the expired account invitation email for account "([^"]+)"$/,
    checkEmail.testExpiredAccountInvitationEmail
  );

};
