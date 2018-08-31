/**
 * Created by adamShanahan on 4/26/18.
 */

const adIdPropertyColumnIndexes = {
  'actual views' : 7
};

module.exports = {
  getadIdProperty
};



function getadIdProperty(adId, adUnitProperty) {
  const rowNumber = getAdUnitRow(adId);
  const adUnitIndex = adIdPropertyColumnIndexes[adUnitProperty];
  const deliveredViewsSelector = `#adUnits tr:nth-child(${rowNumber}) td:nth-child(${adUnitIndex})`;
  return deliveredViewsSelector;
}


function getAdUnitRow(adId) {
  const idRowSelector = '#adUnits tr td:nth-child(1)';
  const ids = browser.getText(idRowSelector);

  const rowNumber = ids.findIndex((id)=> id === adId) +2;
  return rowNumber;
}
