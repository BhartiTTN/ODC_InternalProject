/**
 * Created by harinikodey on 01/26/18.
 */

import clickElement from '../../../action/clickElement';
import setElement from '../../../action/setElement';
import storeValueFromElementOrInputField from '../../../action/storeValueFromElementOrInputField';

/**
 * Select/Enter Mandatory Inventory fields provided in the Feature Files
 * @param {String}    MinBid value for Min Bid Value
 * @param {String}    MaxBid value for Max Bid Value
 * @param  {Function} done    Function to execute when finished
 */


module.exports = (MinBid,MaxBid,done) => {

  selectInventoryCheckbox(() => {
    enterMinandMaxBidValues(MinBid,MaxBid, () => {
      selectVendor(done);
    });
  });
};


function selectInventoryCheckbox(callBack) {
  clickElement('click', 'Campaign Inventory Checkbox', callBack);
}


function enterMinandMaxBidValues(MinBidValue, MaxBidValue, callBack) {

  const MinBidValueSelector = 'Campaign_Inv_Overall_MinBid';
  const MaxBidValueSelector = 'Campaign_Inv_Overall_MaxBid';


  setElement('set',MinBidValue, MinBidValueSelector, () => {
    storeValueFromElementOrInputField('inputfield',MinBidValueSelector, 'Campaign_Inv_Overall_MinBid', () => {

      setElement('set', MaxBidValue,MaxBidValueSelector, () => {
        storeValueFromElementOrInputField('inputfield', MaxBidValueSelector, 'Campaign_Inv_Overall_MaxBid', callBack);

      });
    });
  });
}

function selectVendor(callBack) {
  clickElement('click', 'Inv_Vendor1_AppNexus', callBack);
}

