/**
 * Created by adamShanahan on 10/30/17.
 */
import currentVastUrl from '../objects/currentVastUrl';
import {getadIdProperty} from './selectorHelperFunctions/rtbUtilSelectorHelperFunctions';
import {getGridElement} from './selectorHelperFunctions/getGridElement';
import {getNodeSelector} from './selectorHelperFunctions/canvasSelectorHelperFunctions/getCanvasElement';
import {getHourOrMinuteSelector} from './selectorHelperFunctions/canvasSelectorHelperFunctions/getDeliveryElement';
import {getAccountManagementSelector} from './selectorTables/accountManagementTables';
import {getCampaignCanvasSelector} from './selectorTables/campaignCanvasSelectorTables';
import {getReportSelector} from './selectorTables/reportSelectorTables';

// TODO: Break up into tables based on pages on site (login, account edit, ect)
// TODO: Once above is done, sort

const dashboardNavigation = {
  'Account Management': '.Navigation__nav___3lfAv li:nth-of-type(5)',
  'Campaign Management': '.Navigation__nav___3lfAv li:nth-of-type(2)',
  'Public groups': '.Navigation__nav___3lfAv li:nth-of-type(1) ',
  'Public account': '.style__accountsList___3_X4C li:nth-of-type(1)',
  'Report Management': '.Navigation__nav___3lfAv li:nth-of-type(3)',
  'QA_ViralGains':'.style__label___2qLPF'
};

const campaignManagementCampaignsTab = {
  'Campaign Name Column': '.tab__tabContentActive___1HSqy .datagrid__rtTd___-YAv-:nth-child(3)',
  'Creative Name Column': '.tab__tabContentActive___3V4vx .datagrid__rtTd___-YAv-:nth-child(3)'
};

const druidTable = {
  'Druid PlayerEvent Counts as View' : 'table:nth-child(43) tr:nth-child(2) td:nth-child(2)',
  'Druid PlayerEvent Done' : 'table:nth-child(43) tr:nth-child(3) td:nth-child(2)',
  'Druid RTBBid AdUnitId Table': 'Table:nth-of-type(37) tbody tr td',
  'Druid RTBWin AdUnitId Table': 'Table:nth-of-type(9) tbody tr td'
};

const googleVastInspectorTable = {
  'Google Vast Inspector Vast Tag Inputfield': '#vast-tag-url',
  'Google Vast Inspector Events': '#report-events li',
  'Google Vast Inspector Vast XML Radio': '#vast-xml-radio',
  'Google Vast Inspector Vast XML Inputfield': '#vast-xml',
  'Vast Inspector Video':'.video-stream'
};

const oldVGSiteTable = {
  'Old VG Login Email': '#email',
  'Old VG Login Password': '#password',
};

const errorPopups = {
  'Error Notification' : '.notification-error',
  'Dismiss Error Notification' : '.notification-dismiss',
  'Notification': '.notification',
  'Open Error Details' : '.notificationDetails__detailButton___3tZ8-',
  'Error Details' : 'table pre' // text next to "Error Details"
};


