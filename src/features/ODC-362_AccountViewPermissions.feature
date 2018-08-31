Feature: ODC-362 Allow Only Enabled Membership users to view associated account information


  ##Adding user
  #Log into site, go to account management
  #Create new User
  #Accept Account invite
  ##Attempt to log in as user
  #Edit User, assign user to group

  ##
  #Log in as new user

  #Testing account with no permissions
  Scenario Outline:
    #Creating Account
    Given I have a Group named "no permissions" under Account "<Account Name>" with user emails "" and permissions ""
    Given I am logged in to the email account "<NoPermissions Email Id>"
    And I log into the site "ODC" as an admin
    And I select default account
    When I click on "Account Management"
    When I click on "Users Tab"
    And I create a new user named "<User Name>" with email "<NoPermissions Email Id>" under account "<Account Name>"

    Then I receive an email to join "<Account Name>" account
    And I click on the email link
    And I accept New User Invite and provide user defined values "<First Name>", "<Last Name>", "<Job Title>" and "<password>"
    When I pause for 2000ms for the database to update

    #Testing account with no permissions
    Given I log into the site "ODC" as an admin
    And I select default account
    When I click on "Account Management"
    When I click on "Users Tab"

    When I edit the User named with stored variable "New User Email" that is paired with the Account named "<Account Name>"

    And I set "no permissions" to "User Group InputField"
    And I click on "no permissions" in the "User Group Value1" drop down
    And I click on "Add"
    And I click on "Save"
    When I pause for 2000ms for the database to update

    When I open the url "/"
    And I set stored value "New User Email" to inputfield "Email"
    And I set "<password>" to "Password"
    And I click on "Login"

    And I select default account
    And I click on "Account Management"
    #I expect Accounts table to be empty
    Then I expect that element "#ALL Rows" does not exist
    #^I expect Groups table to be empty
    When I click on "Groups Tab"
    Then I expect that element "#ALL Rows" does not exist
    #^I expect Groups table to be empty
    When I click on "Users Tab"
    Then I expect that element "#ALL Rows" does not exist
    #^I expect Groups table to be empty

    Examples:
      | Account Name  | NoPermissions Email Id                | password   | User Name   | First Name | Last Name |
      | QA_ViralGains | ViralGainsTestNoPermissions@gmail.com | mypassword | QA_USerTEst | Test_First | Test_Last |

  Scenario Outline: Testing Account with Read Permissions
          #Creating Account
    Given I have a Group named "read permissions" under Account "<Account Name>" with user emails "" and permissions "REPORT_READ,CAMPAIGN_READ,ACCOUNT_READ"
    Given I am logged in to the email account "<Read Permissions Email Id>"
    And I log into the site "ODC" as an admin
    And I select default account
    When I click on "Account Management"
    When I click on "Users Tab"
    When I create a new user named "<User Name>" with email "<Read Permissions Email Id>" under account "<Account Name>"

    Then I receive an email to join "<Account Name>" account
    And I click on the email link
    And I accept New User Invite and provide user defined values "<First Name>", "<Last Name>", "<Job Title>" and "<password>"
    When I pause for 2000ms for the database to update

    # Testing account with Read permissions
    Given I log into the site "ODC" as an admin
    And I select default account
    When I click on "Account Management"
    When I click on "Users Tab"
    When I edit the User named with stored variable "New User Email" that is paired with the Account named "<Account Name>"

    And I add "read permissions" to "User Group InputField"
    And I click on "read permissions" in the "User Group Value1" drop down
    And I click on "Add"
    And I click on "Save"
    When I pause for 2000ms for the database to update
      #When I log into the site "ODC" with userName "<Read Permissions Email Id>" and password "<password>"
    When I open the url "/"
    And I set stored value "New User Email" to inputfield "Email"
    And I set "<password>" to "Password"
    And I click on "Login"

    And I select default account
    And I click on "Account Management"
    Then I expect that element "#ALL Rows" does exist
    When I click on "Groups Tab"
    Then I expect that element "#ALL Rows" does exist
    When I click on "Users Tab"
    Then I expect that element "#ALL Rows" does exist

    Examples:
      | Account Name  | Read Permissions Email Id              | password   | User Name   | First Name | Last Name |
      | QA_ViralGains | viralgainstestreadpermission@gmail.com | mypassword | QA_USerTest | Test_First | Test_Last |


  Scenario Outline: ODC-845. Testing Toggling of Read Permissions
    Given I am logged in to the email account "<Read Permissions Email Id>"
    And I have a user named "<User Name>" with email "<Read Permissions Email Id>" and password "<password>" under account "<Account Name>"
    And I have a Group named "read permissions" under Account "<Account Name>" with stored user emails "New User Email" and permissions "REPORT_READ,CAMPAIGN_READ,ACCOUNT_READ"

    # Testing initial read permissions work
    When I open the url "/"
    And I set stored value "New User Email" to inputfield "Email"
    And I set "<password>" to "Password"
    And I click on "Login"

    And I select default account
    And I click on "Account Management"
    Then I expect that element "#ALL Rows" does exist
    When I click on "Groups Tab"
    Then I expect that element "#ALL Rows" does exist
    When I click on "Users Tab"
    Then I expect that element "#ALL Rows" does exist

      #delete Group through API. User should no longer have view permissions
    Given The "Group" named "read permissions" is deleted
    And I pause for 5000ms for the group to be deleted from the database

    When  I click on "Account Tab"
    Then I expect that element "#ALL Rows" does not exist
    When I click on "Groups Tab"
    Then I expect that element "#ALL Rows" does not exist
    When I click on "Users Tab"
    Then I expect that element "#ALL Rows" does not exist

    Examples:
      | Account Name  | Read Permissions Email Id              | password   | User Name   |
      | QA_ViralGains | ViralGainsTestReadPermission@gmail.com | mypassword | QA_USerTest |


