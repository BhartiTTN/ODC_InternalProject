/**
 * Created by harinikodey on 11/26/17.
 */
import clickElement from '../../../action/clickElement';
import setElement from '../../../action/setElement';
import clickElementInDropDown from '../../../action/clickElementInDropDown';


/**
 * Perform an Filter action with the detailed Criteria provided in the Feature Files
 * @param {String}    type  to choose either enter or select
 * @param {String}    targetText text we are looking for
 * @param  {Function} done  Function to execute when finished
 */

module.exports=(type,targetedText,done) =>{


  if (type !== 'select') {
    clickElement('click','Detailed Filter to Enter', () => {
      setElement('set', targetedText, 'Detailed Filter to Enter', done);
    });
  } else {
    clickElement('click','Detailed Filter', () => {
      setElement('set',targetedText,'Detailed Filter InputField', () => {
        clickElementInDropDown(false, targetedText,'Detailed Filter Dropdown Elements', done);
      });
    });
  }

};
