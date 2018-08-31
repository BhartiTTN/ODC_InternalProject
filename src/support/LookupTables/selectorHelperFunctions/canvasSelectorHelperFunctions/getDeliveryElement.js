/**
 * Created by adamShanahan on 3/2/18.
 */

module.exports = {
  getHourOrMinuteSelector
};


/**
 * Used to select numbers and hours from the date picker Grid on Delivery UI
 * @param type {string} either 'hour' or 'minute'
 * @param number {string} number that is attempting to be selected (1-12 for hours, 00 - 55 for minutes)
 * @returns {string} returns relevant selector
 */
function getHourOrMinuteSelector(type, number) {
  const row = (number % 3) + 1;
  const column = (number % 4) + 1;
  return `tr:nth-child(${row}) .${type}:nth-child(${column})`;
}
