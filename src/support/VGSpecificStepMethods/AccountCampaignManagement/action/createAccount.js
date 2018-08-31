/**
 * Created by harinikodey on 01/26/18.
 */

import clickElement from '../../../action/clickElement';
import setElement from '../../../action/setElement';
import storeValueFromElementOrInputField from '../../../action/storeValueFromElementOrInputField';
import chooseFile from '../../../action/chooseFile';
import setInputFieldWithDateAppended from '../../../action/setInputFieldWithDateAppended';
import pressButton from '../../../action/pressButton';

/**
 * Create New Account by Selecting/Entering Mandatory fields data provided in the Feature Files
 *
 *  @param {String}     parentAccount value for ParentAccount Value
 *  @param {String}    accountName value for accountName Value
 *  @param {String}    contactEmail value for validEmailId Value
 *  @param {String}    domain value for domain Value
 *  @param {String}    imagepic value for imagepic Value
 *
 * @param  {Function} done    Function to execute when finished
 */


module.exports = (parentAccount, accountName, contactEmail, domain, imagepic, dspLogin, dspPassword, done) => {
  clickElement('click', 'New Account Button', () => {
    selectParameters(parentAccount, accountName, contactEmail, domain, imagepic, dspLogin, dspPassword, () => {
      clickSubmit(done);
    });
  });
};


function selectParameters(parentAccount, accountName, contactEmail, domain, imagepic, dspLogin, dspPassword, callBack) {
  setAccountInformation(parentAccount, accountName,dspLogin, dspPassword,  () => {
    enableStatus(() => {
      setContactEmail(contactEmail, () => {
        setIndustryValue(() => {
          setDomain(domain, () => {
            setDefaultTimezoneAndDateFormat(() => {
              uploadFile(callBack);
            });
          });
        });
      });
    });
  });
}


function setAccountInformation(parentAccount, accountName, dspLogin, dspPassword,  callBack) {
  setParentAccount(parentAccount, () => {
    setAccountName(accountName, () => {
      setDspLogin(dspLogin, () => {
        setDspPassword(dspPassword, callBack);
      });
    });
  });
}

function setParentAccount(parentAccount, callBack) {
  const ParentAccountSelector = 'Parent Account Name';

  clickElement('click', 'Parent dropdown', () => {
    setElement('set', parentAccount, ParentAccountSelector, () => {
      clickElement('click', 'Parent Menu', callBack);
    });
  });
}

function setAccountName(accountName, callBack) {
  const accountNameSelector = 'Account Name';

  setInputFieldWithDateAppended('set', accountName, accountNameSelector, () => {
    storeValueFromElementOrInputField('inputfield', accountNameSelector, 'New Account Name', callBack);
  });
}

function setDspPassword(dspPassword, callBack) {
  const dspPasswordSelector = 'DSP Password';
  setElement('set', dspPassword, dspPasswordSelector,callBack);
}

function setDspLogin(dspLogin, callBack) {
  const dspLoginSelector = 'DSP Login';

  setElement('set', dspLogin, dspLoginSelector,callBack);

}


function enableStatus(callBack) {
  clickElement('click', 'Status dropdown', () => {
    clickElement('click', 'Status Menu-Enable', callBack);
  });
}

function setContactEmail(contactEmail, callBack) {
  const contactEmailSelector = 'Contact Email';
  setElement('set', contactEmail, contactEmailSelector, callBack);
}

function setIndustryValue(callBack) {
  clickElement('click', 'Industry dropdown', () => {
    clickElement('click', 'Industry Value', callBack);
  });
}

function setDomain(domain, callBack) {
  const domainSelector = 'Domain';

  setElement('set', domain, domainSelector, () => {
    pressButton('Enter',callBack);
  });
}

function setDefaultTimezoneAndDateFormat(callBack) {
  setDefaultTimezone(()=> setDefaultDatetime(callBack));
}

function setDefaultTimezone(callBack) {
  clickElement('click', 'TimeZone', () => {
    clickElement('click', 'TimeZone Value', callBack);
  });
}

function setDefaultDatetime(callBack) {
  clickElement('click', 'DateTime Format', () => {
    clickElement('click', 'DateTime Value', callBack);
  });
}

function uploadFile(callBack) {
  const imagepicSelector = 'Imagepic';

  chooseFile('Image.jpg', 'jpg', imagepicSelector, callBack);
}

function clickSubmit(callBack) {
  clickElement('click', 'Submit', callBack);
}
