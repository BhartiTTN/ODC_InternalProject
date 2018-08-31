/**
 * Created by adamShanahan on 5/30/18.
 */
import multiremoteCheckSaveConflict from '../support/check/multiremoteCheckSaveConflict';

module.exports = function when() {
  this.Then(
    /^I expect that "([^"]+)" sees the error message "([^"]+)"$/,
    multiremoteCheckSaveConflict
  );
};
