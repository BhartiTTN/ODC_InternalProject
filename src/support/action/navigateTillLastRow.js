import {findElementInTable} from '../LookupTables/elementLookupTable';
import elementLookupTable from "../LookupTables/elementLookupTable";


module.exports = (elem, expectedValue, done) => {
  const element = elementLookupTable.findElementInTable(elem);
  const ElemLoading = elementLookupTable.findElementInTable("ElemLoadingScreen");
  const ElemLoaded = elementLookupTable.findElementInTable("ElemLoadedScreen");

  const command = 'getAttribute';
  const method = 'click'

  var attributeValue = true;

  while (attributeValue) {
    browser.waitForExist(element);

    browser.waitForClickable(element);
    browser[method](element);
    try {
      browser.pause(10000);
      browser.waitForVisible(ElemLoaded, 10000, false);
    }
    catch (e) {

    }
    attributeValue = browser.isEnabled(element);
  }

};

