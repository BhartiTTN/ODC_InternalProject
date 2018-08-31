/**
 * Created by adamShanahan on 7/6/18.
 */

module.exports = (selector) => {
  $$(selector).map(el => el.getText());
};

