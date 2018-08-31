/**
 * Created by adamShanahan on 5/30/18.
 */
import multiremoteClickElement from '../support/action/multiremoteClickElement';
import multiremoteSetElement from '../support/action/multiremoteSetElement';

module.exports = function when() {
  this.When(
    /^"([^"]*)?" (click|doubleClick)s on (?:the )?"([^"]*)?"$/,
    multiremoteClickElement
  );

  this.When(
    /^"([^"]*)?" (add|set)s "([^"]*)?" to "([^"]*)?"$/,
    multiremoteSetElement
  );
};
