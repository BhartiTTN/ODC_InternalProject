/**
 * Created by adamShanahan on 6/12/18.
 */

import clickElement from '../../../action/clickElement';
import mousehoverOnElement from '../../../action/moveToElement';

/**
 * Open an existing targeting node on the canvas page for editing
 * @param done {Function} Callback Function
 */
module.exports = (done) => {
  mousehoverOnElement('Targeting__moreIcon', 'obsolete', ' ', ' ', () => {
    mousehoverOnElement('Targeting__controlsCover', 'obsolete', '50', '60', () => {
      clickElement('click', 'Targeting__editIcon', done);
    });
  });
};
