import {findElementInTable} from '../LookupTables/elementLookupTable';

module.exports = {
  simulateShiftClick,
  simulatePaste
};

function simulateShiftClick(element, done) {
  simulateMouseEvent($(element).value, 'click', {bubbles: true, cancelable: true, shiftKey: true});
  done();
}


function simulatePaste(selectorKey, done) {
  const selector = findElementInTable(selectorKey);
  browser.setValue(selector,['Shift', 'Insert']);

  done();
}

function simulateMouseEvent(element, action, options) {
  browser.execute((target, action, options) => {
    const event = new MouseEvent(action, options);
    target.dispatchEvent(event);
  }, element, action, options);
}
