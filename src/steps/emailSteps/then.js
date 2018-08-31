/**
 * Created by adamShanahan on 6/14/18.
 */
import {testAccountInvitationEmail, testOrganizationInvitationEmail,testResetPasswordEmail} from '../../support/VGSpecificStepMethods/EmailFunctionality/check/checkEmail';

module.exports = function then() {
  this.Then(
    /^I receive an email to join "([^"]*)?" account$/,
    testAccountInvitationEmail
  );

  this.Then(
    /^I receive an email to join "([^"]*)?" organization$/,
    testOrganizationInvitationEmail
  );

  this.Then(
    /^I receive an email to reset my password$/,
    testResetPasswordEmail
  );

};
