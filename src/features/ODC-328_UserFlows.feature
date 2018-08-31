Feature: ODC-328 ODC-327 and ODC-336 User flows


  Background: Log into the site and open the users tab
    Given I am on the "users" tab of the "account management" page using the account "QA_ViralGains"

#Pending Scenario 1: User Grid Delete Confirmation Message verification with Stored Email Id
#Pending Scenario 2: Multiple Users Count after delete


 #Verify UserList (Table)Column headers and data ; Select checkbox
  Scenario:
    And I expect that table element "List Element" contains element with text "Status"
    And I expect that table element "List Element" contains element with text "Account Name"
    And I expect that table element "List Element" contains element with text "Email"
    And I expect that table element "List Element" contains element with text "First Name"
    And I expect that table element "List Element" contains element with text "Last Name"
    And I expect that table element "List Element" contains element with text "Job Title"
    And I expect that table element "List Element" contains element with text "# of Groups"
    And I click on "Select Checkbox"
    Then I expect that element "Delete Button" does exist
    And I expect that element "Cancel Button" does exist




  # Edit Grid Icon for 2nd Row : Validate the Modal window poped-up with " Manage User " Label and Close the Modal Window
  Scenario:
    When I click on "2nd Select Checkbox"
    And I click on "2 Grid Edit Icon"
    Then I expect that element "Modal Window" does exist
    And I expect that element "Modal Title" contains the text "Manage User"


  Scenario: Testing required email fields
    And I click on "New User Button"
    Then I expect that element "Modal Window" does exist
    And I click on "Parent dropdown"
    And I set "<Account Name>" to "Group Account Name"
    And I click on "<Account Name>" in the "Parent Account" drop down
    And I set "<User Name>" to "User Name"
    And I set "<User Email Id>" to "User Email Id"
    When I set "<User Email Id>" to the inputfield appended with current Date_Time "User Email Id"
    And I click on "Invite"
    Then I receive an email to join "<Account Name>" account
    When I click on the email link
    Then I expect that element "Accept Invitation Confirmation Label" does exist
    Then I expect that element "Accept Invite" does exist
    And I expect that element "User in the Invite" contains the text "Harini Kodey"
    And I expect that element "Account in the Invite" contains the text "ViralGains"
    And I expect that element "Deny Invite" does exist



  ## New User creation E2E> DECLINE Invite and validate the Declined Status in the User List Grid for that User

  Scenario Outline:
    And I create a new user named "<User Name>" with email "<User Email Id>" under account "<Account Name>"

    Then I receive an email to join "<Account Name>" account
    When I click on the email link
    And I pause for 800ms
    And I expect that element "Deny Invite" does exist
    And I click on "Deny Invite"
    And I pause for 800ms
    And I click on "Public groups"
    And I click on "Public account"
    When I click on "Account Management"
    When I click on "Users Tab"
    And I click on "Select Checkbox"
  #  Then I expect that element "New User Status" contains the text "DECLINED"
    Then I click on "Delete Button"
    Then I expect that element "Delete Confirmation Popup" does exist
    Then I expect that element "Delete Button in Delete Confirmation Pop-Up" does exist
    And I expect that element "Cancel Button in Delete Confirmation Pop-Up" does exist
    And I click on "Delete Button in Delete Confirmation Pop-Up"

    Examples:

      | Account Name  | User Email Id                 | User Name    |
      | QA_ViralGains | viralgainstestemail@gmail.com | Harini Kodey |



