/**
 * Created by adamShanahan on 5/15/18.
 */
const {addApiEntity} = require('../../../objects/apiEntities');
const {getKnownAccountId} = require('../../../../../fixtures/knownAccountIDs');
const reportMetrics = require('../../../fixtures/reportMetrics');
const {findElementInTable} = require('../../../../LookupTables/elementLookupTable');
const {getVariable, setVariable} = require('../../../../LookupTables/storedVariables');
const openWebsite = require('../../../../action/openWebsite');
const rp = require('request-promise');

function getOptions(reportName, accountName, dimensions, metrics) {
  const options = {
    method: 'POST',
    uri: `${getVariable('apiBaseUrl')}/reporting-service/report-configs`,
    headers: {
      'Authorization': getVariable('qa@viralgains.comAuthToken') // TODO: Make this configurable
    },
    body: {
      accountId : getKnownAccountId(accountName),
      dimensions,
      metrics,
      'name': reportName,
      'repeat':'ONE_TIME_ONLY',
      'reportType': 'CUSTOM',
      'runType' : 'ON_DEMAND',
      'timeRange': 'lifetime',
    },
    json: true
  };

  return options;
}

/**
 *
 * @param reportName Name of the new report
 * @param accountName Name of the account this report is under
 * @param dimensionsStringList comma separated string with dimensions to send. Possible dimensions are : Creative, Campaign
 * @param metricsStringList comma separated string with metrics to send. Possible metrics are : 25% Completion, 50% Completion, 75% Completion Delivered Views
 * @param editOrViewReportScreen Opens the Report Edit or View page if set. Possible values: undefined, edit, view report
 * @param done Function to execute when finished
 */
module.exports = (reportName, accountName, dimensionsStringList, metricsStringList, editOrViewReportScreen, done) => {
  const uniqueReportName = getUniqueReportName(reportName);
  const dimensions = getDimensions(dimensionsStringList);
  const metrics = getMetrics(metricsStringList);
  const options = getOptions(uniqueReportName, accountName, dimensions, metrics);

  const reportUrl = browser.call(() => {
    return createReport(options, editOrViewReportScreen);
  });

  if (editOrViewReportScreen) {
    return openReportUrl(reportUrl, done);
  }

  done();
};

// Translates Dimension arguments from regex into arguments needed for Post request
function getDimensions(dimensionsStringList) {
  if (!dimensionsStringList) {
    assert.fail(-1,-1, 'At least 1 dimension is needed when creating a new report');
  }
  return dimensionsStringList.split(',').map((dimension)=> dimension.trim().toUpperCase());
}

// Translates Metric arguments from regex into arguments needed for Post request
function getMetrics(metricsStringList) {
  if (!metricsStringList) {
    assert.fail(-1,-1, 'At least 1 metric is needed when creating a new report');
  }
  return metricsStringList.split(',').map((metric) => reportMetrics[metric.trim()]);
}

function getUniqueReportName(reportName) {
  const date = new Date().getTime();
  const uniqueReportName = `${reportName}${date}`;
  setVariable('Newest Report Name', uniqueReportName); // Saves this reports name for testing in other steps. This will be overwritten with every Report POST

  return uniqueReportName;
}

// Returns the url for opening either the report edit or report view screen
// editOrViewReportScreen set to either "edit", or "view report"
function getReportUrl(accountId, reportId, editOrViewReportScreen) {
  let url = (editOrViewReportScreen === 'edit') ? '/report-builder?copyReport=false&' : '/report-viewer?';
  url+=`currentAccountId=${accountId}&reportId=${reportId}`;
  return url;
}

function createReport(options, editOrViewReportScreen) {
  return rp(options).then((response) =>{
    const {accountId, id} = response.data;
    addApiEntity(options.body.name, 'reporting-service/report-configs', id, options.headers.Authorization, true);
    return getReportUrl(accountId, id, editOrViewReportScreen);
  });
}

export function openReportUrl(reportUrl, done) {
  return openWebsite(undefined, reportUrl, () => {
    return waitForLoadingDiv(done);
  });
}

// wait for loading div to appear and disappear.
function waitForLoadingDiv(callback) {
  const selector = findElementInTable('Loading Messages');

  const currentScreenshotPath = browser.options.screenshotPath;
  browser.options.screenshotPath = null; // turn off error screen shots for the try catch

  try {
    browser.waitForVisible(selector, 4000);
  } catch (e) {
    // Don't throw an error if the loading div disappears before the waitForVisible check is ran. QA-184
  }
  browser.options.screenshotPath = currentScreenshotPath; // turn screenshots back on
  browser.waitForAllVisible(selector, browser.options.waitforTimeout, true); // ODC-604

  callback();
}


