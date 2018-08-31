import checkBidResponse from '../../support/VGSpecificStepMethods/RTB/check/checkBidResponse';
import checkClass from '../../support/check/checkClass';
import checkColor from '../../support/check/checkColor';
import checkContainsAnyText from '../../support/check/checkContainsAnyText';
import checkContainsDate from '../../support/check/checkContainsDate';
import checkContainsText from '../../support/check/checkContainsText';
import checkListOrder from '../../support/VGSpecificStepMethods/Generic/check/checkListOrder';
import checkGridContainsText from '../../support/check/checkGridContainsText';
import checkCookieContent from '../../support/check/checkCookieContent';
import checkCookieExists from '../../support/check/checkCookieExists';
import checkDimension from '../../support/check/checkDimension';
import checkEqualsText from '../../support/check/checkEqualsText';
import checkFileDownloaded from '../../support/check/checkFileDownloaded';
import checkFocus from '../../support/check/checkFocus';
import checkInURLPath from '../../support/check/checkInURLPath';
import checkIsOpenedInNewWindow from
  '../../support/check/checkIsOpenedInNewWindow';
import checkModal from '../../support/check/checkModal';
import checkModalText from '../../support/check/checkModalText';
import checkNewWindow from '../../support/check/checkNewWindow';
import checkOffset from '../../support/check/checkOffset';
import checkPage from '../../support/check/checkPage';
import checkProperty from '../../support/check/checkProperty';
import checkSelected from '../../support/check/checkSelected';
import checkTitle from '../../support/check/checkTitle';
import checkTitleContains from '../../support/check/checkTitleContains';
import checkURL from '../../support/check/checkURL';
import checkURLPath from '../../support/check/checkURLPath';
import checkWithinViewport from '../../support/check/checkWithinViewport';
import compareScreenshots from '../../support/check/compareScreenshot';
import compareStoredVariables from '../../support/check/compareStoredVariables';
import compareText from '../../support/check/compareText';
import isEnabled from '../../support/check/isEnabled';
import isExisting from '../../support/check/isExisting';
import checkEqualsStoredValue from '../../support/check/checkEqualsStoredValue';
import isVisible from '../../support/check/isVisible';
import waitFor from '../../support/action/waitFor';
import waitForVisible from '../../support/action/waitForVisible';
import checkTableContainsText from '../../support/check/checkTableContainsText';
import checkSortOrder from '../../support/check/checkSortOrder';
import checkGridCount from '../../support/check/checkGridCount';
import checkNumberComma from '../../support/check/checkNumberComma';
import checkCTACharCount from '../../support/VGSpecificStepMethods/Generic/check/checkCTACharCount';

