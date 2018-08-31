import storeValue from '../testActions/storeValue';

module.exports = function when() {
  this.When(
    /^I set stored value "([^"]+)" to "([^"]+)"$/,
    storeValue
  );
};
