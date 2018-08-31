/**
 * Created by adamShanahan on 5/15/18.
 */
const reportManagement = {
  'New Report': '.tab__createButtonsContainer___2_YEJ',
  'Report Name Column': '.datagrid__rtTd___-YAv-:nth-child(2)',
  'Report Management Account Name Column': '.datagrid__rtTd___-YAv-:nth-child(3)',
  'Report Type Column' : '.datagrid__rtTd___-YAv-:nth-child(5)',
  'Report created has Name': '.datagrid__selectedRow___3YsXr >div:nth-child(2)>div',
  'First Report Checkbox': '.datagrid__rtTrGroup___2oDPX:nth-child(1) Input[type=\'checkbox\']',
  'Sort By Report Name': '.rt-tr.datagrid__rtTheadTr___2-VP_ > div:nth-child(2)',
  'Reports Bulk Cancel Button': '.fa-close.datagrid__bulkIcon___3YsGw',
  'Reports Bulk Delete Button': '.fa-trash-o.datagrid__bulkIcon___3YsGw'

};

const newReportPage = {
  'Report Name': '[name="name"]',
  'Report Name Error': '[class*="validation__dialogError"]',

  'Campaign Report Column': '[for="CAMPAIGN"]',
  'Creative Report Column': '[for="CREATIVE"]',
  'Delivered Views Report Column': '[for="DELIVERED_VIEWS"]',
  '25% Completion Report Column': '[for="QUARTILE_VIEWS_25"]',
  '50% Completion Report Column': '[for="QUARTILE_VIEWS_50"]',
  '75% Completion Report Column': '[for="QUARTILE_VIEWS_75"]',
  'Report TimeZone': '.Select-placeholder',
  'Report Edit TimeZone Dropdown': '.Select-value',
  'Report TimeZone Value': '.Select-menu-outer .Select-option[id$="--option-0"]',

  'Included Report Columns': '[class*="selectedColumnsContainer"] [class*="reportColumn"]',

  'Run Type Dropdown' : '.style__fieldsRowContent___1EIeO .Select-value',
  'Report Start Time' : '#react-datetime-bootstrap',
  'Report Timezone Dropdown' : '.ReactCollapse--collapse .Select-placeholder'
};

const reportViewerPage = {
  'Download Report' : '.style__csvLink___26XDD',
  'Edit Report': '.fa-pencil-alt',
  'Generate Latest Data' : '.style__actionContainer___2IVoO div:nth-child(1) div',
  'Get Report Link': '.fa-link',
  'Report Dashboard Button' : '.style__dashboardLink___17cnh'
};

export function getReportSelector(key) {
  if (key in reportManagement) {
    return reportManagement[key];
  }

  if (key in newReportPage) {
    return newReportPage[key];
  }

  if (key in reportViewerPage) {
    return reportViewerPage[key];
  }

  return null;
}

