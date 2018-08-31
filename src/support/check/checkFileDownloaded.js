/**
 * Created by adamShanahan on 5/15/18.
 */
import {getVariable} from '../LookupTables/storedVariables';

/**
 * ONLY WORKS WITH CHROME
 * Tests that a file with a given name is at the top of the download list on "chrome://downloads/"
 * @param usingStoredVariable {String} Indicates if fileName is a stored variable
 * @param fileName            {String} name of the file
 * @param done                {Function} Function to execute when finished
 */
module.exports = (usingStoredVariable, fileName, done) => {
  fileName = (usingStoredVariable)? `${getVariable(fileName)}.csv` : fileName;

  browser.url('chrome://downloads/');
  browser.waitForVisible('downloads-manager');

  let mostRecentFileName = getNameOfMostRecentlyDownloadeFile();
  mostRecentFileName = removefileDuplicationNumber(mostRecentFileName);

  expect(fileName).to.equal(mostRecentFileName);

  done();
};

function getNameOfMostRecentlyDownloadeFile() {
  return browser.execute(() => {
    const name = document.querySelector('downloads-manager').shadowRoot.querySelector('downloads-item').shadowRoot.querySelector('[is=action-link]').firstChild.textContent;
    return name;
  }).value;
}

// Example: Change FILENAME(55).csv to FILENAME.csv
function removefileDuplicationNumber(fileName) {
  return fileName.replace(/ \(\d+\)/,'');
}