## New User creation E2E> Re-Click on the Invite link for which User has Declined Invite Earlier ; validate the message
  Scenario Outline:
    And I create a new user named "<User Name>" with email "<User Email Id>" under account "<Account Name>"

    And I pause for 800ms
    Then I receive an email to join "<Account Name>" account
    When I click on the email link
    And I pause for 1000ms
    And I click on "Deny Invite"
    When I click on the email link
    And I expect that element "Alert Message" contains the text "This invitation has already been used"

    # Data Cleanup steps
    Given I am on the "users" tab of the "account management" page using the account "QA_ViralGains"
    When I delete the newly added row in the Grid


    Examples:

      | Account Name  | User Email Id                 | User Name    |
      | QA_ViralGains | viralgainstestemail@gmail.com | Harini Kodey |


 # New User creation E2E> Re-Click on the Invite link for which User has Accepted Invite Earlier ; validate the message

  Scenario Outline:
    And I create a new user named "<User Name>" with email "<User Email Id>" under account "<Account Name>"

    Then I receive an email to join "<Account Name>" account
    When I click on the email link
    And I accept New User Invite and provide user defined values "<First Name>", "<Last Name>", "<Job Title>" and "<Password>"

    And I pause for 800ms
    When I click on the email link
    And I expect that element "Alert Message" contains the text "This invitation has already been used"

       # Data Cleanup steps
    Given I am on the "users" tab of the "account management" page using the account "QA_ViralGains"
    When I delete the newly added row in the Grid

    Examples:

      | Password   | First Name | Last Name | Job Title | Account Name  | User Email Id                 | User Name    |
      | mypassword | Test_First | Test_Last | QA        | QA_ViralGains | viralgainstestemail@gmail.com | Harini Kodey |

  ## New User creation E2E> Accept Invite and Login as Account Manager change the user from Enabled Status to Disable Status
    # and Grid Delete ; Validate the DELETED row IS NOT Existing
  Scenario Outline:
    And I create a new user named "<User Name>" with email "<User Email Id>" under account "<Account Name>"

    Then I receive an email to join "<Account Name>" account
    When I click on the email link

    And I accept New User Invite and provide user defined values "<First Name>", "<Last Name>", "<Job Title>" and "<Password>"

    And I pause for 800ms
    When I set "<Valid EmailId>" to "Email"
    And I set "<Valid Password>" to "Password"
    And I click on "Submit"
    And I pause for 800ms
    And I click on "Public groups"
    And I click on "Public account"
    When I click on "Account Management"
    When I click on "Users Tab"

    Then I expect that element "Newest User" does equal stored value "New User Email"
    Then I expect that element "New User Status" contains the text "ENABLED"
    And I pause for 800ms
    When I click on "Select Checkbox"
    And I click on "Grid Disable Icon"
    When I click on "Select Checkbox"
    Then I expect that element "New User Status" contains the text "DISABLED"
    When I click on "Select Checkbox"
    And I click on "Grid Delete Icon"
    Then I expect that element "Delete Confirmation Popup" does exist
    Then I expect that element "Delete Button in Delete Confirmation Pop-Up" does exist
    And I expect that element "Cancel Button in Delete Confirmation Pop-Up" does exist
   # And I expect that element "Delete Confirmation Message" contains the text "Are you sure you want to delete 'viralgainstestemail+1734@gmail.com'?"
    And I click on "Delete Button in Delete Confirmation Pop-Up"


    Examples:

      | Valid EmailId     | Valid Password | First Name | Last Name | Job Title | Account Name  | User Email Id                 | User Name    |
      | qa@viralgains.com | mypassword     | Test_First | Test_Last | QA        | QA_ViralGains | viralgainstestemail@gmail.com | Harini Kodey |

