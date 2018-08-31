Feature: ODC-30 Create and Edit Group Validation
#
## Groups
#
# Create Group E2E -without User added then Disable by clicking on Disable button and Delete through Delete button
  Scenario Outline:

    Given I log into the site "ODC" as an admin
    And I select default account
    And I click on "Account Management"
    When I create a new group named "<GroupName>" under account "<GroupAccountName>" with email "" and Campaign Read and Write permissions

#   Verify the user count in the Group list
    Then I expect that element "New Group Name" does exist
    When I click on "Select Checkbox"
    Then I expect that element "Existing Test Account" does exist
    And I click on "Disable Button"
    And I expect that element "Status in row #1" contains the text "DISABLED"
    When I click on "Select Checkbox"
    And I click on "Delete Button"
    Then I expect that element "Delete Confirmation Popup" does exist
    Then I expect that element "Delete Button in Delete Confirmation Pop-Up" does exist
    And I expect that element "Cancel Button in Delete Confirmation Pop-Up" does exist
    And I expect that element "Delete Confirmation Message" contains the text "Are you sure you want to delete all selected groups (1)?"
    And I click on "Delete Button in Delete Confirmation Pop-Up"

    Examples:
      | GroupAccountName  | GroupName  |
      | QA_ViralGains        | GroupTest  |

