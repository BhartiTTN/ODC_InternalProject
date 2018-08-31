/**
 * Created by adamShanahan on 6/14/18.
 */
import {deleteEntityWithName} from '../../support/API/APICleanup/APICleanup';
import generateCreativeVast from '../../support/API/services/campaign-service/creative-controller/generateCreativeVast';

module.exports = function when() {
  this.When(
    /^I make an API call to the endpoint named with stored variable "([^"]+)" and store the response as "([^"]+)"$/,
    generateCreativeVast
  );

  this.When(
    /^The "[^"]+" named (with stored variable )?"([^"]+)" is deleted$/,
    deleteEntityWithName
  );
};