# New User creation in Account Mgt Page > Login as User and validate the Account displayed in the context switcher(Public groups)

  Scenario Outline:
    And I create a new user named "<User Name>" with email "<User Email Id>" under account "<Account Name>"

    And I pause for 800ms
    Then I receive an email to join "<Account Name>" account
    When I click on the email link
    And I pause for 800ms
    Then I expect that element "Accept Invitation Confirmation Label" does exist
    Then I expect that element "Accept Invite" does exist
    And I expect that element "Deny Invite" does exist
    And I accept New User Invite and provide user defined values "<First Name>", "<Last Name>", "<Job Title>" and "<Password>"

    And I pause for 800ms
    And I set stored value "New User Email" to inputfield "Email"
    And I pause for 800ms
    And I set "<Password>" to "Password"
    And I pause for 800ms
    And I click on "Submit"
    And I click on "Public groups"
    And I click on "Public account"

       # Data Cleanup steps
    Given I log into the site "ODC" as an admin
    And I am on the "users" tab of the "account management" page using the account "QA_ViralGains"
    When I delete the newly added row in the Grid

    Examples:

      | Password  | First Name | Last Name | Job Title | Account Name  | User Email Id                 | User Name    |
      | mypassword| Test_First | Test_Last | QA        | QA_ViralGains | viralgainstestemail@gmail.com | Harini Kodey |


 ## New User creation E2E> Just Send Invite and Login as Account Manager to check the user added in the User List with Invited Status
  Scenario Outline:
    And I create a new user named "<User Name>" with email "<User Email Id>" under account "<Account Name>"

    And I pause for 800ms
    And I pause for 800ms
    When I click on "Select Checkbox"
    Then I expect that element "Newest User" does equal stored value "New User Email"
  #  Then I expect that element "New User" contains the text "INVITED"

    # Data Cleanup steps
    Given I log into the site "ODC" as an admin
    And I am on the "users" tab of the "account management" page using the account "QA_ViralGains"
    Then I delete the newly added row in the Grid


    Examples:

      | Account Name  | User Email Id                 | User Name    |
      | QA_ViralGains | viralgainstestemail@gmail.com | Harini Kodey |




 # New User creation > Edit the User with 2 Groups for QA_ViralGains Account
    # Validate Count the Number of Groups in the User Grid matches with the Groups added in the Grid
  @ODC-681
  Scenario Outline:
    Given I have a Group named "Read Permissions" under Account "<Account Name>" with stored user emails "" and permissions "CAMPAIGN_READ, ACCOUNT_READ"
    And I create a new user named "<User Name>" with email "<User Email Id>" under account "<Account Name>"
    Then I receive an email to join "<Account Name>" account
    When I click on the email link

    And I accept New User Invite and provide user defined values "<First Name>", "<Last Name>", "<Job Title>" and "<Password>"
    And I pause for 800ms

    And I log into the site "ODC" as an admin
    Given I am on the "users" tab of the "account management" page using the account "QA_ViralGains"
    When I click on "Select Checkbox"
    And I click on "Grid Edit Icon"
    Then I expect that element "Modal Window" does exist
    And I click on "User Group"
    And I set "<UserGroup>" to "User Group InputField"
    And I click on "<UserGroup>" in the "Account Name Dropdown" drop down
    And I click on "Add"
    And I click on "User Group"
    And I set "<UserGroup1>" to "User Group InputField"
    And I click on "<UserGroup1>" in the "Account Name Dropdown" drop down
    And I click on "Add"
    And I click on "Submit"
    When I click on "Select Checkbox"
    And I pause for 800ms
    And I store the value from element "#Groups count in Users Tab" as "Group Count in Users Tab"
    And I pause for 800ms
    When I click on "Select Checkbox"
    And I pause for 2000ms
    When I click on "Grid Edit Icon"
    And I pause for 800ms
    Then I expect that element "Modal Window" does exist
    And I pause for 800ms
    And I expect "Group Count in Users Tab" to be equal to the number of "Groups in the modal grid"
    And I click on "Close"

    And I delete the User named with stored variable "New User Email" that is paired with the Account named "<Account Name>"


    Examples:

      | UserGroup1       | First Name | Last Name | Job Title | Account Name  | User Email Id                 | User Name    | UserGroup     |
      | Read Permissions | Test_First | Test_Last | QA        | QA_ViralGains | viralgainstestemail@gmail.com | Harini Kodey | QA_ViralGains |


