/**
 * Created by harinikodey on 02/12/18.
 */

import clickElement from '../../../action/clickElement';
import setElement from '../../../action/setElement';


/**
 *  Accept User Invite by Selecting/Entering Mandatory fields data provided in the Feature Files
 *
 * @param {String}    FirstName value for FirstName
 * @param {String}    LastName value for LastName
 * @param {String}    Job_Title value for Job_Title Value
 * @param {String}    Password value for Password Value
 * @param  {Function} done    Function to execute when finished ethod, storedVariableName, knownElement,
 */



module.exports = (FirstName,LastName,Job_Title,Password,done) => {

  selectParameters(FirstName,LastName,Job_Title,Password, () => {
    clickSave(done);
  });
};


function selectParameters(FirstName,LastName,Job_Title,Password,callBack) {


  const First_NameSelector = 'First Name';
  const Last_NameSelector = 'Last Name';
  const Job_TitleSelector = 'Job Title';
  const PasswordSelector = 'Password';

  clickElement('click', 'Accept Invite', () => {
    setElement('set', FirstName, First_NameSelector, () => {
      setElement('set', LastName, Last_NameSelector, () => {
        setElement('set', Job_Title, Job_TitleSelector, () => {
          setElement('set', Password, PasswordSelector, callBack);
        });
      });
    });
  });
}

function clickSave(callBack) {
  clickElement('click', 'Save', callBack);
}
