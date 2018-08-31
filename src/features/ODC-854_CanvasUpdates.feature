Feature: ODC-815 and ODC-854 Campaign -> Creative Group -> Creative

  Background: I am on the Canvas page of a new campaign
    Given I have a Campaign named "QA_ViralGainsCampaign" under Account "QA_ViralGains" and I am on the canvas screen

# Verify the Creative Group Node 1 creation and very its default position
  Scenario:
    When I click on "Canvas Toggle Button"
    Then I expect that element "Start Node" is visible
    And I expect that element "Create Creative Group Icon" is visible

    When I click on "Create Creative Group Icon"
    #Testing New Creative Group are placed in default position
    And I expect that element "Creative Group 1" does exist
    Then I expect that the css attribute "transform" of element "Creative Group 1" is "matrix(1, 0, 0, 1, 100, 30)"

    #Testing Creative Group Incremented
    And I expect that element "Creative Group 2" does not exist
    When I click on "Create Creative Group Icon"
    Then I expect that element "Creative Group 2" does exist

   #Connections
    When I move "Creative Group 1" by x offset 300 and y offset 150
    And I move "Start Node" by x offset 300 and y offset 0
  # Then I create an edge from the bottom port of "Creative Group 1" and connect it to the top port of "Creative Group 2" TODO after implementation


  Scenario Outline: Verify the Campaign name is updated for the respective creative and creative group

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

    ##Create New Creative Group
    And I click on "Create Creative Group Icon"

    # And I pause for 1000ms for the grid to display Creative Group success message
    And I click on "Back Button in Canvas"


  ## Navigate to Creative Tab to see newly created campaign

    And I pause for 200ms
    And I click on "Creative Tab"
    And I click on "Select Checkbox"
    Then I expect that element "Campaign Name in Creative Tab" contains the text "QA_ViralGainsCampaign"

   ## Navigate to CreativeGroups Tab to see newly created campaign
    When I click on "Creative Groups Tab"
    And I click on "Select Checkbox"
    Then I expect that element "Campaign Name in CreativeGroups Tab" contains the text "QA_ViralGainsCampaign"


    Examples:

      |Creative Name |VAST_URL                                               |
      |QA_Creat      |https://rtr.innovid.com/r1.5b06dff09f4739.45624862;cb= |


  Scenario Outline: Delete Campaign Deletes the Creative and Creativegroup

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


    ##Create New Creative Group
    And I click on "Create Creative Group Icon"
    And I store the value from element "Creative Group1 Title" as "New Creative group Name"

    #And I pause for 1000ms for the grid to display Creative Group success message

    And I click on "Back Button in Canvas"

    ## Navigate to Creative Tab to see newly created campaign
    And I click on "Creative Tab"
    And I click on "Select Checkbox"
    Then I expect that element "Campaign Name in Creative Tab" contains the text "QA_ViralGainsCampaign"

    ## Navigate to CreativeGroups Tab to see newly created campaign
    When I click on "Creative Groups Tab"
    And I click on "Select Checkbox"
    Then I expect that element "Campaign Name in CreativeGroups Tab" contains the text "QA_ViralGainsCampaign"

    ## Navigate to Campaign Tab to see No newly created campaign
    And I click on "Campaign Management"
    And I click on "Select Checkbox"
    Then I click on "Delete Button"
    And I expect that element "Delete Confirmation Popup" does exist
    And I click on "Delete Button in Delete Confirmation Pop-Up"
    And I expect to be on the "ODCDashboard" page

    ## Navigate to Creative Tab to see creative related to the campaign does not exist
    And I click on "Creative Tab"
    And I click on "Select Checkbox"
    Then I expect that element "Creative Name in Creative list" not contains the text "<Creative Name>"

    ## Navigate to CreativeGroups Tab see creative related to the campaign does not exist
    When I click on "Creative Groups Tab"
    And I pause for 200ms
    And I click on "Select Checkbox"
    Then I expect that element "CreativeGroup Name in Creative Groups list" not contains the stored value "New Creative group Name"


    Examples:

      |Creative Name |VAST_URL                                               |
      |QA_Creat      |https://rtr.innovid.com/r1.5b06dff09f4739.45624862;cb= |


    ####API Tests
  Scenario Outline: Testing Tree structure of Creative Group, Creative
    And that Campaign has a Creative Group Node named "<First Creative Group Name>"
    And that Campaign has a Creative Node named "<First Creative Name>" under creative group "Newest Creative Group ID"
    And that Campaign has a Creative Group Node named "<Second Creative Group Name>"
    And that Campaign has a Creative Node named "<Second Creative Name>" under creative group "Newest Creative Group ID"
    And I am on the "panel" page of the newest campaign using the account "QA_ViralGains"
    Then I expect the "Campaign Panel Creative and Creative Group Names" to contain the ordered elements "<First Creative Group Name>, <First Creative Name>, <Second Creative Group Name>, <Second Creative Name>"

    Examples:
      | First Creative Name| Second Creative Name| First Creative Group Name|Second Creative Group Name|
      | Creative 1         |Creative 2           | Creative Group 1         | Creative Group 2         |


  Scenario Outline: Testing creative patch
    And that Campaign has a Creative Group Node named "<First Creative Group Name>"
    And that Campaign has a Creative Group Node named "<Second Creative Group Name>"
    And that Campaign has a Creative Node named "<First Creative Name>"
    And The creative "<First Creative Name>" is added to creative group "<First Creative Group Name>"
    And I am on the "panel" page of the newest campaign using the account "QA_ViralGains"
    Then I expect the "Campaign Panel Creative and Creative Group Names" to contain the ordered elements "<First Creative Group Name>, <First Creative Name>, <Second Creative Group Name>"

    Examples:
      | First Creative Name| First Creative Group Name| Second Creative Group Name|
      | Creative 1         | Creative Group 1         | Creative Group 2          |