## New User creation E2E> Duplicate User Message
  Scenario Outline:
    And I create a new user named "<User Name>" with email "<User Email Id>" under account "<Account Name>"

    When I click on "Select Checkbox"
    And I pause for 800ms
    Then I expect that element "Newest User" does equal stored value "New User Email"
    # Then I expect that element "New User Status" contains the text "INVITED"
    And I create a new user named "<User Name>" with email "<User Email Id>" under account "<Account Name>"
   # And I expect that element "Message" contains the text "Duplicate User"

    Then I delete the newly added row in the Grid

    Examples:

      | Account Name  | User Email Id                 | User Name    |
      | QA_ViralGains | viralgainstestemail@gmail.com | Harini Kodey |

# New User creation E2E> Verify if we are able to Invite Same user for multiple accounts

  Scenario Outline:
    And I create a new user named "<User Name>" with email "<User Email Id>" under account "<Account Name>"

    When I click on "Select Checkbox"
    Then I expect that element "Newest User" does equal stored value "New User Email"
  #  Then I expect that element "New User" contains the text "INVITED"

    And I create a new user named "<User Name>" with email "<User Email Id>" under account "<New Account Name>"
    When I click on "Select Checkbox"
    Then I expect that element "Newest User" does equal stored value "New User Email"
#   Then I expect that element "New User" contains the text "INVITED"
    When I click on "Select Checkbox"
    And I delete the newly added row in the Grid

    Examples:

      | New Account Name | User Email Id                 | User Name    | Account Name  |
      | 1                | viralgainstestemail@gmail.com | Harini Kodey | QA_ViralGains |


# New User Created then Deleted > Verify User created is in the Grid and then Perform Delete confirm
  #later validate Deleted User is NOT existing in the Users Grid

  Scenario Outline:
    And I create a new user named "<User Name>" with email "<User Email Id>" under account "<Account Name>"

    Then I receive an email to join "<Account Name>" account
    When I click on the email link
    And I click on "Deny Invite"

    And I pause for 800ms
    And I click on "Public groups"
    And I click on "Public account"
    When I click on "Account Management"
    When I click on "Users Tab"
    Then I expect that element "Newest User" does equal stored value "New User Email"
    When I click on "Select Checkbox"
    Then I click on "Delete Button"
    Then I expect that element "Delete Confirmation Popup" does exist
    Then I expect that element "Delete Button in Delete Confirmation Pop-Up" does exist
    And I expect that element "Cancel Button in Delete Confirmation Pop-Up" does exist
    And I expect that element "Delete Confirmation Message" contains the text "Are you sure you want to delete all selected users (1)?"
    And I click on "Delete Button in Delete Confirmation Pop-Up"
    Then I expect that element "Newest User" does not equal stored value "user email"

    Examples:

      | Account Name  | User Email Id                 | User Name    |
      | QA_ViralGains | viralgainstestemail@gmail.com | Harini Kodey |


