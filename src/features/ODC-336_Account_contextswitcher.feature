Feature: ODC-336 Account Context switcher all possible Search Account scenarios

  Background: Login into the site
    Given I am on the "dashboard" page

# NOTE: MOST of the SCRIPTS are DATA Dependant

# Search for an Account (dig for the account in the Parent or Child hierarchy) and Select the matched Account successfully
  Scenario Outline:
    And I click on "Search"
    And I set "<SearchForAccount>" to "Search Account"
    And I click on "<SearchForAccount>" in the "Matched Account" drop down
    When I click on "Account Management"
    And I expect to be on the "ODCAccountManagement" page


    Examples:
      |SearchForAccount |
      |QA_ViralGains    |


# Provide Partial Search string and Search for exact child Account after clicking on the chevron (left arrow Icon )
  Scenario Outline:
    And I click on "Search"
    And I set "<PartialSearchAccountString>" to "Search Account"
#    And I click on "Search Arrow Icon"
#    And I click on the searched account element "Matched Child Account" matched with criteria "<SearchForAccount>"
#    When I click on "Account Management"
#    And I expect to be on the "ODCAccountManagement" page

    Examples:
      |PartialSearchAccountString |SearchForAccount          |
      |1322                       |Harini_Edit+1322@undefined|


 # Select First Account in the Public Groups Tab
  Scenario:
    And I click on "Public account"
    When I click on "Account Management"
    And I expect to be on the "ODCAccountManagement" page


# Search for a Not Existing Account (dig for the account in the Parent or Child hierarchy) and verify the account is not existing
  Scenario Outline:
    And I click on "Search"
    And I set "<SearchForAccount>" to "Search Account"
    And I pause for 800ms
    Then I expect that element "No Results Found" does exist


    Examples:
      |SearchForAccount |
      |Edit_Not_Existing|


# Validate the expand and collapse of the Search Icon (Left arrow Icon turns to Down arrow and viceversa )
  Scenario Outline:
    And I click on "Search"
    And I set "<PartialSearchAccountString>" to "Search Account"
#    Then I expect that element "Search Arrow Icon" does exist
#    And I click on "Search Arrow Icon"
#    Then I expect that element "Search Down Arrow" does exist
#    And I click on "Search Down Arrow"
#    Then I expect that element "Search Arrow Icon" does exist


    Examples:
      |PartialSearchAccountString |
      |Edit                       |


# Click on the SEARCH Icon should give all valid Account the user has access to
  Scenario Outline:
    And I click on "Search"
    And I pause for 800ms
    Then I expect that element "Account Search List Items" does exist



    Examples:
      | ValidEmailId        |ValidPassword|
      | qa@viralgains.com   |mypassword|


