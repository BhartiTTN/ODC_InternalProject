/**
 * Created by harinikodey on 11/26/17.
 */
import clickElement from '../../../action/clickElement';
/**
 * Perform an click action on the Public group / account element and call as a step method
 * @param  {Function} done Function to execute when finished
 */

module.exports=(done) =>{
  clickElement('click','Public groups', () => clickElement('click','Public account', done));
};