const clickElementLookupTable = {

// Global Elements - Across all Pages
  'Submit': 'button[type=\'submit\']',
  'Create Button': 'button[type=\'submit\']',
  'Invite': 'button[type=\'submit\']',
  'Save': 'button[type=\'submit\']',
  'Save Button': 'button[type=\'submit\']', // TODO: Repeated selector above
  'Cancel': 'button[type=\'button\']',
  'Login': 'div[class=\'common__submitBtn___1IxlP\']',
  'Password': '[name=\'password\']',
  'Form': 'div[class=\'common__generalForm___KKfDm\']',
  'User Accept Invite Form': '.common__inputContainer___3nWeL',
  'Layout': '.form__flexRowOuter___XpiU4',
  'Logout': 'button.Navigation__btnLogout___3U02z',
  'Apply Button': '.nestedFilter__applyButton___8vgvL',
  'Back Button in Canvas': '.bar__rightIcons___2hGIf >button:nth-child(2)',

  // Login , Forgot Password Pages
  'Confirm Password': 'Input[name=\'confirmPassword\']',
  'BacktoLogin': 'span.reset__backToLogIn___3ZNZd',
  'Forgot Password?': 'span.login__forgotPasswordLink___1aCjH',
  'Remember me':'label[for*="signIn"]',


  // Campaign Page ; Account Management Page - Accounts Tab, Groups Tab and Users Tab

  // Global Buttons
  'Campaign Submit': 'button[class=\'dashboard__buttonSubmit___1N_UW\']',
  'New Campaign': '.tab__createButton___2oEPv',
  'Delete Button': '.tab__tabContentActive___1HSqy .datagrid__bulkIconsContainer___1oybP .fa-trash-o',
  'Disable Button': '.tab__tabContentActive___3V4vx .datagrid__bulkIconsContainer___1oybP .fa-ban',
  'Enable Button': '.tab__tabContentActive___3V4vx .datagrid__bulkIconsContainer___1oybP .fa-circle-o',
  'Cancel Button': '.tab__tabContentActive___1HSqy .fa-close.datagrid__bulkIcon___3YsGw',
  'Cancel Button in CTA':'.style__actionsContainer___3pxyZ > button[type=\'button\']',
  'No Rows Found': '.rt-noData',
  'Remove Account ImagePic':'.style__removeButton___1CDhU',

  // User Tab - Email invite elements
  'Accept Invite': '.style__saveButton___uTd70',
  'Deny Invite': '.style__cancelButton___1qlOj',

  // Sort Elements
  'SortIcon': 'div[class=\'datagrid__rtTheadTh___1mXcI rt-resizable-header -sort-asc -cursor-pointer rt-th\'] div[class=\'-loading-inner\']',
  'Sort By Account Name': '.tab__tabContentActive___3V4vx .rt-tr.datagrid__rtTheadTr___2-VP_ > div:nth-child(3)',
  'Sort By # of Users': '.tab__tabContentActive___3V4vx .rt-tr.datagrid__rtTheadTr___2-VP_ > div:nth-child(5)',
  'Sort By # of Groups': '.tab__tabContentActive___3V4vx .rt-tr.datagrid__rtTheadTr___2-VP_ > div:nth-child(4)',
  'Email Column Sort Icon': '.tab__tabContentActive___3V4vx .rt-tr.datagrid__rtTheadTr___2-VP_ > div:nth-child(4)',
  '# of Groups Column': '.tab__tabContentActive___3V4vx .rt-tr.datagrid__rtTheadTr___2-VP_ > div:nth-child(8)',
  'Number of Users': '.tab__tabContentActive___3V4vx .rt-tr.datagrid__rtTheadTr___2-VP_ > div:nth-child(8)',
  'Ascending': '.fa-sort-asc',
  'Descending': '.fa-sort-desc',
  'Lineitem Name to Sort': '.tab__tabContentActive___3V4vx .rt-tr.datagrid__rtTheadTr___2-VP_ > div:nth-child(2)',

  'Campaign Name in Creative Tab':'.tab__tabContentActive___3V4vx .datagrid__rtTrGroup___2oDPX:nth-child(1) .datagrid__rtTd___-YAv-:nth-child(4)',

  'Creative Name in Creative list':'.tab__tabContentActive___3V4vx .datagrid__rtTrGroup___2oDPX:nth-child(1) .datagrid__rtTd___-YAv-:nth-child(3)',

  'CreativeGroup Name in Creative Groups list':'.tab__tabContentActive___3V4vx .datagrid__rtTrGroup___2oDPX:nth-child(1) .datagrid__rtTd___-YAv-:nth-child(2)',

  'Campaign Name in CreativeGroups Tab':'.tab__tabContentActive___3V4vx .datagrid__rtTrGroup___2oDPX:nth-child(1) .datagrid__rtTd___-YAv-:nth-child(3)',

  // Create Campaign / Account Management Elements
  'Grid Campaign Name': '.tab__tabContentActive___3V4vx .rt-tr.datagrid__rtTheadTr___2-VP_ > div:nth-child(3)',
  // 'Group Name NEED TO CHANGE NAME': 'div[class=\'accountManagement__tabContentActive___qVIpN\'] div[class=\'rt-tr datagrid__rtTheadTr___2-VP_\'] > div:nth-child(4)', // TODO: Repeated in isExisting
  'Search Arrow Icon': '.fa.fa-caret-left.style__expandIcon___3-4Kn',
  'Search Down Arrow': '.fa.fa-caret-down.style__expandIcon___3-4Kn',
  'Last Name': 'Input[name=\'lastName\']',
  'Job Title': 'Input[name=\'jobTitle\']',
  'Campaign Name Link': '.tab__tabContentActive___3V4vx .datagrid__rtTrGroup___2oDPX:nth-child(1) .datagrid__rtTd___-YAv-:nth-child(3) .linkedSpan__spanLink___3khFu',

  // Drop-downs in Account Management - Create or Edit : Account tab, group tab & users tab
  'Parent dropdown': '.Select.form__selectOverride___3VR9o.Select--single.is-searchable',
  'Parent Menu': '.Select-menu-outer .Select-option[id$="--option-0"]',
  'Status dropdown': '.form__flexRow___3cThm:nth-child(2) .Select-placeholder',
  'Edit Status dropdown': '.form__flexRow___3cThm:nth-child(2) .Select-value',
  'Status Menu-Enable': '.Select-menu-outer .Select-option[id$="--option-0"]',
  // 'Status Menu-Disable':'div.Select-menu-outer .Select-option:nth-child(1)',
  'Status Menu-Disable': '.Select-menu-outer .Select-option[id$="--option-1"]',
  'Industry dropdown': '.form__flexRow___3cThm:nth-child(3) .Select-placeholder',
  'Industry Value': '.Select-menu-outer .Select-option[id$="--option-0"]',
  'Edit Industry Value': '.Select-menu-outer .Select-option[id$="--option-1"]',
  'TimeZone': '.form__flexRow___3cThm:nth-child(5) .Select-placeholder',
  'Edit TimeZone dropdown': '.form__flexRow___3cThm:nth-child(5) .form__col___3CJjJ:nth-child(1) .Select-value',
  'TimeZone Value': '.Select-menu-outer .Select-option[id$="--option-0"]',
  'Edit TimeZone Value': '.Select-menu-outer .Select-option[id$="--option-1"]',
  'DateTime Format': '.form__col___3CJjJ:nth-child(2) .Select-placeholder',
  'Edit DateTime Format': '.form__flexRow___3cThm:nth-child(5) .form__col___3CJjJ:nth-child(2) .Select-value',
  'DateTime Value': '.Select-menu-outer .Select-option[id$="--option-0"]',
  'Edit DateTime Value': '.Select-menu-outer .Select-option[id$="--option-1"]',
  'User Status Dropdown': '.form__col___3CJjJ .Select-placeholder',
  'User Group': '.gridSelector__selectContainer___1_79I .Select-placeholder', // TODO: This key is repeated
  'User Group Field': '.Select-placeholder',
  'User Group Value': '.Select-menu-outer .Select-option[id$="option-0"]',
  'User Group Value-Item': '.Select-menu-outer .Select-option[id$="option-0"]',
  'Account Name dropdown': '.Select.form__selectOverrideOverlay___3uEcD.form__selectOverride___3VR9o.Select--single.is-searchable',
  'Account Menu': '.Select-menu-outer .Select-option[id$="--option-1"]',
  'Group Status dropdown': '.form__col___3CJjJ:nth-child(3) .Select-placeholder',
  'Selected Group Status dropdown': '.form__col___3CJjJ .Select-value',
  'Image': 'div[class=\'style__imageInputTitle___1CXYL\']',


  // Grid Elements -  Campaign Page ; Account Management Page - Accounts Tab, Groups Tab and Users Tab

  'Select Checkbox': '.tab__tabContentActive___1HSqy .datagrid__rtTrGroup___2oDPX:nth-child(1) Input[type=\'checkbox\']',
  'Select Checkbox in modal window': '.gridSelector__container___1zpWG .datagrid__rtTable___1jUh7  input[type=\'checkbox\']',
  'Select Checkbox2 in modal window': '.gridSelector__container___1zpWG .datagrid__rtTrGroup___2oDPX:nth-child(2) Input[type=\'checkbox\']',
  'Grid Edit Icon': '.tab__tabContentActive___3V4vx .datagrid__rtTrGroup___2oDPX:nth-child(1) .actionCellRenderer__actionContainer___2Vq3p .fa-pencil',
  'Grid Disable Icon': '.tab__tabContentActive___3V4vx .datagrid__rtTrGroup___2oDPX:nth-child(1) .actionCellRenderer__actionContainer___2Vq3p .fa-ban',
  'Grid Enable Icon': '.tab__tabContentActive___3V4vx .datagrid__rtTrGroup___2oDPX:nth-child(1) .actionCellRenderer__actionContainer___2Vq3p .fa-circle-o',
  '2nd Select Checkbox': '.tab__tabContentActive___3V4vx .datagrid__rtTrGroup___2oDPX:nth-child(2) Input[type=\'checkbox\']',
  '3rd Select Checkbox': '.tab__tabContentActive___3V4vx .datagrid__rtTrGroup___2oDPX:nth-child(3) Input[type=\'checkbox\']',
  '2 Grid Edit Icon': '.tab__tabContentActive___3V4vx .datagrid__rtTrGroup___2oDPX:nth-child(2) .actionCellRenderer__actionContainer___2Vq3p .fa-pencil',
  '2 Grid Disable Icon': '.tab__tabContentActive___3V4vx .datagrid__rtTrGroup___2oDPX:nth-child(2) .actionCellRenderer__actionContainer___2Vq3p .fa-ban',
  '2 Grid Enable Icon': '.tab__tabContentActive___3V4vx .datagrid__rtTrGroup___2oDPX:nth-child(2) .actionCellRenderer__actionContainer___2Vq3p .fa-circle-o',
  'Existing Account Select Checkbox': '.datagrid__selectedRow___3YsXr input[type=\'checkbox\']',
  'Grid Delete Icon': '.tab__tabContentActive___3V4vx .datagrid__rtTrGroup___2oDPX:nth-child(1) .actionCellRenderer__actionContainer___2Vq3p .fa-trash-o',
  'Existing User Select Checkbox': '.datagrid__selectedRow___3YsXr input[type=\'checkbox\']',
  'Grid Edit Icon for First Name Harini': '.tab__tabContentActive___3V4vx .datagrid__rtTrGroup___2oDPX .datagrid__selectedRow___3YsXr .actionCellRenderer__actionContainer___2Vq3p .fa-pencil',
  'Group User': '.gridSelector__selectContainer___1_79I .Select-placeholder',
  'Group User Field': '.Select-placeholder',
  'Group User Value': '.Select-menu-outer .Select-option[id$="option-0"]',
  'User Group Select Checkbox1': '.gridSelector__container___1zpWG .datagrid__rtTrGroup___2oDPX:nth-child(1) Input[type=\'checkbox\']',
  'User Group Select Checkbox2': '.gridSelector__container___1zpWG .datagrid__rtTrGroup___2oDPX:nth-child(2) Input[type=\'checkbox\']',
  'User Group Select Checkbox3': '.gridSelector__container___1zpWG .datagrid__rtTrGroup___2oDPX:nth-child(3) Input[type=\'checkbox\']',

  // Account Management Tabs Navigation
  'Account Tab': '.tab__tabGroup___VrHGq > a:nth-child(1)',
  'Groups Tab': '.tab__tabGroup___VrHGq > a:nth-child(2)',
  'Users Tab': '.tab__tabGroup___VrHGq > a:nth-child(3)',
  'Creative Tab': '.tab__tabGroup___VrHGq > a:nth-child(2)',

  'Creative Groups Tab': '.tab__tabGroup___VrHGq > a:nth-child(3)',



  // Modal Window - Account Management all Tabs
  'Close': 'span[class=\'fa fa-close detailDialog__closeIcon___1qhgI\']',
  'Delete Button in Delete Confirmation Pop-Up': '.confirmDialog__confirmButton___31FmS',
  'Cancel Button in Delete Confirmation Pop-Up': '.confirmDialog__cancelButton___tmUzv',
  'Add': '.gridSelector__addButton___L1ruY',
  'Add Button': '.gridSelector__addButton___L1ruY', // TODO: Repeated above
  'Remove': '.gridSelector__container___1zpWG .fa-trash-o.datagrid__bulkIcon___3YsGw',
  'Modal Cancel Button': '.gridSelector__container___1zpWG .fa-close.datagrid__bulkIcon___3YsGw',
  'Search': '.menu__menuForm___2cnoj>div>span',
  'Account Management and Campaign Popup': '.dialogOverlay',
  'Account Management and Campaign Popup Title': '.detailDialog__title___3Xzyv',
  'Popup Window': '.detailDialog__title___3Xzyv', // TODO: Selector Repeated above


  // Group Tab - Specific checkbox elements
  'Campaign Management: Write Select Checkbox': '.form__flexRow___3cThm:nth-child(1) .form__col___3CJjJ:nth-child(1) input[type=\'checkbox\']',
  'Campaign Management: Read Select Checkbox': '.form__flexRow___3cThm:nth-child(1) .form__col___3CJjJ:nth-child(2) input[type=\'checkbox\']',
  'Account Management: Write Select Checkbox': '.form__flexRow___3cThm:nth-child(1) .form__col___3CJjJ:nth-child(3) input[type=\'checkbox\']',
  'Account Management: Read Select Checkbox': '.form__flexRow___3cThm:nth-child(2) .form__col___3CJjJ:nth-child(1) input[type=\'checkbox\']',
  'Reporting: Write Select Checkbox': '.form__flexRow___3cThm:nth-child(2) .form__col___3CJjJ:nth-child(2) input[type=\'checkbox\']',
  'Reporting: Read Select Checkbox': '.form__flexRow___3cThm:nth-child(2) .form__col___3CJjJ:nth-child(3) input[type=\'checkbox\']',
  'Reporting: Inventory Read Select Checkbox': '.form__flexRow___3cThm:nth-child(3) .form__col___3CJjJ:nth-child(1) input[type=\'checkbox\']',
  'System: Zeus Select Checkbox': '.form__flexRow___3cThm:nth-child(3) .form__col___3CJjJ:nth-child(2) input[type=\'checkbox\']',
  'System: Developer Select Checkbox': '.form__flexRow___3cThm:nth-child(3) .form__col___3CJjJ:nth-child(3) input[type=\'checkbox\']',

  // Creative Page
  'Engagement Card': 'ul[class=\'Navigation__nav___3lfAv\'] li:nth-of-type(3)',
  'Tracking': 'ul[class=\'Navigation__nav___3lfAv\'] li:nth-of-type(4)',
  'Targeting': 'ul[class=\'Navigation__nav___3lfAv\'] li:nth-of-type(6)',

  'New CampaignNotused': '.menu__collectionBoxNew___3Pasx',
  'Automotive': 'div[class=\'style__collectionText___3_f4g\']',
  'Automotive_CPG': 'div[class=\'style__menuCollectionItem___1aEk3 style__menuCollectionItemDisabled___1BjZ2\']',


  // Google Vast Inspector

  'Vast Xml Radio Button': '#vast-xml-radio',
  'Test Ad Button': '#test-ad-button',
  'Filter': '.Select', // TODO: REPEATED

  'Detailed Filter': '.nestedFilter__subInput___1GGOI .Select',
  'Detailed Filter to Enter': '.nestedFilter__filterInput___3Drp4',
  'Filter Cancel button': '.tag__deleteIcon___1L5-Y',


  // Pagination
  'Previous': '.tab__tabContentActive___3V4vx .fa-angle-left', // TODO: Repeated
  'Next': '.tab__tabContentActive___3V4vx .fa-angle-right', // TODO: Repeated


  'Existing QA Campaign': 'div[data-pseudo-id="DO NOT DELETE_QA Campaign"] .linkedSpan__spanLink___3khFu',

  'Filter Cancel button for Criteria3': '.tag__tag___mAUSw:nth-child(3) .tag__deleteIcon___1L5-Y',
  'Filter Cancel button for Criteria4': '.tag__tag___mAUSw:nth-child(4) .tag__deleteIcon___1L5-Y',

};

