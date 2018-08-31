import chooseFile from '../../support/action/chooseFile';
import pressButton from '../../support/action/pressButton';
import clearInputField from '../../support/action/clearInputField';
import clickElement from '../../support/action/clickElement';
import clickElementInDropDown from '../../support/action/clickElementInDropDown';
import closeLastOpenedWindow from '../../support/action/closeLastOpenedWindow';
import connectCanvasNodes from '../../support/VGSpecificStepMethods/CampaignCanvas/action/connectCanvasNodes';
import createReport from '../../support/VGSpecificStepMethods/ReportManagement/action/createReport';
import currentVastUrl from '../../support/objects/currentVastUrl';
import deleteCanvasEdge from '../../support/VGSpecificStepMethods/CampaignCanvas/action/deleteCanvasEdge';
import deleteCookie from '../../support/action/deleteCookie';
import dragElement from '../../support/action/dragElement';
import {
  editEnableOrDisableGroupOrUser,
  editEnableOrDisableAccountCampaignOrCreative
} from '../../support/VGSpecificStepMethods/AccountCampaignManagement/action/editEnableOrDisableRow';
import editCopyOrViewReport from '../../support/VGSpecificStepMethods/ReportManagement/action/editCopyOrViewReport';
import focusLastOpenedWindow from '../../support/action/focusLastOpenedWindow';
import handleModal from '../../support/action/handleModal';
import leftClickWithOffset from '../../support/action/leftClickWithOffset';
import loginAs from '../../support/action/loginAs';
import makeBidRequest from '../../support/VGSpecificStepMethods/RTB/action/makeBidRequest';
import openPerfWebsite from '../../support/action/openPerfWebsite';
import openExistingTargeting from '../../support/VGSpecificStepMethods/CampaignCanvas/action/openExistingTargeting';
import moveToElement from '../../support/action/moveToElement';
import openWindowFromProperty from '../../support/actionCombinations/openWindowFromProperty';
import pause from '../../support/action/pause';
import pauseDemo from '../../support/action/pauseDemo';
import refreshScreen from '../../support/action/refreshScreen';
import scroll from '../../support/action/scroll';
import selectOption from '../../support/action/selectOption';
import selectOptionByIndex from '../../support/action/selectOptionByIndex';
import setAttribute from '../../support/action/setAttribute';
import setCookie from '../../support/action/setCookie';
import setColorPicker from '../../support/VGSpecificStepMethods/CampaignCanvas/action/setColorPicker';
import setInputFieldWithDate from '../../support/action/setInputFieldWithDate';
import setInputFieldWithDateAppended from '../../support/action/setInputFieldWithDateAppended';
import setInputFieldwithStoredValue from '../../support/action/setInputFieldwithStoredValue';
import setInput from '../../support/action/setInput';
import setElement from '../../support/action/setElement';
import selectFilter from '../../support/VGSpecificStepMethods/AccountCampaignManagement/action/selectFilter';
import selectFilterParameter from '../../support/VGSpecificStepMethods/AccountCampaignManagement/action/selectFilterParameter';
import setPromptText from '../../support/action/setPromptText';
import {setVariable} from '../../support/LookupTables/storedVariables';
import {simulateShiftClick, simulatePaste} from '../../support/action/simulateMouseKeyboard';
import storeAdIdText from '../../support/action/storeAdIdText';
import storeText from '../../support/action/storeText';
import storeValueFromElementOrInputField from '../../support/action/storeValueFromElementOrInputField';
import storeUpdatedText from '../../support/action/storeUpdatedText';
import submitForm from '../../support/action/submitForm';
import switchFrame from '../../support/action/switchFrame';
import switchFrameThenClickElement from '../../support/actionCombinations/switchFrameThenClickElement';
import StoreCharorMessageCount from '../../support/action/StoreCharorMessageCount';
import selectAccount from '../../support/VGSpecificStepMethods/Dashboard/action/selectAccount';
import GridSelectedRowsCount from '../../support/action/GridSelectedRowsCount';
import selectDate from '../../support/VGSpecificStepMethods/CampaignCanvas/action/selectDate';
import enterInventory from '../../support/VGSpecificStepMethods/CampaignCanvas/action/enterInventory';
import clickToLastPage from '../../support/VGSpecificStepMethods/Generic/action/clickToLastPage';
import deleteGridRow from '../../support/VGSpecificStepMethods/AccountCampaignManagement/action/deleteGridRow';
import deleteReportRow from '../../support/VGSpecificStepMethods/ReportManagement/action/deleteReportRow';
import createCampaignandNavigateCreativePage from '../../support/VGSpecificStepMethods/AccountCampaignManagement/action/createCampaignandNavigatetoCreativePage';
import createAccount from '../../support/VGSpecificStepMethods/AccountCampaignManagement/action/createAccount';
import createUser from '../../support/VGSpecificStepMethods/AccountCampaignManagement/action/createUser';
import acceptUserInvite from '../../support/VGSpecificStepMethods/EmailFunctionality/action/acceptUserInvite';
import createGroup from '../../support/VGSpecificStepMethods/AccountCampaignManagement/action/createGroup';
import createCreativewithNameandVastUrl, {openExistingCreative} from '../../support/VGSpecificStepMethods/CampaignCanvas/action/createCreativewithNameandVideoURL';
import waitForDeliveredView from '../../support/VGSpecificStepMethods/Generic/action/waitForDeliveredView';
import waitForReportGeneration from '../../support/VGSpecificStepMethods/ReportManagement/action/waitForReportGeneration';

