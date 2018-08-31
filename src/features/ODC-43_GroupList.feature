Feature: ODC-43 Group List Validation


  Background: Log in and open Account Management page
    Given I am on the "groups" tab of the "account management" page using the account "QA_ViralGains"
# Groups

 #  Verify GroupList (Table) Column headers
  Scenario:
    Then I expect that table element "List Element" contains element with text "Status"
    And I expect that table element "List Element" contains element with text "Account Name"
    And I expect that table element "List Element" contains element with text "Group Name"
    And I expect that table element "List Element" contains element with text "Reporting"
    And I expect that table element "List Element" contains element with text "Campaign Management"
    And I expect that table element "List Element" contains element with text "Account Management"
    And I expect that table element "List Element" contains element with text "# of Users"

#   Assign new User to new Group, test that User is now a member of said group.
#   Verify Delete, Cancel and Disable action by clicking the below buttons


  Scenario Outline:
    Given I have a user named "<User Name>" with email "<User Email Id>" and password "<password>" under account "<Account Name>"
    And I have a Group named "<Group Name>" under Account "<Account Name>" with stored user emails "New User Email" and permissions "CAMPAIGN_WRITE, CAMPAIGN_READ"

    #Test User is now a member of this group
    And I click on "Users Tab"

    And I edit the User named with stored variable "New User Email" that is paired with the Account named "<Account Name>"
    Then I expect that element "Group Name in row #1" contains the text "<Group Name>"
    And I click on "Close"
    And I click on "Groups Tab"

    #Testing cancel disable delete buttons at bottom of screen
    When I click on "Select Checkbox"
    And I click on "Cancel Button"
    When I click on "Select Checkbox"
    And I click on "Disable Button"
    And I expect that element "Status in row #1" contains the text "DISABLED"
    When I click on "Select Checkbox"
    And I click on "Delete Button"
    And I click on "Delete Button in Delete Confirmation Pop-Up"
    Then I expect that element "Group Name in row #1" not contains the text "<Group Name>"

    Examples:
      | Account Name  | Group Name     | User Name   | User Email Id                 | password   |
      | QA_ViralGains | New Auto Grp   | newish User | viralgainstestemail@gmail.com | mypassword |


##  Click feature and Verify Delete, Cancel and Disable action by clicking grid icons. Verify multi delete
  Scenario Outline:
    And I store the value from element "Group Name in row #1" as "Previous Top Row Group Name"
    And I create a new group named "<GroupName>" under account "<Account Name>" with email "" and Campaign Read permissions
    And I create a new group named "<GroupName>" under account "<Account Name>" with email "" and Campaign Read permissions
    And I create a new group named "<GroupName>" under account "<Account Name>" with email "" and Campaign Read permissions

    #Testing grid icons
    When I click on "Checkbox in row #1"
    And I click on "Edit Button in row #1"
    Then I expect that element "Account Management and Campaign Popup" does exist
    When I click on "Close"
    And I click on "Cancel Button"
    And I click on "Checkbox in row #1"
    And I click on "Disable Button in row #1"
    Then I expect that element "Status in row #1" contains the text "DISABLED"
    When I click on "Enable Button in row #1"
    Then I expect that element "Status in row #1" contains the text "ENABLED"

    #Delete 3 created Groups
    When I delete the Group named "<GroupName>" that is paired with the Account named "<Account Name>"
    And I delete the Group named "<GroupName>" that is paired with the Account named "<Account Name>"
    And I delete the Group named "<GroupName>" that is paired with the Account named "<Account Name>"

    Then I expect that element "Group Name in row #1" contains the stored value "Previous Top Row Group Name"
#
    Examples:
      | Account Name  | GroupName |
      | QA_ViralGains | tsst1     |