#      #Testing Account with Write Permissions
#  Scenario Outline:
#        #Creating Account
#    Given I am logged in to the email account "<Write Permissions Email Id>"
#    And I log into the site "ODC" as an admin
#    And I select default account
#    And I expect to be on the "ODCDashboard" page
#    When I click on "Account Management"
#    When I click on "Users Tab"
#    And I click on "New User Button"
#    And I click on "Parent dropdown"
#    And I set "<Account Name>" to "Group Account Name"
#    And I click on "<Account Name>" in the "Parent Account" drop down
#    And I set "<User Name>" to "User Name"
#    When I set "<Write Permissions Email Id>" to the inputfield appended with current Date_Time "User Email Id"
#    And I store the value from inputfield "User Email Id" as "user email"
#    And I click on "Invite"
#    Then I receive an email to join "<Account Name>" account
#    And I click on the email link
#    And I click on "Accept Invite"
#    When I set "<First Name>" to "First Name"
#    When I set "<Last Name>" to "Last Name"
#    When I set "<Job Title>" to "Job Title"
#    When I set "<password>" to "Password"
#    And I click on "Save"
#    When I pause for 2000ms
#  #^If you log in too fast, you can login before the database is updated with the invitation acception.
#
#  # Testing account with Write permissions
#    Given I log into the site "ODC" as an admin
#    And I expect to be on the "ODCDashboard" page
#    And I select default account
#    When I click on "Account Management"
#    When I click on "Users Tab"
#    When I click on "Checkbox in row #1"
#    And I click on "Edit Button in row #1"
#    And I add "read andwrite permissions" to "User Group InputField"
#    And I click on "read andwrite permissions" in the "User Group Value1" drop down
#    And I click on "Add"
#    And I click on "Save"
#    When I pause for 2000ms
#    #    #^If you log in too fast, you can login before the database is updated with the invitation acception.
#    #When I log into the site "ODC" with userName "<Read Permissions Email Id>" and password "<password>"
#    When I open the url "/"
#    And I set stored value "user email" to inputfield "Email"
#    And I set "<password>" to "Password"
#    And I click on "Login"
#
#
#    And I select default account
#    And I click on "Account Management"
#    Then I expect that element "#ALL Rows" does exist
#    #Try to Write, succeed
#    When I click on "Groups Tab"
#    #Try to Write succeed
#    Then I expect that element "#ALL Rows" does exist
#    When I click on "Users Tab"
#    #Try to Write, succeed
#    Then I expect that element "#ALL Rows" does exist
#
#    Examples:
#      | Account Name    | Write Permissions Email Id               |password  | User Name    |First Name|Last Name|
#      | QA_ViralGains   | viralgainstestwritepermissions@gmail.com |mypassword| QA_USerTEst  |Test_First|Test_Last|
