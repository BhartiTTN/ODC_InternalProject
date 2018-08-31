import {getVariable} from '../LookupTables/storedVariables';

/**
 * Open the given URL
 * @param  {String}   usingStoredVariable Indicates if page refers to the name of a stored variable that holds the url, or the actual string value of the url to open
 * @param  {String}   page The Stored value URL to navigate to
 * @param  {Function} done Function to execute when finished
 */
module.exports = (usingStoredVariable, page, done) => {
  page = (usingStoredVariable) ? getVariable(page) : page;

  browser.url(page);

  browser.pause(3000); // Gives browser time to load new page.

  done();
};
