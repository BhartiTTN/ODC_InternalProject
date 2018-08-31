Feature: DEMO scripts


# CLEAN-UP SCRIPT : Multiple (3) Rows/Users Delete Cancel action and validate the selected Rows still exist
#  Scenario:
#
#    Given I log into the site "ODC" as an admin
#    And I select default account
#    And I expect to be on the "ODCDashboard" page
#    When I click on "Account Management"
#    When I click on "Users Tab"
#    And I pause for 800ms
#    When I click on "Select Checkbox"
#    When I click on "2nd Select Checkbox"
#    When I click on "3rd Select Checkbox"
#    And I store the number of "Selected Rows" as "initial number of selected rows"
#    And I pause for Demo
#    Then I click on "Delete Button"
#    And I pause for Demo
#    Then I expect that element "Delete Confirmation Popup" does exist
#    And I pause for Demo
#    Then I expect that element "Delete Button in Delete Confirmation Pop-Up" does exist
#    And I expect that element "Cancel Button in Delete Confirmation Pop-Up" does exist
#    And I pause for Demo
#    And I expect that element "Delete Confirmation Message" contains the text "Are you sure you want to delete all selected users (3)?"
#    And I pause for Demo
#    And I store the count from the field "Delete Confirmation Message" as "delete confirmation count"
#    And I expect "initial number of selected rows" to be equal to "delete confirmation count"
#    And I click on "Delete Button in Delete Confirmation Pop-Up"
#    And I pause for Demo
#    And I expect to be on the "ODCDashboard" page
#    And I pause for Demo


## Search with Specific Matched Criteria in Groups Tab
#  Scenario Outline:
#
#    Given I log into the site "ODC" as an admin
#    And I select default account
#    And I expect to be on the "ODCDashboard" page
#    When I click on "Account Management"
#    And I expect to be on the "ODCAccountManagement" page
#    And I pause for Demo
#    And I pause for Demo
#    And I wait for all "Loading Messages" to become not visible
#    When I click on "Groups Tab"
#    And I pause for Demo
#    And I click on "New Group Button"
#    And I click on "Parent dropdown"
#    And I pause for Demo
#    And I pause for Demo
#    And I set "<Parent Account Name>" to "Group Account Name"
#    And I pause for Demo
#    And I click on "Parent Menu"
#    And I click on "User Group"
#    And I set "<User Group>" to "User Group InputField"
#    And I click on the searched account element "Group Name" matched with criteria "<User Group>"
#    And I click on "Add"
#    Examples:
#      |Parent Account Name | User Group            |
#      |ViralGains          | schen@viralgains.com  |

# ##TODO WORKING SCRIPT
#  Scenario Outline:
#
#    Given I log into the site "ODC" as an admin
#    And I select default account
#    When I click on "Campaign Management"
#
#    When I create a campaign "<Valid Campaign Name>" and click on the campaign link to navigate to Creative Page
#
#    Then I expect that element "Creative Graph" does exist
#
#    When I click on "Create Creative Icon"
#    And I pause for 800ms
#    And I set the "transform" attribute of the "Creative 1" to "translate(230,230)"
#    When I mousehover on element "Creative_more_Icon"
#    Then I expect that element "Creative__editIcon" does exist
#    When I mousehover on element "Creative__controlsCover"
#    When I click on "Creative__editIcon"
#    Then I expect that element "Modal Window" does exist
#    When I set "<Creative Name>" to the inputfield appended with current Date_Time "Name Field"
#    And I store the value from inputfield "Name Field" as "New Creative Name"
#    And I click on "Video Type"
#    And I click on "Video Type YT_URL"
#    And I set "<Video URL>" to "Video URL"
#    And I click on "CTA Section Checkbox"
#    Then I expect that element "CTA Header Color Icon" does exist
#    And I expect that the css attribute "background" of element "CTA Header Color Icon" is "rgb(246,230,82)nonerepeatscroll0%0%/autopadding-boxborder-box"
#   # And I expect that the css attribute "color" of element "CTA Header Color Icon" is "white"
#    And I click on "CTA Header Color Icon"
#    Then I expect that element "Sketch_Picker" does exist
#    And I expect that the css attribute "width" of element "Sketch_Picker" is "200px"
#    And I expect that the css attribute "height" of element "Sketch_Picker" is "305.57px"
#
#  Examples:
#  |Valid Campaign Name  |Creative Name      |Video URL|
#  |Ha_CampaignName123   |Ha_MultipleCreative|ebay.com |

#
## ODC-569 - HAVE to add in account
#
#  # Verify to create a Account with the same name of a previously deleted Account
#  Scenario Outline:
#    Given I log into the site "ODC" as an admin
#    And I select default account
#    When I click on "Account Management"
#    And I click on "Groups Tab"
#
#  ##New Group with Permissions Set up
#    And I create New Group with Campaign Write Permissions and user defined values "New Account Name", "<Group Name>" and "New User Email"
#    And I wait for all "Loading Messages" to become not visible
#    And I pause for 800ms for the database to update
#
#   ##Cleanup steps in Accounts GRID
#    And I click on "Groups Tab"
#    And I click on "Select Checkbox"
#    And I click on "Delete Button"
#    And I click on "Delete Button in Delete Confirmation Pop-Up"
#
#   # Create another campaign with the previously deleted Campaign Name
#    And I click on "Account Management"
#    And I click on "Groups Tab"
#    And I click on "New Group Button"
#    And I set stored value "New Account Name" to inputfield "Group Account Name"
#    And I click on "Industry Value"
#    And I set stored value "New Group Name" to "Group Name"
#    And I click on "Group Status dropdown"
#    And I click on "Status Menu-Enable"
#    And I click on "Campaign Management: Write Select Checkbox"
#    And I click on "Campaign Management: Read Select Checkbox"
#    And I set stored value "New User Email" to inputfield "User Group InputField"
#    And I click on stored value "New User Email" in the "Group Name Dropdown" drop down
#    And I click on "Add"
#    And I click on "Create Button"
#    And I wait for all "Loading Messages" to become not visible
#
#   ##Cleanup steps in Accounts GRID
#    And I click on "Account Tab"
#    And I click on "Select Checkbox"
#    And I click on "Delete Button"
#    And I click on "Delete Button in Delete Confirmation Pop-Up"
#
#    Examples:
#
#                |Group Name                      |
#                |No Campaign RW Permission Group |
#
#
