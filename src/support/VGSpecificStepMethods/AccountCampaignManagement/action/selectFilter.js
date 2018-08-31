/**
 * Created by harinikodey on 11/26/17.
 */
import clickElement from '../../../action/clickElement';
import setElement from '../../../action/setElement';
import clickElementInDropDown from '../../../action/clickElementInDropDown';
/**
 * Perform an Filter action with the Criteria provided in the Feature Files
 * @param {String}    targetedText text we are looking for
 * @param  {Function} done    Function to execute when finished
 */

module.exports=(targetedText,done) =>{

  clickElement('click','Filter', () => {
    setElement('set',targetedText,'Filter InputField', () => {
      clickElementInDropDown(false, targetedText,'Filter Dropdown Elements', done);
    });
  });


};
