/**
 * Created by adamShanahan on 4/16/18.
 */

// QA_ViralGains happens to have the same ID across all environments. This is because of the way the initial database is seeded.
// Additional IDs will be different, which is why we have tables for each environment.
const environmentAccountIdTables = {
  intAccountIds: {
    'QA_ViralGains': 'afe4f21b-e334-46d7-8ba1-3f80992f18c0'
  },
  localAccountIds: {
    'AdOps' : '8feedaad-a6e7-4b78-ac64-6f658eccf9b2',
    'QA_ViralGains': 'afe4f21b-e334-46d7-8ba1-3f80992f18c0'
  },
  productionAccountIds : {
    'QA_ViralGains': 'afe4f21b-e334-46d7-8ba1-3f80992f18c0'
  }
};

// IDs differ depending on which environment is being used.
let currentAccountIds = null;

module.exports = {
  currentAccountIds,
  getKnownAccountId,
  setKnownAccountIds
};

function getKnownAccountId(accountName) {
  return currentAccountIds[accountName];
}

/**
 * Sets the knownAccountID table based off the current environment
 * @param environment name of the environment for the current script (int, staging)
 */
function setKnownAccountIds(environment) {
  currentAccountIds = environmentAccountIdTables[`${environment}AccountIds`];
}
