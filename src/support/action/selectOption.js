const KNOWN_ELEMENTS = {

  'User Group':'.gridSelector__selectContainer___1_79I .Select-placeholder',
  'User Group Field' :'.Select-value-label div[id$="-item"]',
  'User Group Value' :'.Select.Select--single .Select-menu-outer',
  'User Group Value-Item' : '.Select-menu-outer .Select-option[id$="--list"]',


};
/**
 * Select an option of a select element
 * @param  {String}   selectionType  Type of method to select by (name, value or
 *                                   text)
 * @param  {String}   selectionValue Value to select by
 * @param  {String}   selectElem     Element selector
 * @param  {Function} done           Function to execute when finished
 */
module.exports = (selectionType, selectionValue, knownElement, done) => {
  /**
     * Arguments to pass to the selection method
     * @type {Array}
     */

  const selectElem = KNOWN_ELEMENTS[knownElement];


  const commandArguments = [
    selectElem,
    selectionValue,
  ];

    /**
     * The select element
     * @type {Object}
     */
  const element = browser.element(selectElem);

  /**
     * The method to use for selecting the option
     * @type {String}
     */
  let command = '';
  switch (selectionType) {
    case 'name' : {
      command = 'selectByAttribute';

      // The selectByAttribute command expects the attribute name as it
      // second argument so let's add it
      commandArguments.splice(1, 0, 'name');

      break;
    }

    case 'value' : {
      command = 'selectByValue';
      break;
    }

    case 'text' : {
      command = 'selectByVisibleText';
      break;
    }


    default: {
      throw new Error(`Unknown selection type "${selectionType}"`);
    }


  }

  element[command].apply(this, commandArguments);

  done();
};
