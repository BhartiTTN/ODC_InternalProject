/**
 * Created by adamShanahan on 3/30/18.
 */

const gridElementSelectors = {
  // CampaignID selector assumes Campaign is the first element in the row
  'CampaignID' : '.rt-td:nth-child(1)',
  'Checkbox': 'input[type="checkbox"]',
  // CompletedViews selector assumes Completed Views is the second element in the row
  'CompletedViews' : '.rt-td:nth-child(2)',
  'Copy Button' : '.fa-copy',
  // DeliveredViews selector assumes Delivered Views is the third element in the row
  'DeliveredViews' : '.rt-td:nth-child(3)',
  'Edit Button': '.fa-pencil',
  'Delete Button': '.fa-trash-o',
  'Disable Button': '.fa-ban',
  'Enable Button': '.fa-circle-o',
  'Resend Button': '.statusCellRenderer__resendButton___BIU7f',
  'Status': 'div:nth-child(2)>div',
  'View Button' : '.fa-eye',
  'Generated Date & Time' : '.rt-td:nth-child(6)',
  'Group Name': 'div:nth-child(4)'
};

const modalGridElementSelectors = {
  'Checkbox': 'input[type="checkbox"]',
  'Edit Button': '.fa-pencil',
  'Disable Button': '.fa-circle-o',
  'Resend Button': '.statusCellRenderer__resendButton___BIU7f',
  'Status': 'div:nth-child(2)>div',
  'Group Name': 'div:nth-child(3)'
};

module.exports = {
  getGridElement
};

/**
 * Returns the selector for a given element in a grid
 * @param elementType Type of element in row (checkbox, delete button, status etc)
 * @param rowNumber Row that desired element is in
 * @returns {string} selector
 */
function getGridElement(elementType, rowNumber) {
  elementType = capitalize(elementType);
  const modalGrid = 'form .rt-table.datagrid__rtTable___1jUh7';
  const activeTab = '.tab__tabContentActive___3V4vx ';
  let row = '', elementSelector;

  if (browser.multiremoteIsVisible(modalGrid)) { // if modal open, assume referring to modal
    row = `form .rt-table.datagrid__rtTable___1jUh7 > div:nth-child(2) > div:nth-child(${rowNumber})`;
    elementSelector = modalGridElementSelectors[elementType];
  } else {
    if (browser.multiremoteIsVisible(activeTab)) { // include selector for current tab if it exists.
      row = activeTab;
    }

    row = row.concat(`.rt-tbody > div:nth-child(${rowNumber})`);
    elementSelector = gridElementSelectors[elementType];
  }

  return `${row} ${elementSelector}`;
}

function capitalize(string) {
  return string[0].toUpperCase() + string.slice(1);
}
