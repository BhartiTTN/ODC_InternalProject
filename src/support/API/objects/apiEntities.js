/**
 * Created by adamShanahan on 7/26/18.
 */

/**
 * Dictionary of apiEntities. The names of the entities (User, Account, Report, etc) is the key for this dictionary.
 */
const apiEntities = {};

module.exports = {
  addApiEntity,
  apiEntities
};


function addApiEntity(key, endpoint, id, authToken, deleteAtEndOfScenario) {
  const newAPIEntity = new apiEntity(endpoint, id, authToken, deleteAtEndOfScenario);
  apiEntities[key] = newAPIEntity;
}

/**
 * Holds information about an entity that was created through the API.
 * @param endpoint              {String} endpoint used to delete, get, patch entity (account-service/accounts, account-service/users, campaign-service/campaigns etc)
 * @param id                    {String} ID of the Campaign, Account, User, or Group
 * @param authToken             {String} authorization token for entity
 * @param deleteAtEndOfScenario {Boolean} Marks entity for automatic deletion at the end of this scenario
 * @constructor
 */
function apiEntity(endpoint, id, authToken, deleteAtEndOfScenario) {
  this.endpoint = endpoint;
  this.id = id;
  this.authToken = authToken;
  this.deleteAtEndOfScenario = deleteAtEndOfScenario
}
