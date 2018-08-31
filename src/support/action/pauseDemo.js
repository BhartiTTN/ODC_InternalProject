/**
 * Created by harinikodey on 9/30/17.
 */
/**
 * Pause execution for a given number of milliseconds
 * @param  {String}   ms   Number of milliseconds to pause
 * @param  {Function} done Function to execute when finished
 */
module.exports = (ms, done) => {
  /**
   * Number of milliseconds
   * @type {Int}
   */

  const time = ms || 2000;

  // Future reference  : To send milli seconds from feature files- update module.exorts with another param : ms
  // const intMs = parseInt(ms, 10);

  if (browser.options.demopause) {
    browser.pause(time);
  }

  done = done || ms;

  done();
};
