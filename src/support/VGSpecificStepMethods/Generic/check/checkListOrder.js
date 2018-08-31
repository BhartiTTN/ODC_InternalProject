/**
 * Created by adamShanahan on 3/6/18.
 */
import {getVariable} from '../../../LookupTables/storedVariables';
import {findElementInTable} from '../../../LookupTables/elementLookupTable';

/**
 * Compares the text of each element in a list to a given list of text
 * @param listType {String} Type of list elements exist under. Used to grab elements in the list
 * @param expectedOrderString {String} comma separated list of the expected order of elements
 * @param delimiter {String} Delminator to split up the list of text. Defaults to ,
 * @param done {Function} Function to execute when finish
 */
module.exports = (listType, expectedOrderString, delimiter = ',', done) => {

  const expectedOrder = expectedOrderString.split(delimiter).map((item) => {
    return item.trim();
  });

  const listSelector = findElementInTable(listType);
  browser.waitForVisible(listSelector);
  const orderedArray = getOrderedElements(listSelector);


  assert.equal(orderedArray.length,expectedOrder.length, `There were ${orderedArray.length} elements, expected there to be ${expectedOrder.length} elements. Expected ${orderedArray} to equal ${expectedOrder}`);

  checkOrder(expectedOrder, orderedArray);

  done();
};

function checkOrder(expectedOrder, actualOrder) {
  actualOrder.forEach((element, index) => {
    const expectedText = getElementString(expectedOrder[index]);
    expect(element).to.equal(expectedText);
  });
}

// Grabs element from lookup table if it's in stored value format "Stored Value: <Name Of Stored Variable>".
function getElementString(elementString) {
  if (elementString.includes('Stored Value: ')) {
    const storedValueName = elementString.substring(14); // Grabbing after ": "
    return getVariable(storedValueName);
  }
  return elementString;
}

function getOrderedElements(listSelector) {
  const orderedElements = browser.getText(listSelector);
  const orderedArray = (Array.isArray(orderedElements))? orderedElements : [orderedElements];
  return orderedArray;
}
