/**
 * Created by adamShanahan on 11/29/17.
 */
import storedVariables from '../../src/support/LookupTables/storedVariables';

// Sets a value in the storedVariable table.
module.exports = (objectName, value, done) =>{
  storedVariables.setVariable(objectName, value);
  done();
};
