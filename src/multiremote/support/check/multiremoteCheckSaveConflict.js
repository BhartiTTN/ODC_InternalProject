/**
 * Created by adamShanahan on 5/30/18.
 */
import {findElementInTable} from '../../../support/LookupTables/elementLookupTable';

/**
 * Test that a given error message appears for browserB.
 * This test assumes that browserB is trying to save an element that browserA saved first
 * @param clientName           {String}  Name of the multiremote browser to use. Examples: browserA, browserB
 * @param expectedErrorMessage {String}  Expected error message in the popup
 * @param done                {Function} Function to execute when finished
 */
module.exports = (clientName, expectedErrorMessage, done) => {
  const client = browser.select(clientName);
  const errorNotificationSelector = findElementInTable('Error Notification');
  client.waitUntil(()=> clientSeesErrorPopup(client, errorNotificationSelector),client.options.waitforTimeout, 'Second user to save the entity did not see an error message');

  openErrorMessage(client);
  checkErrorMessage(client, expectedErrorMessage);
  done();
};



function clientSeesErrorPopup(client, errorSelector) {
  return client.isVisible(errorSelector);
}

function openErrorMessage(client) {
  const errorDetailsSelector = findElementInTable('Open Error Details');
  client.waitForVisible(errorDetailsSelector);
  client.click(errorDetailsSelector);
}

function checkErrorMessage(client, expectedErrorMessage) {
  const errorDetailsSelector = findElementInTable('Error Details');
  client.waitForVisible(errorDetailsSelector);
  const errorText = client.getText(errorDetailsSelector);

  expect(errorText).to.contain(expectedErrorMessage);
}