# New User Created> Perform Delete cancel action -and validate ROWS Still existing in the Users Grid

  Scenario Outline:
    And I create a new user named "<User Name>" with email "<User Email Id>" under account "<Account Name>"

    Then I receive an email to join "<Account Name>" account
    When I click on the email link
    And I pause for 800ms
    And I click on "Deny Invite"
    And I pause for 800ms
    And I click on "Public groups"
    And I click on "Public account"
    When I click on "Account Management"
    When I click on "Users Tab"
    Then I expect that element "Newest User" does equal stored value "New User Email"
    And I click on "Select Checkbox"
    Then I click on "Delete Button"
    Then I expect that element "Delete Confirmation Popup" does exist
    Then I expect that element "Delete Button in Delete Confirmation Pop-Up" does exist
    And I expect that element "Cancel Button in Delete Confirmation Pop-Up" does exist
    And I expect that element "Delete Confirmation Message" contains the text "Are you sure you want to delete all selected users (1)?"
    And I click on "Cancel Button in Delete Confirmation Pop-Up"
    Then I expect that element "Newest User" does equal stored value "New User Email"


    Examples:

      | Account Name  | User Email Id                 | User Name    |
      | QA_ViralGains | viralgainstestemail@gmail.com | Harini Kodey |


 ## Multiple Rows/Users Delete Cancel action - Validate the Count in the Delete Confirmation Message is as per the Rows selected
  ##and validate the selected Rows still exist
  Scenario:
    When I click on "Select Checkbox"
    And I pause for 300ms for the grid to load
    When I click on "2nd Select Checkbox"
    And I store the number of "Selected Rows" as "initial number of selected rows"
    And I pause for 800ms
    Then I click on "Delete Button"
    Then I expect that element "Delete Confirmation Popup" does exist
    Then I expect that element "Delete Button in Delete Confirmation Pop-Up" does exist
    And I expect that element "Cancel Button in Delete Confirmation Pop-Up" does exist
    And I expect that element "Delete Confirmation Message" contains the text "Are you sure you want to delete all selected users (2)?"
    And I store the count from the field "Delete Confirmation Message" as "delete confirmation count"
    And I expect "initial number of selected rows" to be equal to "delete confirmation count"
    And I click on "Cancel Button in Delete Confirmation Pop-Up"
    And I pause for 800ms
    Then I expect that element "#Selected Rows" does exist


### Multiple Rows/Users Delete Confirm action and validate the selected Rows DO NOT exist
#  Scenario:
#    When I click on "Select Checkbox"
#    When I click on "2nd Select Checkbox"
#    And I store the number of "Selected Rows" as "initial number of selected rows"
#    And I pause for 800ms
#    Then I click on "Delete Button"
#    Then I expect that element "Delete Confirmation Popup" does exist
#    Then I expect that element "Delete Button in Delete Confirmation Pop-Up" does exist
#    And I expect that element "Cancel Button in Delete Confirmation Pop-Up" does exist
#    And I expect that element "Delete Confirmation Message" contains the text "Are you sure you want to delete all selected users (2)?"
#    And I store the count from the field "Delete Confirmation Message" as "delete confirmation count"
#    And I expect "initial number of selected rows" to be equal to "delete confirmation count"
#    And I click on "Delete Button in Delete Confirmation Pop-Up"
#    And I expect to be on the "ODCDashboard" page
#    # Then I expect that element "#Selected Rows" does not exist


# Sorting "Ascending" of the Entire List Items in USers's Tab when clicked on User Name
  Scenario:
    Then I click on "Email Column Sort Icon"
    Then I expect that "Name Column Elements" is sorted Ascending
    Then I expect that element "Ascending" does exist

# Sorting "Descending" of the Entire List Items in User's Tab when clicked on the column header : # of Groups
  Scenario:
    When I click on "# of Groups Column"
    And I click on "# of Groups Column"
    Then I expect that "# of Groups Column Elements" is sorted Descending
    Then I expect that element "Descending" does exist

## Sorting "Ascending" of the Entire List Items in User's Tab when clicked on the column header : # of Groups
  Scenario:
    And I click on "# of Groups Column"
    Then I expect that "# of Groups Column Elements" is sorted Ascending
    Then I expect that element "Ascending" does exist


