/**
 * Check the title of the current browser window
 * @param  {Type}     falseCase     Whether to check if the title matches the
 *                                  expected value or not
 * @param  {Type}     expectedTitle The expected title
 * @param  {Function} done          Function to execute when finished
 */
module.exports = (falseCase, expectedTitle, done) => {

  browser.waitUntil(() => checkEqualsTitle(falseCase, expectedTitle),browser.options.waitforTimeout, `Expected title${falseCase? ' not':''} to be "${expectedTitle}"`);

  done();
};

function checkEqualsTitle(falseCase, expectedTitle) {
  const title = browser.getTitle();
  return (falseCase) ? title !== expectedTitle : title === expectedTitle;
}
