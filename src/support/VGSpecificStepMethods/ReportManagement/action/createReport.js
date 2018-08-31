/**
 * Created by adamShanahan on 5/7/18.
 */
import clickElement from '../../../action/clickElement';
import clickElementInDropDown from '../../../action/clickElementInDropDown';
import setInputFieldWithDateAppended from '../../../action/setInputFieldWithDateAppended';
import storeValueFromElementOrInputField from '../../../action/storeValueFromElementOrInputField';

module.exports = (reportName, dimensionsStringList, metricsStringList, runType, done) => {
  const dimensionsArray = getReportsColumnSelectors(dimensionsStringList);
  const metricsArray = getReportsColumnSelectors(metricsStringList);

  clickElement('click', 'New Report', () => {
    setParameters(reportName, dimensionsArray, metricsArray, runType, () => {
      clickElement('click', 'Save', done);
    });
  });
};

function setParameters(reportName, dimensionsArray, metricsArray, runType, callback) {
  setReportName(reportName, () => {
    setDimensionsAndMetrics(dimensionsArray, metricsArray, () => {
      setRunType(runType, callback);
    });
  });
}


function setReportName(reportName, callBack) {
  const reportNameSelector = 'Report Name';

  setInputFieldWithDateAppended('set', reportName, reportNameSelector, () => {
    storeValueFromElementOrInputField('inputfield', reportNameSelector, 'New Report Name', callBack);
  });
}

function setDefaultTimezone(callBack) {
  clickElement('click', 'Report TimeZone', () => {
    clickElement('click', 'Report TimeZone Value', callBack);
  });
}

function setDimensionsAndMetrics(dimensionsArray, metricsArray, callback) {
  setReportColumns(dimensionsArray, () => {
    setReportColumns(metricsArray, callback);
  });
}

function setReportColumns(dimensionSelectorArray, callback) {
  const clickFunctionChain = dimensionSelectorArray.reduce((clickFunctions, currSelector) => {
    return () => clickElement('click', currSelector, clickFunctions);
  }, callback);

  clickFunctionChain();
}


// Takes a string of comma separated report columns, and returns an array of their selectors
// Values it can take in: Creative, Campaign, Delivered Views, 25% Completion, 50% Completion, 75% Completion
function getReportsColumnSelectors(stringList) {
  if (!stringList) {
    return [];
  }

  return stringList.split(',').map((item) => {
    return item.trim().concat(' Report Column');
  });
}

function setRunType(runType, done) {
  let callback = done;
  if (runType === 'Scheduled') {
    callback = () => {setStartTime(done) };
  }

  clickElement('click', 'Run Type Dropdown', () => {
    clickElementInDropDown(false, runType, null, callback);
  })
}

function setStartTime(callback) {
  const eastCoastTimezone = '(GMT-05:00) Eastern Time';

  clickElement('click', 'Report Start Time', ()=> {
    clickElement('click', 'Report Timezone Dropdown', ()=> {
      clickElementInDropDown(false, eastCoastTimezone, null, callback);
    })
  })
}