const isExistingLookupTable = {
  'Profile Role': 'div.Navigation__profile___Xr00J .Navigation__navItem___1O8Pb >span',
  'Enable Button': '.tab__tabContentActive___3V4vx .fa-circle-o.datagrid__bulkIcon___3YsGw',
  'Cancel Button': 'span[class=\'fa fa-close datagrid__bulkIcon___3YsGw\']',
  'Modal Window': '.detailDialog__title___3Xzyv',
  'modal window_C': 'style__creativeDialog___3Fl1-',
  'Existing Campaign': '.tab__tabContentActive___1HSqy .datagrid__rtTrGroup___2oDPX:nth-child(1) ',
  'UserDisabled': '.tab__tabContentActive___3V4vx .datagrid__rtTrGroup___2oDPX:nth-child(1) .statusCellRenderer__redCircle___14M6G',
  '2 Grid Disable Icon': '.tab__tabContentActive___3V4vx .datagrid__rtTrGroup___2oDPX:nth-child(2) .actionCellRenderer__actionContainer___2Vq3p .fa-ban',
  'Campaign': 'ul[class=\'Navigation__nav___3lfAv\'] li:nth-of-type(1)',
  'Creative': 'ul[class=\'Navigation__nav___3lfAv\'] li:nth-of-type(2)',
  'Engagement Card': 'ul[class=\'Navigation__nav___3lfAv\'] li:nth-of-type(7)',
  'Tracking': 'ul[class=\'Navigation__nav___3lfAv\'] li:nth-of-type(4)',
  'MediaPlan': 'ul[class=\'Navigation__nav___3lfAv\'] li:nth-of-type(5)',
  'Targeting': 'ul[class=\'Navigation__nav___3lfAv\'] li:nth-of-type(6)',
  'Campaign Templates': 'div.menu__menuTitle___2Cu6N',
  'CPG_Awareness': 'div.subCollectionItem__subCollectionText___LvKXr',
  'Campaign Create Label': '.detailDialog__title___3Xzyv',
  'Account Name': 'Input[name=\'name\']', // TODO: Repeated
  'Ascending': 'span[class=\'fa fa-sort-asc datagrid__sortIcon___2HESx\']',
  'Message': '.errors__messageText___29aw0',
  'Message in Inventory Block': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ:nth-child(2) .validation__error___jw1Ll',

  'Message in Overall Min Bid': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ:nth-child(1) .style__inventoryOverallContainer___1H_eH >div:nth-child(2) .validation__error___jw1Ll',

  'Message in Overall Max Bid': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ:nth-child(1) .style__inventoryOverallContainer___1H_eH >div:nth-child(4) .validation__error___jw1Ll',


  'Existing Test Account': '.datagrid__selectedRow___3YsXr input[type=\'checkbox\']',
  'Modal Title': '.detailDialog__title___3Xzyv',
  'Existing Creative': '.tab__tabContentActive___3V4vx .datagrid__rtTrGroup___2oDPX:nth-child(1)',
  'userlist1': 'div[class=\'pageControls__container___2ayEm\']',

  'Searched Account': 'Input.style__searchBox___1oZ68',



  'No Results Found': '.style__accountsListTopLevel___3UftE.style__accountsList___3_X4C >div',
  'New Group Name': '.tab__tabContentActive___3V4vx .datagrid__rtTrGroup___2oDPX:nth-child(1) .datagrid__rtTd___-YAv-:nth-child(4)',
  'Existing Group Name': '.tab__tabContentActive___3V4vx .datagrid__rtTrGroup___2oDPX:nth-child(1) .datagrid__rtTd___-YAv-:nth-child(4)',

  'Search Arrow Icon': '.fa.fa-caret-left.style__expandIcon___3-4Kn',
  'Search Down Arrow': '.fa.fa-caret-down.style__expandIcon___3-4Kn',
  'Account Search List Items': '.style__accountsListTopLevel___3UftE.style__accountsList___3_X4C',
  'Accept Invite': '.style__saveButton___uTd70',
  'Deny Invite': '.style__cancelButton___1qlOj',
  'Accept Invitation Confirmation Label': '.common__generalForm___KKfDm .invitation__invitationText___2EIof',


  'Group Email1': '.datagrid__rtTrGroup___2oDPX:nth-child(1) .datagrid__rtTd___-YAv-:nth-child(3)',
  'Group Email2': '.datagrid__rtTrGroup___2oDPX:nth-child(2) .datagrid__rtTd___-YAv-:nth-child(3)',
  'Group Email3': '.datagrid__rtTrGroup___2oDPX:nth-child(3) .datagrid__rtTd___-YAv-:nth-child(3)',
  'Existing Group Email1': '.datagrid__rtTrGroup___2oDPX:nth-child(1) .datagrid__rtTd___-YAv-:nth-child(1) checkbox[value="on"]',
  '#Selected Rows': '.tab__tabContentActive___3V4vx .datagrid__rtTrGroup___2oDPX .datagrid__selectedRow___3YsXr .datagrid__rtTd___-YAv- input[value="on"]', // TODO: Repeat
  '#ALL Rows': '.tab__tabContentActive___3V4vx .datagrid__rtTrGroup___2oDPX .datagrid__rtTd___-YAv- Input[type=checkbox]',

  // Mandatory fields
  'User Email': 'Input[name=\'email\']', // TODO Repeated as Email
  'Group Name': 'Input[name=\'name\']', // TODO: Repeated in click Element
  'Contact Email': 'input[name=\'contactEmail\']',
  'User Email Id': 'input[name=\'user.email\']',
  'User Name': 'Input[name=\'invitationName\']',
  'User Account Name': 'Input[name=\'accountName\']',
  'DSP Login':'Input[name=\'dspLogin\']',
  'DSP Password':'Input[name=\'dspPassword\']',
  'First Name': 'Input[name=\'firstName\']',
  'Last Name': 'Input[name=\'lastName\']',
  'Domain': 'Input[placeholder=\'+ Add Domain\']',
  'Domain2 Text': 'Input[placeholder=\'+ Add Domain\']',
  'Job Title': 'Input[name=\'jobTitle\']',

  'Apply Button': '.nestedFilter__applyButton___8vgvL',
  'Filter Result': '.tag__tagSmall___2HrPY.tag__tag___mAUSw',
  'Filter Cancel button for Criteria3': '.tag__tag___mAUSw:nth-child(3)',
  'Filter Cancel button': '.tag__deleteIcon___1L5-Y',


  // Pagination
  'Previous': 'fa-angle-left', // TODO: Repeated
  'Next': 'fa-angle-right', // TODO: Repeated
  'Rows Number': '.tab__tabContentActive___3V4vx .pageControls__pageLocation___rejh7', // TODO: Repeated

  // Creative Page Graph Elements
  'Existing QA Campaign': 'div[data-pseudo-id="DO NOT DELETE_QA Campaign"] > div >span',

  'Preview scrub bar': '.scrub-bar',
  'Video Play Button': '.ytp-large-play-button',
  'CTA Header Message': '.cta-headline',

  'Link_tools': '.link_tools',
  'Link_remove': '.tool-remove',
  'Tool-remove': 'tool-remove',
  'Tool-options': 'tool-options',
  'GP Values_Added Section': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(1) .style__listContainer___2fO3e',

  'GP Type': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(1) .style__listContainer___2fO3e >div .style__col___ak4o1:nth-child(1)',
  'Creative GP Type': '.style__deliveryList___1hdQd:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(1) .style__listContainer___2fO3e >div .style__col___ak4o1:nth-child(1)',

  'GP Value': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(1) .style__listContainer___2fO3e >div .style__col___ak4o1:nth-child(2)',

  'Creative GP Value': '.style__deliveryList___1hdQd:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(1) .style__listContainer___2fO3e >div .style__col___ak4o1:nth-child(2)',


  'GP Values_Added Section Close Button': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(1) .style__listContainer___2fO3e >div:nth-child(1) .style__col___ak4o1:nth-child(3)',
  'GP Values_Added Section Close Button2': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(1) .style__listContainer___2fO3e >div:nth-child(2) .style__col___ak4o1:nth-child(3)',
  'GP Values_Added Section Close Button3': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(1) .style__listContainer___2fO3e >div:nth-child(3) .style__col___ak4o1:nth-child(3)',
  'GP Values_Added Section Close Button4': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(1) .style__listContainer___2fO3e >div:nth-child(4) .style__col___ak4o1:nth-child(3)',
  'GP Values_Added Section Close Button5': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(1) .style__listContainer___2fO3e >div:nth-child(5) .style__col___ak4o1:nth-child(3)',
  'GP Radio Buttons Section': '.form__flexRowOuter___XpiU4:nth-child(2) .style__container___2FB7W .style__radioGroupPadding___3jr4c',

  'GP No_Pacing': '.form__col___3CJjJ .form__flexRow___3cThm:nth-child(1) label[for*="NO_PACING"]',
  'GP Even_Pacing': '.form__col___3CJjJ .form__flexRow___3cThm:nth-child(1) label[for*="EVEN"]',
  'GP Even_Pacing Option': '.form__col___3CJjJ .form__flexRow___3cThm:nth-child(1) Input[value="EVEN"]',
  'GP Quick_Pacing': '.form__col___3CJjJ .form__flexRow___3cThm:nth-child(1) label[for*="QUICK_CATCH_UP"]',
  // 'GP Even_Pacing' :'.form__flexRowOuter___XpiU4:nth-child(2) .style__container___2FB7W .style__radioGroupPadding___3jr4c .radio__radio___31EXS>Input[id="undefined_EVEN"]',

  'Campaign Additional Constraints Checkbox': '.form__col___3CJjJ .form__flexRow___3cThm:nth-child(2) label[for*="add_constraints"]',
  'Creative Additional Constraints Checkbox': '.style__deliveryList___1hdQd:nth-child(2) .style__deliveryList___1hdQd:nth-child(2) .form__flexRow___3cThm:nth-child(2) label[for*="add_constraints"]',
  'AC Values_Added Section Close Button': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(2) .style__listContainer___2fO3e >div:nth-child(1) .style__col___ak4o1:nth-child(4)',
  'AC Values_Added Section Close Button2': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(2) .style__listContainer___2fO3e >div:nth-child(2) .style__col___ak4o1:nth-child(4)',
  'AC Values_Added Section Close Button3': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(2) .style__listContainer___2fO3e >div:nth-child(3) .style__col___ak4o1:nth-child(4)',
  'AC Values_Added Section Close Button4': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(2) .style__listContainer___2fO3e >div:nth-child(4) .style__col___ak4o1:nth-child(4)',
  'AC Values_Added Section Close Button5': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(2) .style__listContainer___2fO3e >div:nth-child(5) .style__col___ak4o1:nth-child(4)',


  'Campaign Goal_Pacing Section': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ:nth-child(1) .form__flexRow___3cThm:nth-child(1) .style__container___1aGsb',
  'Campaign AC Section': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ:nth-child(1) .form__flexRow___3cThm:nth-child(2) .style__container___1aGsb',
  'Campaign Inventory Section': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ:nth-child(2) .form__flexRow___3cThm:nth-child(1) .style__container___1aGsb',

  'Delivery_Save Button': 'button[type=\'submit\']',
  'Delivery_Cancel Button': 'button[type=\'button\']',
  'Joint Link': '.joint-link',
  'link_connection': '.connection-wrap',
  'No Rows Found': '.rt-noData',

  'Show on hover': '.form__flexRow___3cThm:nth-child(3) .style__radioGroupPadding___3jr4c >div:nth-child(3) label[class="radio__radio___31EXS"]',
  'Show on hover option':'.style__radioGroupPadding___3jr4c >div:nth-child(3) Input[name="showOverlayAllTime"]',

  'Show at all times': '.style__radioGroupPadding___3jr4c >div:nth-child(2) label',


  'CTA Top': 'label[for*="callToAction.topAligned_0"]',
  // .form__flexRow___3cThm:nth-child(4) .style__radio___15ifm >div:nth-child(1) >input showOverlayAllTime
  'CTA Top Option': 'Input[id="callToAction.topAligned_0"]',
  // '.form__flexRow___3cThm:nth-child(4) .style__radio___15ifm >div:nth-child(2)',
  'CTA Bottom':'label[for*="callToAction.topAligned_1"]',
  'CTA Bottom Option' :'Input[id="callToAction.topAligned_1"]',

  'Video Duration':'Input[name="video.durationSeconds"]',


};


