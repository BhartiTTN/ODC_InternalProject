/**
 * Created by adamShanahan on 11/29/17.
 */
const storedVariables = {
};

// Cucumber-Salad commonly stores variables for later use, such as the link in the last opened email,
// or a date appended email address.
// TODO: We should eventually remove all singletons under the objects folder, and use this instead. Can't do that now due to the way currentVastUrl and currentVastId work.

module.exports = {
  getVariable,
  setVariable
};

function getVariable(variableName) {
  return storedVariables[variableName];
}

function setVariable(variableName, value) {
  storedVariables[variableName] = value;
}
