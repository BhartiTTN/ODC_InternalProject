/**
 * Check the title of the current browser window to see if it contains a given text
 * @param  {Type}     containsTitle The text to check if contained in title
 * @param  {Function} done          Function to execute when finished
 */
module.exports = (expectedTitle, done) => {
  /**
     * The title of the current browser window
     * @type {String}
     */
  const title = browser.getTitle();
  expect(title).to.include(expectedTitle, `Expected title to contain "${expectedTitle}" but found "${title}"`);

  done();
};