const setElementLookupTable = {
  'Email': '[name=\'email\']', // TODO: Repeated as 'User Email'

  // Campaign Page , Account Management - Accounts, Users and Groups
  //'Campaign Name': '.form__input___1njKD.form__campaignManagement___1Aqxq >div Input[name="name"]',
  'Campaign Name': 'Input[name=\'name\']',
  'Edit Campaign Name': '.form__input___1njKD >div Input[name="name"]',
  'Parent Account Name': '.form__input___1njKD .Select-input > input',
  'Group Account Name': '.form__col___3CJjJ .Select-input > input',

  // Account Management - User and Groups Tab
  'User Group InputField': '.gridSelector__selectContainer___1_79I .Select-input > input',
  'Search Account': 'Input.style__searchBox___1oZ68',
  'Filter InputField': '.Select-input > input',
  'Detailed Filter InputField': '.nestedFilter__subInput___1GGOI .Select-input > input',

  // Creative

  'Name Field': '.form__flexRow___3cThm:nth-child(1) >div Input[name="name"]',
  'Video URL': '.form__flexRow___3cThm:nth-child(2) >div Input[name="video.videoURL"]',
  'Vast URL':'.form__flexRow___3cThm:nth-child(2) >div Input[name="video.vastTagUrl"]',
  'Vast XML':'.form__flexRow___3cThm:nth-child(2) >div textarea[name="video.vastTagXml"]',
  'Video Type Field-Label' :'.form__flexRow___3cThm:nth-child(2) .style__subLabel___24lqe',


  // delivery
  'Enter the Number Field': '.form__input___1njKD',
  'Creative Enter the Number Field':'.style__deliveryList___1hdQd:nth-child(2) .form__input___1njKD',

  'GP Add': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(1) .style__addBtn___85K27',
  'Creative GP Add': '.style__deliveryList___1hdQd:nth-child(2) .form__flexRow___3cThm:nth-child(1) .style__addBtn___85K27',

  'AC Enter the Number Field': '.style__small___188W3',
  'Creative AC Enter the Number Field':'.style__deliveryList___1hdQd:nth-child(2) .style__small___188W3',

  'AC Add': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(2) .style__addBtn___85K27',
  'Creative AC Add': '.style__deliveryList___1hdQd:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(2) .style__addBtn___85K27',


  'Campaign_Inv_Overall_MinBid': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ:nth-child(2) Input[name*="minBid"]',
  'Creative_Inv_Overall_MinBid': '.style__deliveryList___1hdQd:nth-child(2)  .form__col___3CJjJ:nth-child(2) Input[name*="minBid"]',

  'Campaign_Inv_Overall_MaxBid': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ:nth-child(2) Input[name*="maxBid"]',
  'Creative_Inv_Overall_MaxBid': '.style__deliveryList___1hdQd:nth-child(2)  .form__col___3CJjJ:nth-child(2) Input[name*="maxBid"]',

  'Campaign Pause Button': '.style__deliveryList___1hdQd:nth-child(1) >li >div .fa-pause-circle',
  'Campaign Play Button': '.style__deliveryList___1hdQd:nth-child(1) >li >div .fa-play-circle',

  // delivery Creative
  'Creative Pause Button':'.style__deliveryList___1hdQd:nth-child(2) >li >ul .fa-pause-circle',
  'Creative Play Button':'.style__deliveryList___1hdQd:nth-child(2) >li >ul .fa-play-circle',

};


