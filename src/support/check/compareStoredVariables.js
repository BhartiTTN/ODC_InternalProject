/**
 * Created by adamShanahan on 11/29/17.
 */
import {getVariable} from '../LookupTables/storedVariables';

module.exports = {
  compareNumbers,
  compareStrings,
};

/**
 * Compares string variables that have been stored under src/support/objects/
 * @param firstVariableName Name of first stored variable
 * @param secondVariableName Name of the second stored variable
 * @param done
 */
function compareStrings(firstVariableName, secondVariableName, done) {
  const firstValue = getVariable(firstVariableName);
  const secondValue = getVariable(secondVariableName);
  expect(firstValue).to.equal(secondValue, `Expected ${firstValue} to equal ${secondValue}`);
  done();
}

/**
 * Compares numerical variables that have been stored under src/support/objects/
 * @param firstVariableName Name of first stored variable
 * @param difference
 * @param equalMoreOrLess
 * @param secondVariableName
 * @param done
 */
function compareNumbers(firstVariableName, difference, equalMoreOrLess, secondVariableName, done) {
  difference = parseInt(difference, 10) || 0;
  difference = equalMoreOrLess === 'less than' ? difference * -1 : difference;
  const firstNumber = getNumberFromName(firstVariableName);
  const secondNumber = getNumberFromName(secondVariableName);

  expect(firstNumber).to.equal(secondNumber + difference, `${firstVariableName} was ${firstNumber}, ${secondVariableName} was ${secondNumber}`);
  done();
}


function getNumberFromName(variableName) {
  const storedValue = getVariable(variableName);

  if (typeof storedValue === 'number') {
    return storedValue;
  }

  const stringWithoutCommas = storedValue.replace(/,/g, '');
  return parseInt(stringWithoutCommas,10);
}