## Create Group with one User added - E2E then Disable it by clicking on Disable button and then Delete the created account through Delete button
#
#  Scenario Outline:
#
#    Given I log into the site "ODC" as an admin
#    And I select default account
#    And I expect to be on the "ODCDashboard" page
#    When I click on "Account Management"
#    And I expect to be on the "ODCAccountManagement" page
#
#
#    And I wait for all "Loading Messages" to become not visible
#    When I click on "Groups Tab"
#
#    And I click on "New Group Button"
#    Then I expect that element "Modal Window" does exist
#    And I click on "Account Name dropdown"
#
#    And I set "<GroupAccountName>" to "Group Account Name"
#
#    And I click on the searched account element "Account Name Dropdown" matched with criteria "<GroupAccountName>"
#
#    And I set "<GroupName>" to "Group Name"
#    And I click on "Group Status dropdown"
#
#    And I click on "Status Menu-Enable"
#
#    And I click on "Campaign Management: Write Select Checkbox"
#
#    And I click on "Campaign Management: Read Select Checkbox"
#
#    And I click on "Account Management: Write Select Checkbox"
#
#    And I click on "Account Management: Read Select Checkbox"
#
#    And I click on "Reporting: Write Select Checkbox"
#
#    And I click on "Reporting: Read Select Checkbox"
#
#    And I click on "Reporting: Inventory Read Select Checkbox"
#   And I click on "User Group"
#    And I set "<UserGroup>" to "User Group InputField"
#    And I click on "<UserGroup>" in the "User Group Value1" drop down
#    And I click on "Add"
#
#
#    Then I expect that element "Group Email1" does exist
#
#    When I click on "User Group Select Checkbox1"
#
#    And I expect that element "Groups User1 Status" contains the text "INVITED"
#
#    And I click on "Save"
#
##   Verify the user count in the Group list
#    Then I expect that element "New Group Name" does exist
#
#    And I wait for "Account Management and Campaign Popup" to become not visible
#    When I click on "Select Checkbox"
#
#    And I click on "Disable Button"
#
#    And I expect that element "Groups List" contains the text "DISABLED"
#
#
#    When I click on "Select Checkbox"
#
#    And I click on "Delete Button"
##    Then I expect that element "Existing Group" does not exist
#
##
#    Examples:
#      | GroupAccountName  | UserGroup            | GroupName  |
#      | QA_ViralGains        | schen@viralgains.com | SohiniTest |
#
#
## Create Group with three User Status ( Invited, Enable and Declined) added with read permission - E2E then Disable it by clicking on Disable button and then Delete the created account through Delete button
#
#  Scenario Outline:
#
#    Given I log into the site "ODC" as an admin
#    And I select default account
#    And I expect to be on the "ODCDashboard" page
#    When I click on "Account Management"
#    And I expect to be on the "ODCAccountManagement" page
#
#
#    And I wait for all "Loading Messages" to become not visible
#    When I click on "Groups Tab"
#
#    And I click on "New Group Button"
#    Then I expect that element "Modal Window" does exist
#    And I click on "Account Name dropdown"
#
#    And I set "<GroupAccountName>" to "Group Account Name"
#
#    And I click on the searched account element "Account Name Dropdown" matched with criteria "<GroupAccountName>"
#
#    And I set "<GroupName>" to "Group Name"
#    And I click on "Group Status dropdown"
#
#    And I click on "Status Menu-Enable"
#
#    And I click on "Campaign Management: Read Select Checkbox"
#
#    And I click on "Account Management: Read Select Checkbox"
#
#    And I click on "Reporting: Read Select Checkbox"
#
#    And I click on "Reporting: Inventory Read Select Checkbox"
#
#    And I click on "User Group"
#    And I set "<UserGroup1>" to "User Group InputField"
#    And I click on "<UserGroup1>" in the "User Group Value1" drop down
#    And I click on "Add"
#
#    And I click on "User Group"
#    And I set "<UserGroup2>" to "User Group InputField"
#    And I click on "<SearchForUserGroup2>" in the "User Group Value1" drop down
#    And I click on "Add"
#
#    And I click on "User Group"
#    And I set "<UserGroup3>" to "User Group InputField"
#    And I click on "<SearchForUserGroup3>" in the "User Group Value1" drop down
#    And I click on "Add"
#
#    Then I expect that element "Group Email1" does exist
#
#    When I click on "User Group Select Checkbox1"
#
#    And I expect that element "Groups User1 Status" contains the text "INVITED"
#
#    Then I expect that element "Group Email2" does exist
#
#    When I click on "User Group Select Checkbox2"
#
#    And I expect that element "Groups User2 Status" contains the text "ENABLED"
#
#    Then I expect that element "Group Email3" does exist
#
#    When I click on "User Group Select Checkbox3"
#
#    And I expect that element "Groups User3 Status" contains the text "DECLINED"
#
#    And I click on "Save"
#
#    Then I expect that element "New Group Name" does exist
#
#    When I click on "Select Checkbox"
#
#    And I click on "Disable Button"
#
#    And I expect that element "Groups List" contains the text "DISABLED"
#
#
#    When I click on "Select Checkbox"
#
#    And I click on "Delete Button"
##    Then I expect that element "Existing Group" does not exist
#
#
#    Examples:
#      | GroupAccountName  | UserGroup1                | UserGroup2| GroupName          | SearchForUserGroup2           | UserGroup3          | SearchForUserGroup3        |
#      | QA_ViralGains        | schen@viralgains.com      | kmahajan  | SohiniTest         |  kmahajan+765@viralgains.com  | hkodey              | hkodey+1455@viralgains.com |
#
#
## Create Group with Disabled Status - E2E then Enabling it by clicking on Enable Grid Icon and then Delete the created account through Grid Delete Icon
#
#  Scenario Outline:
#
#    Given I log into the site "ODC" as an admin
#    And I select default account
#    And I expect to be on the "ODCDashboard" page
#    When I click on "Account Management"
#    And I expect to be on the "ODCAccountManagement" page
#
#
#    And I wait for all "Loading Messages" to become not visible
#    When I click on "Groups Tab"
#
#    And I click on "New Group Button"
#    Then I expect that element "Modal Window" does exist
#    And I click on "Account Name dropdown"
#
#    And I set "<GroupAccountName>" to "Group Account Name"
#
#    And I click on the searched account element "Account Name Dropdown" matched with criteria "<GroupAccountName>"
#
#    And I set "<GroupName>" to "Group Name"
#    And I click on "Group Status dropdown"
#
#    And I click on "Status Menu-Disable"
#
#    And I click on "Campaign Management: Write Select Checkbox"
#
#    And I click on "Campaign Management: Read Select Checkbox"
#
#    And I click on "Account Management: Write Select Checkbox"
#
#    And I click on "Account Management: Read Select Checkbox"
#
#    And I click on "Reporting: Write Select Checkbox"
#
#    And I click on "Reporting: Read Select Checkbox"
#
#    And I click on "Reporting: Inventory Read Select Checkbox"
#
#    And I click on "User Group"
#    And I set "<UserGroup1>" to "User Group InputField"
#    And I click on "<UserGroup1>" in the "User Group Value1" drop down
#    And I click on "Add"
#
#    And I click on "User Group"
#    And I set "<UserGroup2>" to "User Group InputField"
#    And I click on "<SearchForUserGroup2>" in the "User Group Value1" drop down
#    And I click on "Add"
#
#    And I click on "User Group"
#    And I set "<UserGroup3>" to "User Group InputField"
#    And I click on "<SearchForUserGroup3>" in the "User Group Value1" drop down
#    And I click on "Add"
#
#    Then I expect that element "Group Email1" does exist
#
#    When I click on "User Group Select Checkbox1"
#
#    And I expect that element "Groups User1 Status" contains the text "INVITED"
#
#    Then I expect that element "Group Email2" does exist
#
#    When I click on "User Group Select Checkbox2"
#
#    And I expect that element "Groups User2 Status" contains the text "ENABLED"
#
#    Then I expect that element "Group Email3" does exist
#
#    When I click on "User Group Select Checkbox3"
#
#    And I expect that element "Groups User3 Status" contains the text "DECLINED"
#
#    And I click on "Save"
#
#    Then I expect that element "New Group Name" does exist
#
#    When I click on "Select Checkbox"
#
#    And I expect that element "Groups List" contains the text "DISABLED"
#
#    When I click on "Select Checkbox"
#
#    And I click on "Grid Enable Icon"
#
#    And I expect that element "Groups List" contains the text "ENABLED"
#
#
#    When I click on "Select Checkbox"
#
#    And I click on "Grid Delete Icon"
##    Then I expect that element "Existing Group" does not exist
#
#
#
#    Examples:
#      | GroupAccountName  | UserGroup1           | UserGroup2  | GroupName  | SearchForUserGroup2           | UserGroup3  | SearchForUserGroup3        |
#      | QA_ViralGains        | schen@viralgains.com | kmahajan    | SohiniTest |  kmahajan+765@viralgains.com  | hkodey      | hkodey+1455@viralgains.com |
#
#
#
## Create Group then Edit Group - E2E then Disable it by clicking on Disable Grid Icon and then Delete the created account through Grid Delete Icon
#
#  Scenario Outline:
#
#    Given I log into the site "ODC" as an admin
#    And I select default account
#    And I expect to be on the "ODCDashboard" page
#    When I click on "Account Management"
#    And I expect to be on the "ODCAccountManagement" page
#
#
#    And I wait for all "Loading Messages" to become not visible
#    When I click on "Groups Tab"
#
#    And I click on "New Group Button"
#    Then I expect that element "Modal Window" does exist
#    And I click on "Account Name dropdown"
#
#    And I set "<GroupAccountName>" to "Group Account Name"
#
#    And I click on the searched account element "Account Name Dropdown" matched with criteria "<GroupAccountName>"
#
#    And I set "<GroupName>" to "Group Name"
#    And I click on "Group Status dropdown"
#
#    And I click on "Status Menu-Enable"
#
#    And I click on "Campaign Management: Write Select Checkbox"
#
#    And I click on "Campaign Management: Read Select Checkbox"
#
#    And I click on "Account Management: Write Select Checkbox"
#
#    And I click on "Account Management: Read Select Checkbox"
#
#    And I click on "Reporting: Write Select Checkbox"
#
#    And I click on "Reporting: Read Select Checkbox"
#
#    And I click on "Reporting: Inventory Read Select Checkbox"
#
#    And I click on "User Group"
#    And I set "<UserGroup1>" to "User Group InputField"
#    And I click on "<UserGroup1>" in the "User Group Value1" drop down
#    And I click on "Add"
#
#    And I click on "User Group"
#    And I set "<UserGroup2>" to "User Group InputField"
#    And I click on "<SearchForUserGroup2>" in the "User Group Value1" drop down
#    And I click on "Add"
#
#    And I click on "User Group"
#    And I set "<UserGroup3>" to "User Group InputField"
#    And I click on "<SearchForUserGroup3>" in the "User Group Value1" drop down
#    And I click on "Add"
#
#    Then I expect that element "Group Email1" does exist
#
#    When I click on "User Group Select Checkbox1"
#
#    And I expect that element "Groups User1 Status" contains the text "INVITED"
#
#    Then I expect that element "Group Email2" does exist
#
#    When I click on "User Group Select Checkbox2"
#
#    And I expect that element "Groups User2 Status" contains the text "ENABLED"
#
#    Then I expect that element "Group Email3" does exist
#
#    When I click on "User Group Select Checkbox3"
#
#    And I expect that element "Groups User3 Status" contains the text "DECLINED"
#
#    And I click on "Save"
#
#    Then I expect that element "New Group Name" does exist
#
#    When I click on "Select Checkbox"
#
#    And I click on "Grid Edit Icon"
#
#    Then I expect that element "Group Edit Modal Window" does exist
#
#
#    And I clear the inputfield "Group Name"
#
#    When I set "<EditGroupName>" to the inputfield appended with current Date_Time "Group Name"
#
#    And I click on "Selected Group Status dropdown"
#
#    And I click on "Status Menu-Disable"
#
#    And I click on "Account Management: Write Select Checkbox"
#
#    And I click on "Account Management: Read Select Checkbox"
#
#    When I click on "User Group Select Checkbox1"
#
#    And I expect that element "Groups User1 Status" contains the text "DECLINED"
#
#    When I click on "Remove"
#
##    Then I expect that element "Existing Group Email1" does not exist
#
#    And I click on "Save"
#
#    When I click on "Select Checkbox"
#
#    And I click on "Grid Delete Icon"
##    Then I expect that element "Existing Group" does not exist
#
#
#
#    Examples:
#      | GroupAccountName   | UserGroup1           | UserGroup2  | GroupName  | SearchForUserGroup2           | UserGroup3  | SearchForUserGroup3        | EditGroupName|
#      | QA_ViralGains         | schen@viralgains.com | kmahajan    | SohiniTest |  kmahajan+765@viralgains.com  | hkodey      | hkodey+1455@viralgains.com | SohiniTest   |
#
#