const loadingLookupTable = {
  'Loading Messages': '.-loading',
  'Current Tab Loading Message': '.tab__tabContentActive___3V4vx .-loading',
};

const checkContainsTextLookupTable = {
  'ErrorMessage': 'div[class=\'login__message___3ouKz\']',
  'LogoutSuccessMessage': 'p[class=\'login__messageText___AXpSb\']',
  'Message': 'p.errors__messageText___29aw0',
  'Delete Confirmation Message': '.confirmDialog__labelContainer___3KOu9',
  'Header Text Character Count': '.ReactCollapse--collapse  div:nth-child(3) > div:nth-child(1)  .style__counter___5JOye',
  'Line2 Character Count': '.ReactCollapse--collapse  div:nth-child(3) > div:nth-child(2)  .style__counter___5JOye',
  'Line3 Character Count': '.ReactCollapse--collapse  div:nth-child(4) > div:nth-child(1)  .style__counter___5JOye',
  'CTA Message Character Count': '.form__flexRow___3cThm:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(2) .form__col___3CJjJ:nth-child(2) .style__counter___5JOye',
  'CTA Button Character Count': '.form__flexRow___3cThm:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(3) .form__col___3CJjJ:nth-child(1) .style__counter___5JOye',


  'Alert Message': '.errors__message___5AoWM >P:nth-child(1)',
  'New User Status': '.tab__tabContentActive___3V4vx .datagrid__rtTrGroup___2oDPX:nth-child(1) .datagrid__rtTd___-YAv-:nth-child(2) >div',

  'Form Field Value Incorrect': 'span.validation__error___1F1S3',
  'Field Error Message': '.validation__dialogError___3qCly',
  'Domain Field Error messsage' :'.tags__dialogError___d7MgZ',
  'Field Error Validation': '.validation__error___jw1Ll',

  'Dropdown Field Error': '.validation__dialogError___TgOQC',
  'Password Field Value Message': 'div[class=\'common__inputContainer___3nWeL\']:nth-child(2)',
  'Confirm Password Field Value Message': 'div[class=\'common__inputContainer___3nWeL\']:nth-child(3)',
  'Profile Role': 'div.Navigation__profile___Xr00J .Navigation__navItem___1O8Pb >span',


  'User List': '.tab__tabContentActive___3V4vx .rt-td.datagrid__rtTd___-YAv- div:nth-child(1)',

  'UserDisabled': 'div.accountManagement__tabContentActive___qVIpN .datagrid__rtTrGroup___2oDPX:nth-child(1) .statusCellRenderer__redCircle___14M6G',
  'User in the Invite': '.invitation__invitationEmail___No-NJ',
  'Account in the Invite': '.invitation__invitationAccount___2xaHk',

  'Account List': '.tab__tabContentActive___3V4vx .datagrid__selectedRow___3YsXr >div:nth-child(2)>div',
  'Groups List': '.tab__tabContentActive___3V4vx .datagrid__selectedRow___3YsXr >div:nth-child(2)>div',
  'LineItem List': '.tab__tabContentActive___3V4vx .datagrid__selectedRow___3YsXr >div:nth-child(2)>div',
  'Campaign in the LineItem List': '.tab__tabContentActive___3V4vx .datagrid__selectedRow___3YsXr >div:nth-child(3)',

  'Groups List(to be deleted)': '.tab__tabContentActive___3V4vx .datagrid__rtTrGroup___2oDPX:nth-child(1) .rt-tr >div:nth-child(2)>div',

  'Groups User1 Status': '.gridSelector__container___1zpWG .datagrid__rtTable___1jUh7 .datagrid__rtTrGroup___2oDPX:nth-child(1) .rt-tr.datagrid__selectedRow___3YsXr >div:nth-child(2)>div',
  'Groups User2 Status': '.gridSelector__container___1zpWG .datagrid__rtTable___1jUh7 .datagrid__rtTrGroup___2oDPX:nth-child(2) .rt-tr.datagrid__selectedRow___3YsXr >div:nth-child(2)>div',
  'Groups User3 Status': '.gridSelector__container___1zpWG .datagrid__rtTable___1jUh7 .datagrid__rtTrGroup___2oDPX:nth-child(3) .rt-tr.datagrid__selectedRow___3YsXr >div:nth-child(2)>div',
  '2 Grid Groups List': 'div.accountManagement__tabContentActive___qVIpN .datagrid__rtTrGroup___2oDPX:nth-child(1) .datagrid__selectedRow___3YsXr >div:nth-child(2)>div',

  'Creative1 Title': 'g[data-pseudo-id="CREATIVE-Ha_Creative 1 DO-NOT-DELETE"]',
  'Creative2 Title': 'g[data-pseudo-id="CREATIVE-Creative 2 DO-NOT DEL"]',



  'Creative Group1 Title': 'g[data-pseudo-id="CREATIVEGROUP-Creative Group 1"]',

  'GP Values_Added Section': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(1) .style__listContainer___2fO3e',
  'GP Type': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(1) .style__listContainer___2fO3e >div .style__col___ak4o1:nth-child(1)',
  'GP Value': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(1) .style__listContainer___2fO3e >div .style__col___ak4o1:nth-child(2)',
  'GP Values_Added Section Close Button': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(1) .style__listContainer___2fO3e >div .style__col___ak4o1:nth-child(3)',

  'Creative GP Values_Added Section Close Button':'.style__deliveryList___1hdQd:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(1) .style__listContainer___2fO3e >div .style__col___ak4o1:nth-child(3)',


  'AC Values_Added Section': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(2) .style__listContainer___2fO3e',
  'AC Period': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(2) .style__listContainer___2fO3e >div .style__col___ak4o1:nth-child(1)',
  'AC Type': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(2) .style__listContainer___2fO3e >div .style__col___ak4o1:nth-child(2)',
  'AC Values_Added Section Close Button': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(2) .style__listContainer___2fO3e >div .style__col___ak4o1:nth-child(3)',
  'AC Value': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(2) .style__listContainer___2fO3e >div .style__col___ak4o1:nth-child(3)',

  'Creative AC Value': '.style__deliveryList___1hdQd:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(2) .style__listContainer___2fO3e >div .style__col___ak4o1:nth-child(3)',


  'Inv_Vend0_Max_Validation': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .style__inventoryCheckbox___2sk6Y:nth-child(1) .style__maxBudgetStyle___3nHnu .validation__error___jw1Ll',
  'Inv_Vend0_Min_Validation': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .style__inventoryCheckbox___2sk6Y:nth-child(1) .style__flexRow___2o4Xh >div:nth-child(1) .validation__error___jw1Ll',

  'Inv_Vend1_Max_Validation': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .style__inventoryCheckbox___2sk6Y:nth-child(2) .style__maxBudgetStyle___3nHnu .validation__error___jw1Ll',
  'Inv_Vend1_Min_Validation': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .style__inventoryCheckbox___2sk6Y:nth-child(2) .style__flexRow___2o4Xh >div:nth-child(1) .validation__error___jw1Ll',

  'Inv_Vend2_Max_Validation': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .style__inventoryCheckbox___2sk6Y:nth-child(3) .style__maxBudgetStyle___3nHnu .validation__error___jw1Ll',
  'Inv_Vend2_Min_Validation': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .style__inventoryCheckbox___2sk6Y:nth-child(3) .style__flexRow___2o4Xh >div:nth-child(1) .validation__error___jw1Ll',

  'Engagement Card Name_Validation': '.form__flexRow___3cThm:nth-child(1) .validation__error___jw1Ll',
  'EC Type Thank you CTA Header_Validation': '.form__flexRow___3cThm:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(2) .form__col___3CJjJ:nth-child(2) .validation__error___jw1Ll',
  'EC Type Thank you CTA Button_Validation': '.form__flexRow___3cThm:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(3) .form__col___3CJjJ:nth-child(1) .validation__error___jw1Ll',

  // delivery Creative
  'Creative Pause Button':'.style__deliveryList___1hdQd:nth-child(2) >li >ul .fa-pause-circle',


};

