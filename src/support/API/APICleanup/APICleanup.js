/**
 * Created by adamShanahan on 4/16/18.
 */
const {apiEntities} = require('../objects/apiEntities');
const {getVariable} = require('../../../support/LookupTables/storedVariables');
const deleteEntity = require('./deleteEntity');

module.exports = {
  cleanupAPIData,
  deleteEntityWithName
};

/**
 * Deletes all API entities marked for deletion (Users, Accounts, Campaigns etc)
 */
function cleanupAPIData() {
  const promises = Object.keys(apiEntities).map((key) => {
    const apiEntity = apiEntities[key];

    if(apiEntity.deleteAtEndOfScenario) {
      return deleteEntity(apiEntity);
    }
    return Promise.resolve();
  });

  return Promise.all(promises);
}

/**
 * Deletes an entity with a given name. This entity must have been created through the API in this Scenario
 * In some cases the name used as a key will have a date appended to it, such as newly created Accounts. This means the name must first
 * found in the storedVariable table
 * @param usingStoredVariable Whether the name of the entity is a stored variable
 * @param name Name of the entity (Group, User, Account, etc) to delete
 * @param done {Function} callback function
 */
function deleteEntityWithName(usingStoredVariable, name, done) {
  name = (usingStoredVariable)? getVariable(name) : name;
  const deletionObject = apiEntities[name];

  browser.call(() => {
    return deleteEntity(deletionObject);
  });
  delete apiEntities[name];
  done();
}