module.exports = function then() {
  this.Then(
    /^I expect that the title is( not)* "([^"]*)?"$/,
    checkTitle
  );

  this.Then(
    /^I expect the title to contain "([^"]*)?"$/,
    checkTitleContains
  );

  this.Then(
    /^I expect that element "([^"]*)?" is( not)* visible$/,
    isVisible
  );

  this.Then(
    /^I wait for( all)* "([^"]*)?" to become( not)* visible$/,
    waitForVisible
  );

  this.Then(
    /^I expect that element "([^"]*)?" is( not)* within the viewport$/,
    checkWithinViewport
  );

  this.Then(
    /^I expect that element "([^"]+)" does( not)? exist(?: (\d+) times)?$/,
    isExisting
  );

  this.Then(
    /^I expect that (element|inputfield) "([^"]+)" does( not)* equal stored value "([^"]+)"$/,
    checkEqualsStoredValue
  );

  this.Then(
    /^I expect that element "([^"]*)?"( not)* contains the same text as element "([^"]*)?"$/,
    compareText
  );

  this.Then(
    /^I expect that (element|inputfield) "([^"]*)?"( not)* matches the text "([^"]*)?"$/,
    checkEqualsText
  );

  this.Then(
    /^I expect that (element|inputfield) "([^"]+)"( not)? contains the (stored value|text) "([^"]+)"$/,
    checkContainsText
  );

  this.Then(
    /^I expect that (element|inputfield) "([^"]+)"( not)? contains the current (date|hour|minute)$/,
    checkContainsDate
  );

  this.Then(
    /^I expect that the Grid element "([^"]+)" does( not)* contain the text "([^"]+)"$/,
    checkGridContainsText
  );

  this.Then(
    /^I expect that (element|inputfield) "([^"]*)?"( not)* contains any text$/,
    checkContainsAnyText
  );

  this.Then(
    /^I expect that table element "([^"]*)?" contains element with text "([^"]*)?"$/,
    checkTableContainsText
  );

  this.Then(
    /^I expect that (element|inputfield) "([^"]+)?" is( not)? empty$/,
    checkContainsAnyText
  );

  this.Then(
    /^I expect that the url is( not)* "([^"]*)?"$/,
    checkURL
  );

  this.Then(
    /^I expect that the path is( not)* "([^"]*)?"$/,
    checkURLPath
  );

  this.Then(
    /^I expect the url to( not)* contain "([^"]*)?"$/,
    checkInURLPath
  );

  this.Then(
    /^I expect that the( css)* attribute "([^"]*)?" of element "([^"]*)?" is( not)* "([^"]*)?"$/,
    checkProperty
  );

  this.Then(
    /^I expect that the( background)? color of element "([^"]+)?" is( not)? "([^"]+)?"$/,
    checkColor
  );

  this.Then(
    /^I expect that checkbox "([^"]*)?" is( not)* checked$/,
    checkSelected
  );

  this.Then(
    /^I expect that element "([^"]*)?" is( not)* selected$/,
    checkSelected
  );

  this.Then(
    /^I expect that element "([^"]*)?" is( not)* enabled$/,
    isEnabled
  );

  this.Then(
    /^I expect that cookie "([^"]*)?"( not)* contains "([^"]*)?"$/,
    checkCookieContent
  );

  this.Then(
    /^I expect that cookie "([^"]*)?"( not)* exists$/,
    checkCookieExists
  );

  this.Then(
    /^I expect that element "([^"]*)?" is( not)* ([\d]+)px (broad|tall)$/,
    checkDimension
  );

  this.Then(
    /^I expect that element "([^"]*)?" is( not)* positioned at ([\d]+)px on the (x|y) axis$/,
    checkOffset
  );

  this.Then(
    /^I expect that element "([^"]*)?" (has|does not have) the class "([^"]*)?"$/,
    checkClass
  );

  this.Then(
    /^I expect a new (window|tab) has( not)* been opened$/,
    checkNewWindow
  );

  this.Then(
    /^I expect the url "([^"]*)?" is opened in a new (tab|window)$/,
    checkIsOpenedInNewWindow
  );

  this.Then(
    /^I expect that element "([^"]*)?" is( not)* focused$/,
    checkFocus
  );

  this.Then(
    /^I wait on element "([^"]*)?"( for (\d+)ms)*( to( not)* (be checked|be enabled|be selected|be visible|contain a text|contain a value|exist))*$/,
    waitFor
  );

  this.Then(
    /^I expect that a (alertbox|confirmbox|prompt) is( not)* opened$/,
    checkModal
  );

  this.Then(
    /^I expect that a (alertbox|confirmbox|prompt)( not)* contains the text "([^"]*)?"$/,
    checkModalText
  );

  this.Then(
    /^I expect to be on the "([^"]*)?" page$/,
    checkPage
  );

  this.Then(
    /^I expect a bid$/,
    checkBidResponse
  );

  this.Then(
    /^I expect "([^"]+)" to be( \d+)?(?: (equal to|more than|less than)) "([^"]+)"$/,
    compareStoredVariables.compareNumbers
  );

  this.Then(
    /^I expect the string values "([^"]+)" and "([^"]+)" to be equal$/,
    compareStoredVariables.compareStrings
  );

  this.Then(
    /^I expect the screenshot to match the reference screenshot "([^"]*)?"$/,
    compareScreenshots.compareEntireScreen
  );
  this.Then(
    /^I expect the screenshot of element "([^"]*)?" to match the reference screenshot "([^"]*)?"$/,
    compareScreenshots.compareElements
  );

  this.Then(
    /^I expect that "([^"]*)?" is sorted (Ascending|Descending)$/,
    checkSortOrder
  );

  this.Then(
    /^I expect "([^"]+)" to be equal to the number of "([^"]+)"$/,
    checkGridCount
  );

  this.Then(
    /^I expect that "([^"]+)" displayed is with comma separated value of "([^"]+)"$/,
    checkNumberComma
  );

  this.Then(
    /^I expect that character count "([^"]+)" of the field is as per the value's "([^"]+)" length$/,
    checkCTACharCount
  );

  this.Then(
    /^I expect the "([^"]+)" to contain the ordered elements "([^"]+)"(?: with delimiter "([^"]+)")?$/,
    checkListOrder
  );

  this.Then(
    /^I expect that the csv file named (with stored variable )?"([^"]+)" was downloaded$/,
    checkFileDownloaded
  );

};
