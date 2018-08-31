/**
 * Created by adamShanahan on 2/7/18.
 */
import elementLookupTable from '../LookupTables/elementLookupTable';

/**
 * Check if the given elements contains the current date, hour, or minute
 * @param  {String}   type          Type of element (inputfield or element)
 * @param  {String}   selectorKey   Key for Selector Lookup table
 * @param  {String}   falseCase     Whether to check if the content contains the given date or not
 * @param  {String}   valueType     type of expected date: current date, current hour, current minute
 * @param  {Function} done          Function to execute when finished
 */

module.exports = (type, selectorKey, falseCase, valueType, done) => {
  const element = elementLookupTable.findElementInTable(selectorKey);
  const command = (type !== 'inputfield') ? 'getText' : 'getValue';

  browser.waitForVisible(element);
  const text = browser[command](element);

  const dateTest = getDateTest(valueType);
  dateTest(text, falseCase);

  done();
};

function getDateTest(testType) {
  const tests = {
    'date': (text, falseCase) => testDate(text, falseCase),
    'hour': (text, falseCase) => testHour(text, falseCase),
    'minute': (text, falseCase) => testMinute(text, falseCase)
  };
  return tests[testType];
}

function testDate(text, falseCase) {
  const date = new Date(text);
  const currentDate = new Date();

  if (falseCase) {
    date.should.not.be.closeToDate(currentDate, 60);
  } else {
    date.should.be.closeToDate(currentDate, 60);
  }
}

function testHour(hourText, falseCase) {
  const hour = parseInt(hourText) % 12;
  const currentHour = new Date().getHours() % 12;
  if (falseCase) {
    expect(hour).to.not.be.closeTo(currentHour, 1, `Given hour ${hour} should not be within one hour of the current hour ${currentHour}`);
  } else {
    expect(hour).to.be.closeTo(currentHour, 1, `Given hour ${hour} should be within one hour of the current hour ${currentHour}`);
  }
}

function testMinute(minuteText, falseCase) {
  const minute = parseInt(minuteText) % 59;
  const currentMinute = new Date().getMinutes() % 59;
  if (falseCase) {
    expect(minute).to.not.be.closeTo(currentMinute, 1, `Given minute ${minute} should not be within one minute of the current minute ${currentMinute}`);
  } else {
    expect(minute).to.be.closeTo(currentMinute, 1, `Given minute ${minute} should be within one minute of the current minute ${currentMinute}`);
  }
}
