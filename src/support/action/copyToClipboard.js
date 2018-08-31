/**
 * Created by adamShanahan on 6/12/18.
 */
import clipboardy from 'clipboardy';

/**
 * Copies given text to the clipboard
 * @param text {String}   Text to copy to clipboard
 * @param done {Function} Callback function
 */
module.exports = (text, done) => {
  clipboardy.writeSync(text);

  done();
};
