Feature: ODC-858 Verify the campaign or creative is not existing in when the Account is switched


  Background: Login into the site
    Given I am on the "dashboard" page

  Scenario Outline:
  ##Create New Account
    When I select default account
    And I click on "Account Management"
    And I create New Account with user defined values "<Parent Account Name>", "<Account Name>", "<Valid EmailId>", "<Domain>", "Imagepic", "<DSP Login>" and "<DSP Password>"

  ##Create Campaign
    And I click on "Campaign Management"
    And I click on "New Campaign"
    And I set "<Valid Campaign Name>" to the inputfield appended with current Date_Time "Campaign Name"
    And I store the value from inputfield "Campaign Name" as "New Campaign Name"
    And I click on "Save"
    And I pause for 400ms for the grid to display campaign created

  ##Create New Creative Group
    And I click on "Campaign Name Link"
    And I click on "Canvas Toggle Button"

  ##Create New Creative
    And I click on "Create Creative Icon"
    And I mousehover on element "Creative_more_Icon"
    And I mousehover on element "Creative__controlsCover"
    And I click on "Creative__editIcon"
    And I set "<Creative Name>" to the inputfield appended with current Date_Time "Name Field"
    And I store the value from inputfield "Name Field" as "New Creative Name"
    And I click on "Video Type"
    And I click on "Video Type VAST_URL"
    And I set "<VAST_URL>" to "Vast URL"
    And I click on "Save"

    And I click on "Create Creative Group Icon"
    And I pause for 1500ms for the grid to display Creative Group success message
    And I click on "Back Button in Canvas"

  ## Create New child account
    And I click on "Account Management"
    And I create New Account with user defined values "<Parent Account Name>", "<Account Name2>", "<Valid EmailId>", "<Domain>", "Imagepic", "<DSP Login>" and "<DSP Password>"

  ## Search for the newly created account
    And I click on "Public groups"
    And I click on "Search"
    And I set stored value "New Account Name" to inputfield "Search Account"
    And I click on stored value "New Account Name" in the "Matched Account" drop down

  ## Navigate to Campaign Tab to see No newly created campaign
    And I click on "Campaign Management"
    Then I expect that element "No Rows Found" does exist

  ## Navigate to Creative Tab to see No newly created campaign
    When I click on "Creative Tab"
    Then I expect that element "No Rows Found" does exist

  ## Navigate to CreativeGroups Tab to see No newly created campaign
    When I click on "Creative Groups Tab"
    Then I expect that element "No Rows Found" does exist


    Examples:

      | Valid EmailId     | Domain          | Account Name       | Parent Account Name | Account Name|DSP Login|DSP Password    |Valid Campaign Name|Creative Name |Account Name2 |VAST_URL                                               |
      | qa@viralgains.com | https://ebay.in | AC to Edit         | QA_ViralGains       | ViralGains  | gdpr    |GDPR123         |QA_Camp            |QA_Creat      |QA_ViralGains2|https://rtr.innovid.com/r1.5b06dff09f4739.45624862;cb= |




