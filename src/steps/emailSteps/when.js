/**
 * Created by adamShanahan on 6/14/18.
 */
import openWebsite from '../../support/action/openWebsite';

module.exports = function when() {
  this.When(
    /^I click on the email link$/,
    (done) => {
      openWebsite(true, 'currentEmailLink', done);
    }
  );
};
