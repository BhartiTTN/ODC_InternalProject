/**
 * Created by adamShanahan on 5/24/18.
 */
import {findElementInTable} from '../../../LookupTables/elementLookupTable';
import {getVariable} from '../../../LookupTables/storedVariables';
import {getKnownAccountId} from '../../../../fixtures/knownAccountIDs';
/**
 * Navigates to a particular ODC page using a given account
 * @param tab {String} Which tab of a page to go to. Required for pages with tabs, not used otherwise. Examples: Groups, Users, Creatives
 * @param page {String} Which ODC page to navigate to. Examples: account management, campaign management, report builder
 * @param usingNewestCampaign {String} Optional argument. Sets the campaignID parameter to the newest campaign id created through the POST Campaign step method.
 * @param account {String} Name of the account being used. Determines the accountId in the url. Necessary for most pages
 * @param done {Function} Callback function to execute when finished
 */
module.exports = (tab, page, usingNewestCampaign, account, done) => {
  const ODCUrl = getODCUrl(tab, page, usingNewestCampaign, account);
  browser.url(ODCUrl);

  handlePopupsAndLoadingDivs();

  done();
};

function getODCUrl(tab, page, usingNewestCampaign, account) {
  const {baseUrl} = browser.options;
  const formattedPage = getFormatedPage(page);
  tab = (tab)? `/${tab}`: '';

  const accountId = (account)? `?currentAccountId=${getKnownAccountId(account)}` : '';
  const campaignId = (usingNewestCampaign)? `&campaignId=${getVariable('Current Campaign ID')}`: '';

  return `${baseUrl}/${formattedPage}${tab}${accountId}${campaignId}`;
}

function getFormatedPage(page) { // ODC paths have dashes between words
  return page.replace(' ','-');
}

function handlePopupsAndLoadingDivs() {
  handlePopups();
  const selector = findElementInTable('Loading Messages');
  browser.waitForLoadingDivOrModal(selector);
}

function handlePopups() {
  if (browser.alertText()) {
    browser.alertAccept();
  }
}
