/**
 * Created by harinikodey on 01/26/18.
 */

import clickElement from '../../../action/clickElement';
import clickElementInDropDown from '../../../action/clickElementInDropDown';
import setElement from '../../../action/setElement';
import storeValueFromElementOrInputField from '../../../action/storeValueFromElementOrInputField';
import setInputFieldWithDateAppended from '../../../action/setInputFieldWithDateAppended';
import mousehoverOnElement from '../../../action/moveToElement';


/**
 * Single step method for selecting or entering Creative Name, Video URL to proceed with CTA and other Steps
 *  @param {String}    save              Whether or not to click on the save button when finished
 *  @param {String}    creativeName      value for Creative NameValue
 *  @param {String}    vastUrl           value for vast url
 *  @param  {Function} done              Function to execute when finished
 */
export default (save, creativeName, vastUrl, done) => {
  const callback = (save) ? () => clickElement('click', 'Save', done) : done;

  createNewCreative(() => {
    openExistingCreative(() => {
      selectParameters(creativeName, vastUrl, callback);
    });
  });
};


export function openExistingCreative(callback) {
  mousehoverOnElement('Creative_more_Icon', 'obsolete', ' ', ' ', () => {
    mousehoverOnElement('Creative__controlsCover', 'obsolete', '50', '60', () => {
      clickElement('click', 'Creative__editIcon', callback);
    });
  });
}

function selectParameters(creativeName, vastUrl, callback) {
  enterCreativeName(creativeName, () => {
    selectVideoTypeAndSetVastURL(vastUrl, callback);
  });
}

function createNewCreative(callback) {
  return clickElement('click', 'Create Creative Icon', callback);
}

function enterCreativeName(creativeName, callback) {
  const CreativeNameSelector = 'Name Field';

  setInputFieldWithDateAppended('set', creativeName, CreativeNameSelector, () => {
    storeValueFromElementOrInputField('inputfield', CreativeNameSelector, 'New Creative Name', callback);
  });
}

function selectVideoTypeAndSetVastURL(vastUrl, callback) {
  clickElement('click', 'Video Type', () => {
    clickElementInDropDown(false,'VAST Tag URL', null, () => {
      setElement('set', vastUrl, 'Vast URL', callback);
    });
  });
}