const clickElementInDropDownTable = {
  'Matched Account': '.style__label___2qLPF',
  'Matched Child Account': '.style__accountsList___3_X4C',
  'Account Name Dropdown': '.Select-option',
  'Parent Account': '.Select-option',
  'Group Name Dropdown': '.Select-option',
  'Filter Dropdown Elements': '.Select-option',
  'Detailed Filter Dropdown Elements': '.Select-option',
  'User Group Value1': '.Select-option',
};

const elementsInColumn = { // Grabs all elements in a particular column
  'Name Column Elements': '.tab__tabContentActive___3V4vx .actionCellRenderer__cellContainer___1Fq2x',

  'Group Name List': 'div.actionCellRenderer__cellContainer___rAY9z',

  'Users Count Column Elements': '.tab__tabContentActive___3V4vx .datagrid__rtTd___-YAv-:nth-child(5)',

  'Groups Count Column Elements': '.tab__tabContentActive___3V4vx .datagrid__rtTd___-YAv-:nth-child(4)',

  '# of Groups Column Elements': '.tab__tabContentActive___3V4vx .datagrid__rtTd___-YAv-:nth-child(8)'
};

const storeCountLookupTable = {
  'Number of Groups': '.tab__tabContentActive___3V4vx .datagrid__rtTrGroup___2oDPX .datagrid__selectedRow___3YsXr .datagrid__rtTd___-YAv-:nth-child(4)',
  '#Groups count in Users Tab': '.tab__tabContentActive___3V4vx .datagrid__rtTrGroup___2oDPX .datagrid__selectedRow___3YsXr .datagrid__rtTd___-YAv-:nth-child(8)',
  'Number of Users in Account Tab': '.tab__tabContentActive___3V4vx .datagrid__rtTrGroup___2oDPX .datagrid__selectedRow___3YsXr .datagrid__rtTd___-YAv-:nth-child(5)',

};