module.exports = function when() {
  this.When(
    /^I (click|doubleClick) on (?:the )?"([^"]*)?"$/,
    clickElement
  );

  this.When(
    /^I left click on (?:the )?"([^"]*)?" with x offset (\d+)px and y offset (\d+)px$/,
    leftClickWithOffset
  );

  this.When(
    /^I select default account$/,
    selectAccount
  );

  this.When(
    /^I select Filter Criteria "([^"]+)"$/,
    selectFilter
  );

  this.When(
    /^I (enter|select) Filter Criteria Parameter "([^"]+)"$/,
    selectFilterParameter
  );

  this.When(
    /^I enter Date fields "([^"]+)", "([^"]+)" and select TimeZone Value$/,
    selectDate
  );

  this.When(
    /^I fill Mandatory fields "([^"]+)" , "([^"]+)" and select Vendor in Inventory Section$/,
    enterInventory
  );


  this.When(
    /^I click on (stored value )?"([^"]*)?" in the(?: "([^"]+)")? drop down$/,
    clickElementInDropDown
  );


  this.When(
    /^I log into the site with email "([^"]*)?" and password "([^"]*)?"$/,
    loginAs
  );

  this.When(
    /^I open the perf rtb site "([^"]*)?"( for the newest campaign)?$/,
    openPerfWebsite
  );

  this.When(
    /^I (add|set) "([^"]*)?" to the inputfield appended with current Date_Time "([^"]*)?"$/,
    setInputFieldWithDateAppended
  );

  this.When(
    /^^I set the inputfield "([^"]+)" to the( current)? date(?: (\d+) days (from now|ago))?$/,
    setInputFieldWithDate
  );

  this.When(
    /^I (add|set) stored value "([^"]+)" to (?:the )?inputfield "([^"]+)"$/,
    setInputFieldwithStoredValue
  );

  this.When(
    /^I (add|set) "([^"]*)?" to the inputfield "([^"]*)?"$/,
    setInput
  );

  this.When(
    /^I (add|set) "([^"]*)?" to "([^"]*)?"$/,
    setElement
  );

  this.When(
    /^I (add|set) the vast url from the bid response to the inputfield "([^"]*)?"$/,
    (method, element, done) => {
      setInput(method, currentVastUrl.getInstance().getVastUrl(), element, done);
    }
  );

  this.When(
    /^I (add|set) the updated vast url from the bid response to the inputfield "([^"]*)?"$/,
    (method, element, done) => {
      setInput(method, currentVastUrl.getInstance().getVastUrl().replace('$MBR', 1), element, done);
    }
  );

  this.When(
    /^I clear the inputfield "([^"]*)?"$/,
    clearInputField
  );

  this.When(
    /^I drag "([^"]+)" to "([^"]+)"$/,
    dragElement.dragSourceToDestination
  );

  this.When(
    /^I move "([^"]+)" by x offset (\d+) and y offset (\d+)$/,
    dragElement.dragByOffset
  );

  this.When(
    /^I submit the form "([^"]*)?"$/,
    submitForm
  );

  // The second argument should provide a reason for the pause (Example: for the database to update, for popup Y to disappear)
  this.When(
    /^I pause for (\d+)ms(?: [^"]*)?$/,
    pause
  );
  this.When(
    /^I pause for Demo(?: for (\d+)ms)?$/,
    pauseDemo
  );

  this.When(
    /^I set a cookie "([^"]*)?" with the content "([^"]*)?"$/,
    setCookie
  );

  this.When(
    /^I delete the cookie "([^"]*)?"$/,
    deleteCookie
  );

  this.When(
    /^I set the "([^"]+)" attribute of (?:the )?"([^"]+)" to "([^"]+)"$/,
    setAttribute
  );

  this.When(
    /^I shift click on the element "([^"]*)?"$/,
    simulateShiftClick
  );

  this.When(
    /^I paste copied text into the inputfield "([^"]*)?"$/,
    simulatePaste
  );

  this.When(
    /^I (accept|dismiss) the (alertbox|confirmbox|prompt)$/,
    handleModal
  );

  this.When(
    /^I enter "([^"]*)?" into the prompt$/,
    setPromptText
  );

  this.When(
    /^I scroll to element "([^"]*)?"$/,
    scroll
  );


  this.When(
    /^I close the last opened (window|tab)$/,
    closeLastOpenedWindow
  );

  this.When(
    /^I focus the last opened (window|tab)$/,
    focusLastOpenedWindow
  );

  this.When(
    /^I select the (\d+)(st|nd|rd|th) option for element "([^"]*)?"$/,
    selectOptionByIndex
  );

  this.When(
    /^I select the option with the (name|value|text|id) "([^"]*)?" for element "([^"]*)?"$/,
    selectOption
  );

  this.When(
    /^I mousehover on element "([^"]*)?"( with an offset of (\d+),(\d+))*$/,
    moveToElement
  );

  this.When(
    /^I switch to the frame "([^"]*)?"$/,
    switchFrame
  );

  this.When(
    /^I refresh the screen( and accept the alert)?$/,
    refreshScreen
  );

  this.When(
    /^I make a bid request(?: with host "([^"]*)?")?(?: and userAgent "([^"]*)?")?(?: and buyeruid "([^"]*)?")?$/,
    makeBidRequest.makeBidRequestWithParameters
  );

  this.When(
    /^I make a bid request with(?: host "([^"]*)?" and)? configuration "([^"]*)?"$/,
    makeBidRequest.makeBidRequestWithConfiguration
  );

  this.When(
    /^I (click|doubleClick) on "([^"]*)?" on the "([^"]*)?"$/,
    switchFrameThenClickElement
  );

  this.When(
    /^I click on player's (link|button|element) "([^"]*)?" on the "([^"]*)?"$/,
    switchFrameThenClickElement
  );

  this.When(
    /^I copy the( css)? attribute "([^"]*)?" from element "([^"]*)?" and open the url in a new tab$/,
    openWindowFromProperty
  );

  this.Then(
    /^I verify Adunit ID and store the count from "([^"]+)" in RTB druid as "([^"]+)"$/,
    storeAdIdText
  );

  this.When(
    /^I store that (element|inputfield) "([^"]*)?" text "([^"]*)?"$/,
    storeText
  );

  this.When(
    /^I store the value from (element|inputfield) "([^"]+)" as "([^"]+)"$/,
    storeValueFromElementOrInputField
  );

  this.When(
    /^I store that (element|inputfield) "([^"]*)?" updated text "([^"]*)?"$/,
    storeUpdatedText
  );

  this.When(
    /^I store the count from the field "([^"]*)?" as "([^"]*)?"$/,
    StoreCharorMessageCount
  );

  this.When(
    /^I store the number of "([^"]+)" as "([^"]+)"$/,
    GridSelectedRowsCount
  );

  this.When(
    /^I click on (element|inputfield) "([^"]+)" till I navigate to last "([^"]+)"$/,
    clickToLastPage
  );

  this.When(
    /^I delete the newly added row in the Grid$/,
    (done) => deleteGridRow.deleteRow(1, done)
  );

  this.When(
    /^I delete the (Account|Campaign|Creative) named (with stored variable )?"([^"]+)"$/,
    deleteGridRow.deleteAccountCampaignOrCreative
  );

  this.When(
    /^I delete the (Group|User) named (with stored variable )?"([^"]+)" that is paired with the Account named (with stored variable )?"([^"]+)"$/,
    deleteGridRow.deleteGroupOrUser
  );

  this.When(
    /^I (click the checkbox for|disable|edit|enable) the (Account|Campaign|Creative) named (with stored variable )?"([^"]+)"$/,
    editEnableOrDisableAccountCampaignOrCreative
  );

  this.When(
    /^I (disable|edit|enable) the (Group|User) named (with stored variable )?"([^"]+)" that is paired with the Account named (with stored variable )?"([^"]+)"$/,
    editEnableOrDisableGroupOrUser
  );

  this.When(
    /^I (copy|edit|view) the report named (with stored variable )?"([^"]+)" that is paired with the account named (with stored variable )?"([^"]+)"$/,
    editCopyOrViewReport
  );

  this.When(
    /^I delete the report named (with stored variable )?"([^"]+)" that is paired with the account named (with stored variable )?"([^"]+)"$/,
    deleteReportRow
  );

  this.When(
    /^I wait for the report to generate$/,
    waitForReportGeneration
  );

  this.When(
    /^I create a campaign "([^"]+)" and click on the campaign link to navigate to Creative Page$/,
    createCampaignandNavigateCreativePage
  );

  this.When(/^I create an edge from the (bottom|top|left|right) port of "(Start Node|Creative|Line Item|Targeting|Tracking)([^"]*)" and connect it to the (bottom|top|left|right) port of "(Start Node|Creative|Line Item|Targeting|Tracking)([^"]*)"$/,
    connectCanvasNodes.createEdgeAndConnectToTargetNode
  );

  this.When(/^I delete the edge between source "(Start Node|Creative|Line Item|Targeting|Tracking)([^"]*)" and target "(Start Node|Creative|Line Item|Targeting|Tracking)([^"]*)"$/,
    deleteCanvasEdge
  );

  this.When(
    /^I create New Account with user defined values "([^"]+)", "([^"]+)", "([^"]+)", "([^"]+)", "([^"]+)", "([^"]+)" and "([^"]+)"$/,
    createAccount
  );

  this.When(
    /^I create a new user named "([^"]+)" with email "([^"]+)" under account (named with stored variable )?"([^"]+)"$/,
    createUser
  );

  this.When(
    /^I accept New User Invite and provide user defined values "([^"]+)", "([^"]+)", "([^"]+)" and "([^"]+)"$/,
    acceptUserInvite
  );
  this.When(
    /^I create a new group named "([^"]+)" under account (named with stored variable )?"([^"]+)" with email (named with stored variable )?"([^"]*)" and Campaign (Read|Write|Read and Write) permissions$/,
    createGroup
  );

  this.When(
    /^I create (?:(and save) )?a new creative named "([^"]+)" with vast url "([^"]+)"$/,
    createCreativewithNameandVastUrl
  );

  this.When(
    /^I open the creative$/,
    openExistingCreative
  );

  this.When(
    /^I open the targeting node$/,
    openExistingTargeting
  );

  this.When(
    /^I create a new report named "([^"]+)" with dimensions "([^"]*)?" metrics "([^"]*)?" and run type "([^"]*)?"$/,
    createReport
  );

  this.When(
    /^I select file "([^"]+)" of type "([^"]+)" for the element "([^"]+)"$/,
    chooseFile
  );

  this.When(
    /^I store "([^"]+)" as a variable named "([^"]+)"$/,
    (variableValue, variableName) => {
      setVariable(variableName, variableValue);
    }
  );

  this.When(
    /^I let the video play long enough to trigger a delivered view$/,
    waitForDeliveredView
  );

  this.When(
    /^I press "([^"]+)"$/,
    pressButton
  );

  this.When(
    /^I open the "([^"]+)" color picker and set it to the color "([^"]+)"$/,
    setColorPicker
  );

};

