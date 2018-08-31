Feature: ODC-815

  Background:
    Given I have a Campaign named "AutoCampaignName" under Account "QA_ViralGains"


  Scenario: Clicking on a campaign opens the control panel
    And I am on the "campaigns" tab of the "campaigns" page using the account "QA_ViralGains"
    When I click on "Campaign Name Link"
    Then I expect to be on the "Control Panel" page

  Scenario: Clicking on the Canvas button should navigate to the campaign canvas screen
    Given I am on the "panel" page of the newest campaign using the account "QA_ViralGains"
    And I click on the "Canvas Button"
    Then I expect to be on the "Campaign Canvas" page


  Scenario:
    Given I am on the "panel" page of the newest campaign using the account "QA_ViralGains"
    And I click on the "Campaign Panel Dropdown"
    And I click on "+ Create a Creative Group" in the drop down
    And I click on the "Campaign Panel Dropdown"
    And I click on "+ Create a Creative" in the drop down


  Scenario Outline: Testing Creative Group and Creative Order, and Overview
    And that Campaign has a Creative Node named "<First Creative Name>"
    And that Campaign has a Creative Node named "<Second Creative Name>"
    And that Campaign has a Creative Group Node named "<First Creative Group Name>"
    And that Campaign has a Creative Group Node named "<Second Creative Group Name>"
    And I am on the "panel" page of the newest campaign using the account "QA_ViralGains"

    Then I expect the "Campaign Panel Creative and Creative Group Names" to contain the ordered elements "<First Creative Group Name>, <Second Creative Group Name>, <Second Creative Name>, <First Creative Name>"
    And I expect that element "Campaign Overview Campaign Name" contains the text "Campaign: <Campaign Name>"
    And I expect that element "Campaign Overview Status" contains the text "Status: STAGED"
    And I expect that element "Campaign Overview # of Creative Groups" contains the text "# of Creative Groups: 2"
    And I expect that element "Campaign Overview # of Creatives" contains the text "# of Creatives: 2"

    When The "Creative Group" named "<First Creative Group Name>" is deleted
    And  The "Creative" named "<First Creative Name>" is deleted
    And I pause for 2000ms for the database to update
    And I refresh the screen and accept the alert

    Then I expect the "Campaign Panel Creative and Creative Group Names" to contain the ordered elements "<Second Creative Group Name>, <Second Creative Name>"
    And I expect that element "Campaign Overview Campaign Name" contains the text "Campaign: <Campaign Name>"
    And I expect that element "Campaign Overview Status" contains the text "Status: STAGED"
    And I expect that element "Campaign Overview # of Creative Groups" contains the text "# of Creative Groups: 1"
    And I expect that element "Campaign Overview # of Creatives" contains the text "# of Creatives: 1"

    Examples:
      | Campaign Name    | First Creative Name | Second Creative Name | First Creative Group Name | Second Creative Group Name |
      | AutoCampaignName | Creative 1          | Creative 2           | Creative Group 1          | Creative Group 2           |