#
## Create User and validate the Incremented Users count in Groups Tab
#  Scenario Outline:
#
#    Given I log into the site "ODC" as an admin
#    And I select default account
#    And I pause for 800ms
#    And I expect to be on the "ODCDashboard" page
#    And I pause for 800ms
#    When I click on "Account Management"
#    And I pause for 800ms
#    When I click on "Groups Tab"
#    And I pause for 800ms
#   And I store the value from element "Number of Users" as "number of users"
#    And I pause for 800ms
#    When I click on "Users Tab"
#    And I click on "New User Button"
#    And I pause for 800ms
#    Then I expect that element "Modal Window" does exist
#    When I set "<User Account Name>" to "User Account Name"
#    And I set "<First Name>" to "First Name"
#    And I set "<Last Name>" to "Last Name"
#    When I set "<User EmailId>" to the inputfield appended with current Date_Time "User Email"
#    And I set "<Job Title>" to "Job Title"
#    And I click on "User Status Dropdown"
#    And I click on "Status Menu-Enable"
#    And I click on "User Group"
#    And I set "<User Group>" to "User Group InputField"
#    And I click on "User Group Value"
#    And I click on "Add"
#    And I click on "Submit"
#    When I click on "Groups Tab"
#    And I store the value from element "Number of Users" as "updated number of users"
#    Then I expect "updated number of users" to be 1 more than "number of users"
#
#    Examples:
#      |User Account Name|First Name|Last Name|User EmailId|Job Title|User Group|
#      |QA_ViralGains|TEst_First|Test_Last|hkodey@viralgains.com|QA_AUTO|QA_ViralGains|

## Delete User and validate the Decremented Users count in Groups Tab
#
#  Scenario:
#    Given I log into the site "ODC" as an admin
#    And I select default account
#    And I pause for 800ms
#    And I expect to be on the "ODCDashboard" page
#    And I pause for 800ms
#    When I click on "Account Management"
#    And I pause for 800ms
#    When I click on "Groups Tab"
#    And I pause for 800ms
#    And I store the value from element "Number of Users" as "initial number of users"
#    And I pause for 800ms
#    When I click on "Users Tab"#
#    When I click on "2 Select Checkbox"#
#    And I click on "Delete Button"##
#    When I click on "Groups Tab"#
#    And I store the value from element "Number of Users" as "updated number of users"
# Then I expect "updated number of users" to be 1 less than "initial number of users"


# ODC-316 : Verify the validation for the required fields during User Flow (E2E) - Invite, Accept, Edit pages
  Scenario Outline:
    And I click on "New User Button"
    Then I expect that element "Modal Window" does exist

    And I click on "Parent dropdown"
    And I click on "Account Management and Campaign Popup Title"
    Then I expect that element "Dropdown Field Error" contains the text "Required"
    And I expect that element "Invite" is enabled
    And I click on "Parent dropdown"
    And I set "<Account Name>" to "Group Account Name"
    And I click on "<Account Name>" in the "Parent Account" drop down
    And I expect that element "Invite" is enabled

    And I click on "User Name"
    And I click on "Account Management and Campaign Popup Title"
    Then I expect that element "Field Error Message" contains the text "Required"
    And I expect that element "Invite" is enabled
    And I click on "User Name"
    And I set "<User Name>" to "User Name"

    And I click on "User Email Id"
    And I click on "Account Management and Campaign Popup Title"
    Then I expect that element "Field Error Message" contains the text "Required"
    And I expect that element "Invite" is enabled
    And I click on "User Email Id"
    When I set "<User Email Id>" to the inputfield appended with current Date_Time "User Email Id"
    Then I store the value from inputfield "User Email Id" as "user email"
    And I expect that element "Invite" is enabled
    And I click on "Invite"

    And I pause for 800ms
    Then I receive an email to join "<Account Name>" account
    When I click on the email link
    And I pause for 800ms

    And I click on "Accept Invite"
    And I click on "First Name"
    And I click on "Save"
    Then I expect that element "Form Field Value Incorrect" contains the text "Required"
    When I set "<First Name>" to "First Name"
    And I click on "Last Name"
    And I click on "Save"
    Then I expect that element "Form Field Value Incorrect" contains the text "Required"
    When I set "<Last Name>" to "Last Name"
    And I click on "Job Title"
    And I click on "Save"
    Then I expect that element "Form Field Value Incorrect" contains the text "Required"
    When I set "<Job Title>" to "Job Title"
    And I click on "Password"
    And I click on "Save"
    Then I expect that element "Form Field Value Incorrect" contains the text "Required"
    When I set "<Valid Password>" to "Password"
    And I expect that element "Save Button" is enabled
    And I click on "Save"

    And I pause for 800ms
    When I set "<Valid EmailId>" to "Email"
    And I set "<Valid Password>" to "Password"
    And I click on "Submit"

    And I pause for 800ms
    And I click on "Public groups"
    And I click on "Public account"
    When I click on "Account Management"
    When I click on "Users Tab"
    When I click on "Select Checkbox"
    And I click on "Grid Edit Icon"
    And I pause for 800ms
    Then I expect that element "Modal Window" does exist
    And I click on "User Group"
    And I click on "Account Management and Campaign Popup Title"
    # Then I expect that element "Dropdown Field Error" contains the text "Required" (To be Deleted)
    And I expect that element "Add Button" is not enabled
    And I expect that element "Save Button" is not enabled
    And I click on "User Group"
    And I set "<UserGroup>" to "User Group InputField"
    And I click on "<UserGroup>" in the "Account Name Dropdown" drop down
    And I click on "Add"
    And I click on "Save"
    # And I expect to be on the "ODCDashboard" page

       # Data Cleanup steps
    Given I log into the site "ODC" as an admin
    And I am on the "users" tab of the "account management" page using the account "QA_ViralGains"
    When I delete the newly added row in the Grid


    Examples:

      | Valid EmailId     | Valid Password | First Name | Last Name | Job Title | Account Name  | User Email Id                 | User Name    | UserGroup     |
      | qa@viralgains.com | mypassword     | Test_First | Test_Last | QA        | QA_ViralGains | viralgainstestemail@gmail.com | Harini Kodey | QA_Viralgains |


