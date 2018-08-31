/**
 * Created by adamShanahan on 10/23/17.
 */
import getProperty from '../action/getProperty';
import openNewWindow from '../action/openNewWindow';

module.exports = (isCSS, attrName, elem, done) => {
  getProperty(isCSS, attrName, elem, (url) => {
    openNewWindow(url, done);
  });
};
