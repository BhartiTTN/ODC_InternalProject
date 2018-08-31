/**
 * Created by adamShanahan on 5/3/18.
 */
const fs = require('fs');
const path = require('path');
const rp = require('request-promise');
const {getVariable} = require('../../../../LookupTables/storedVariables');


function getOptions(filePath) {
  const options = {
    method: 'POST',
    uri: `${getVariable('apiBaseUrl')}/media-service/media`,
    headers: {
      'Content-Type': 'image/jpeg',
      'Authorization': getVariable('qa@viralgains.comAuthToken'), // TODO: Make this configurable
    },
    formData: {
      file: fs.createReadStream(filePath)
    },
    json: true
  };

  return options;
}
/**
 * Uploads a media file through the API. Used with postAccount
 * @param fileName Name of the file to upload. This assumes it is located under support/json/fixtures
 * @param done Callback function to execute
 */
module.exports = (fileName, done) => {
  const filePath = path.join(__dirname, '..', '..', '..', '..', 'json', 'fixtures', fileName);
  const options = getOptions(filePath);

  return uploadMedia(options, done);
};


function uploadMedia(options, done) {
  return rp(options).then((response) => {
    const logoId = response.data.id;
    done(logoId);
  });
}