# Pagination : Users Tab Navigate till the last Page

  Scenario:
    Then I expect that element "Previous" does exist
    And I expect that element "Next" does exist
    When I click on element "Next" till I navigate to last "Rows Number"


# Pagination : Validation of Pagination :Previous and Next Controls and Verify the Next Page Number when clicked on Next control
  Scenario:
    Then I expect that element "Previous" does exist
    And I expect that element "Next" does exist
    When I click on "Next"
    Then I expect that element "Rows Number" contains the text "11"

# Pagination : Validate the Total records count increased when new record is created
  Scenario Outline:
    Then I expect that element "Previous" does exist
    And I expect that element "Next" does exist
    And I expect that element "Rows Number" does exist
    And I store the value from element "Rows Number" as "intial row count"
    And I click on "New User Button"
    Then I expect that element "Modal Window" does exist
    And I click on "Parent dropdown"
    And I set "<Account Name>" to "Group Account Name"
    And I click on "<Account Name>" in the "Parent Account" drop down
    And I set "<User Name>" to "User Name"
    And I set "<User Email Id>" to "User Email Id"
    When I set "<User Email Id>" to the inputfield appended with current Date_Time "User Email Id"
    And I click on "Invite"
    And I pause for 800ms
    And I pause for 800ms
    And I store the value from element "Rows Number" as "updated row count"
    And I pause for 800ms
    And I expect "intial row count" to be 1 less than "updated row count"

       # Data Cleanup steps
    Given I log into the site "ODC" as an admin
    And I am on the "users" tab of the "account management" page using the account "QA_ViralGains"
    When I delete the newly added row in the Grid

    Examples:
      | Account Name  | User Email Id                 | User Name    |
      | QA_ViralGains | viralgainstestemail@gmail.com | Harini Kodey |

#Pagination : Verify the Sorting functionality exists in the Next page (Right/Next control click in Pagination bar)
  Scenario:
    Then I click on "Email Column Sort Icon"
    Then I expect that "Name Column Elements" is sorted Ascending
    And I pause for 800ms
    Then I expect that element "Ascending" does exist
    And I pause for 800ms
    When I click on "Next"
    And I pause for 800ms
    Then I expect that "Name Column Elements" is sorted Ascending
    And I expect that element "Ascending" does exist

