import elementLookupTable from '../LookupTables/elementLookupTable';


module.exports = (method, value, selectorKey, done) => {

  const selector = elementLookupTable.findElementInTable(selectorKey);


  const command = (method === 'add') ? 'addValue' : 'setValue';

  browser.waitForVisible(selector);

  if (!value) {
    browser[command](selector, '');
  } else {
    browser[command](selector, value);
  }

  done();
};
