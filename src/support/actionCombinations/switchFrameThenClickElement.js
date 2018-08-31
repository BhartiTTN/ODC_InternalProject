/**
 * Created by adamShanahan on 8/1/17.
 */
import clickElement from '../action/clickElement';
import switchFrame from '../action/switchFrame';

module.exports = (clickType, element, frame, done) =>{
  switchFrame(frame, () => clickElement(clickType,element, done));
};
