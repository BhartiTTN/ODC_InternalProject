import elementLookupTable from '../LookupTables/elementLookupTable';

/**
 * Created by harinikodey on 10/7/17.
 */

/**
 * File upload as per the file type mentioned for the selectors
 *
 * @param  {String}   selectorKey   Element selector
 * @param  {String}   fileName      FileName - .jpg or .csv etc.. to be uploaded for the respective element
 * @param  {Function} done          Function to execute when finished
 */

module.exports = (fileName,type,selectorKey,done) => {

  const selector = elementLookupTable.findElementInTable(selectorKey);

  const path=require('path');

  const toUpload = path.join(__dirname, '..', '..' , 'fixtures', type, fileName);

  browser.waitForExist(selector);
  browser.chooseFile(selector, toUpload);


  done();
};
