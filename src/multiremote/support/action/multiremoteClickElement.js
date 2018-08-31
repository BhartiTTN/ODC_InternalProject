/**
 * Created by adamShanahan on 5/30/18.
 */
import {findElementInTable} from '../../../support/LookupTables/elementLookupTable';
/**
 * Performs a click action for a particular multiremote browser.
 * This step method does not wait for loading divs and modals to disappear after clicking. This is because it often tests for unexpected behavior, like modals staying open
 * after clicking on save due to an error.
 * @param  {String}   clientName name of the multiremote browser to use. Examples: browserA, browserB
 * @param  {String}   clickType click or doubleClick
 * @param  {String}   selectorKey key for selector lookup table
 * @param  {Function} done    Function to execute when finished
 */

module.exports = (clientName, clickType,selectorKey, done) => {
  const selector = findElementInTable(selectorKey);
  const client = browser.select(clientName);
  client.waitForVisible(selector);

  const method = (clickType === 'click') ? 'click':'doubleClick';

  client[method](selector);
  done();
};