function findElementInTable(key) {
  if (key in clickElementLookupTable) {
    return clickElementLookupTable[key];
  }
  if (key in isExistingLookupTable) {
    return isExistingLookupTable[key];
  }
  if (key in setElementLookupTable) {
    return setElementLookupTable[key];
  }
  if (key in checkContainsTextLookupTable) {
    return checkContainsTextLookupTable[key];
  }
  if (key in loadingLookupTable) {
    return loadingLookupTable[key];
  }
  if (key in clickElementInDropDownTable) {
    return clickElementInDropDownTable[key];
  }
  if (key in elementsInColumn) {
    return elementsInColumn[key];
  }
  if (key in storeCountLookupTable) {
    return storeCountLookupTable[key];
  }
  if (key in dashboardNavigation) {
    return dashboardNavigation[key];
  }

  const accountManagementSelector = getAccountManagementSelector(key);
  if (accountManagementSelector) {
    return accountManagementSelector;
  }

  const campaignCanvasSelector = getCampaignCanvasSelector(key);
  if (campaignCanvasSelector) {
    return campaignCanvasSelector;
  }

  if (key in campaignManagementCampaignsTab) {
    return campaignManagementCampaignsTab[key];
  }

  const reportSelector = getReportSelector(key);
  if (reportSelector) {
    return reportSelector;
  }

  if (key in errorPopups) {
    return errorPopups[key];
  }
  if (key in druidTable) {
    return druidTable[key];
  }
  if (key in googleVastInspectorTable) {
    return googleVastInspectorTable[key];
  }
  if (key in oldVGSiteTable) {
    return oldVGSiteTable[key];
  }

  // check if it's in a row of a grid
  const rowMatcher = /^(.+) in row #(\d+)$/;
  const matches = key.match(rowMatcher);

  if (matches !== null) {
    const [, elName, rowNumber] = matches;
    return getGridElement(elName, rowNumber);
  }

  const timePickerMatcher = /^(hour|minute) (\d+)$/;
  const timePickerMatches = key.match(timePickerMatcher);

  if (timePickerMatches !== null) {
    const [, type, number] = timePickerMatches;
    return getHourOrMinuteSelector(type, number);
  }

  // Pass the Node type, a space, and then the name of the node.
  // For most nodes this is the part to the right of the dash in the data-pseudo-id: [data-pseudo-id="TARGETING-Targeting 1"]
  // Example Usage: "Start Node" "Line Item 1", "Creative 2 DO-NOT DEL", "Targeting 1", "Tracking 1" ,"EngagementCard 1"
  const canvasNodeMatcher = /^(Start Node|Creative Group|Creative|Line Item|Targeting|Tracking|EngagementCard)([^"]*)$/;
  const canvasNodeMatches = key.match(canvasNodeMatcher);

  if (canvasNodeMatches !== null) {
    const [, nodeType, nodeName] = canvasNodeMatches;
    return getNodeSelector(nodeType, `${nodeType}${nodeName}`);
  }

  const rtbUtilAdUnitsMatcher = /^(actual views) for the adUnit from the bid response$/;
  const rtbUtilAdUnitsMatches = key.match(rtbUtilAdUnitsMatcher);

  if (rtbUtilAdUnitsMatches !== null) {
    const [,adUnitProperty] = rtbUtilAdUnitsMatches;
    const adId = currentVastUrl.getInstance().getVastId();
    return getadIdProperty(adId, adUnitProperty);
  }

  assert.fail(-1, -1, `Element ${key} could not be found`);
}

module.exports = {
  findElementInTable
};
