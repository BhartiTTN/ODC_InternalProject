/**
 * Created by harinikodey on 01/22/18.
 */

import clickElement from '../../../action/clickElement';
import setElement from '../../../action/setElement';
import clearInputField from '../../../action/clearInputField';

/**
 * Enters start Date, End Date, and Timezone values on the Delivery popup of the campaign canvas
 * @param {String}    startDateValue text to enter Start Date
 * @param {String}    endDateValue text to enter End Date
 * @param  {Function} done    Function to execute when finished
 */

module.exports = (startDateValue, endDateValue, done) => {
  const Start_Date = 'Start Date';
  const End_Date = 'End Date';

  fillDate(Start_Date, startDateValue, () => {
    fillDate(End_Date, endDateValue, () => {
      selectTimeZone(done);
    });
  });

};

function fillDate(selectorKey, date, callBack) {
  clickElement('click', selectorKey, () => {
    clearInputField(selectorKey, () => {
      setElement('set', date, selectorKey, callBack);
    });
  });
}

function selectTimeZone(callBack) {
  clickElement('click', 'Calender Timezone', () => {
    clickElement('click', 'Calender Timezone Value', callBack);
  });
}
