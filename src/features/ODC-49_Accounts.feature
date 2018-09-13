Feature: ODC-49 ODC-823 and ODC-13 AccountManagement_Account_Users_Create_Edit_validateLists Validation

Background: I am on the account management page
  Given I am on the "accounts" tab of the "account management" page using the account "QA_ViralGains"

# Account

# Verify AccountList (Table) Column headers and data ; Select checkbox for First row
@Accept
  Scenario:
    And I expect that table element "List Element" contains element with text "Status"
    And I expect that table element "List Element" contains element with text "Account Name"
    And I expect that table element "List Element" contains element with text "# of Groups"
    And I expect that table element "List Element" contains element with text "# of Users"
    And I expect that table element "List Element" contains element with text "Contact Email"
    And I click on "Select Checkbox"
    Then I expect that element "Delete Button" does exist
    And I expect that element "Cancel Button" does exist


##  Edit Grid Item feature validation in the Account List for 1st Row
  Scenario Outline:
   ##Create New Account
   And I create New Account with user defined values "<Parent Account Name>", "<Account Name>", "<Valid EmailId>", "<Domain>", "Imagepic", "<DSP Login>" and "<DSP Password>"
    When I click on "Select Checkbox"

   #Edit Account
    And I click on "Grid Edit Icon"
    Then I expect that element "Modal Window" does exist
    And I click on "Close"

    ##Cleanup steps in Accounts GRID
    And I click on "Delete Button"
    And I click on "Delete Button in Delete Confirmation Pop-Up"

  Examples:

  | Valid EmailId     | Domain          | Account Name       | Parent Account Name | Account Name|DSP Login|DSP Password    |
  | qa@viralgains.com | https://ebay.in | AC to Edit         | QA_ViralGains       | ViralGains  | gdpr    |GDPR123         |



## Sorting "Ascending" of the Entire List Items in Account's Tab when clicked on Account Name
  @Bug @ODC-610

  Scenario Outline:
    ##Create New Account
    And I create New Account with user defined values "<Parent Account Name>", "<Account Name>", "<Valid EmailId>", "<Domain>", "Imagepic", "<DSP Login>" and "<DSP Password>"

    Then I click on "Sort By Account Name"
    And I pause for 800ms
    Then I expect that "Name Column Elements" is sorted Ascending
    And I pause for 800ms
    Then I expect that element "Ascending" does exist

    ##cleanup steps in Account GRID
    When I click on "Select Checkbox"
    Then I expect that element "Existing Test Account" does exist

    ##cleanup steps in Account GRID
    And I click on "Delete Button"
    Then I expect that element "Delete Confirmation Popup" does exist
    And I click on "Delete Button in Delete Confirmation Pop-Up"
    And I expect to be on the "ODCDashboard" page


    Examples:

      | Valid EmailId     | Domain           | Account Name       | Parent Account Name | Account Name|DSP Login|DSP Password    |
      | qa@viralgains.com | https://ebay.com | AC to Edit         | QA_ViralGains       | ViralGains  | gdpr    |GDPR123         |
      | qa@viralgains.com | https://ebay.com | SPAC's!$#E@        | QA_ViralGains       | ViralGains  | gdpr    |GDPR123         |
      | qa@viralgains.com | https://ebay.com | AC-SP_DC           | QA_ViralGains       | ViralGains  | gdpr    |GDPR123         |



## Sorting "Descending" of the Entire List Items in Account's Tab when clicked on the column header : # of Users
  Scenario:
    When I click on "Sort By # of Users"
    And I pause for 200ms
    And I click on "Sort By # of Users"
    And I pause for 400ms
    Then I expect that "Users Count Column Elements" is sorted Descending
    And I pause for 400ms
    Then I expect that element "Descending" does exist

# Sorting "Ascending" of the Entire List Items in Account's Tab when clicked on the column header : # of Users
  Scenario:
    And I click on "Sort By # of Users"
    And I pause for 400ms
    Then I expect that "Users Count Column Elements" is sorted Ascending
    And I pause for 400ms
    Then I expect that element "Ascending" does exist


# Sorting "Descending" of the Entire List Items in Account's Tab when clicked on the column header : # of Groups
  Scenario:
    When I click on "Sort By # of Groups"
    And I pause for 200ms
    And I click on "Sort By # of Groups"
    And I pause for 400ms
    Then I expect that "Groups Count Column Elements" is sorted Descending
    And I pause for 400ms
    Then I expect that element "Descending" does exist



## Edit Grid Item feature validation in the Account List for 2nd row item ; CLEAR existing Name and update Account Name
# Delete the 2 rows and validate the Count displayed in the delete pop-up has exact number of rows selected

  Scenario Outline:
 ##Create New Account 1
    And I create New Account with user defined values "<Parent Account Name>", "<Account Name>", "<Valid EmailId>", "<Domain>", "Imagepic", "<DSP Login>" and "<DSP Password>"

  ##Create New Account 2
    And I create New Account with user defined values "<Parent Account Name>", "<Account Name>", "<Valid EmailId>", "<Domain>", "Imagepic", "<DSP Login>" and "<DSP Password>"

    And I click on "2nd Select Checkbox"

 #Edit Account Name and validate the Initial and updated Account name in the Account grid/modal window
    And I click on "2 Grid Edit Icon"
    Then I expect that element "Modal Window" does exist
   # Validate the Account name displayed in the text field has the Original Account name TODO
    And I clear the inputfield "Account Name"
    When I set "<Edit Account Name>" to the inputfield appended with current Date_Time "Account Name"
    And I click on "Save"
   # Validate the Account name displayed in the grid has the edited name TODO

    ##Select 2 Rows to delete and Store the ROWS count
    And I click on "Account Tab"
    And I click on "Select Checkbox"
    And I pause for 300ms for the grid to load
    And I click on "2nd Select Checkbox"
    And I store the number of "Selected Rows" as "initial number of selected rows"

    ## Delete the Two rows and validate the deleted message has the exact rows number selected here : 2
    When I click on "Delete Button"
    Then I expect that element "Delete Confirmation Popup" does exist
    Then I expect that element "Delete Button in Delete Confirmation Pop-Up" does exist
    And I expect that element "Cancel Button in Delete Confirmation Pop-Up" does exist
    And I expect that element "Delete Confirmation Message" contains the text "Are you sure you want to delete all selected accounts (2)?"
    And I store the count from the field "Delete Confirmation Message" as "delete confirmation count"
    And I expect "initial number of selected rows" to be equal to "delete confirmation count"
    And I click on "Cancel Button in Delete Confirmation Pop-Up"
    Then I expect that element "#Selected Rows" does exist


    Examples:

      | Valid EmailId     | Domain           | Account Name       | Parent Account Name | Account Name|Edit Account Name |DSP Login|DSP Password    |
      | qa@viralgains.com | https://ebay.com | AC to Edit         | QA_ViralGains       | ViralGains  |HA-DONOTDELETE    | gdpr    |GDPR123         |


# Create Account -E2E then Disable it by clicking on Disable Grid Icon and then Delete the created account through Grid Delete Icon

  Scenario Outline:
    ##Create New Account
    And I create New Account with user defined values "<Parent Account Name>", "<Account Name>", "<Valid EmailId>", "<Domain>", "Imagepic", "<DSP Login>" and "<DSP Password>"

    When I click on "Select Checkbox"

    # Grid Disable Icon validation
    And I pause for 800ms for Grid-Disable Icon to appear
    And I click on "Grid Disable Icon"
    And I pause for 800ms for Grid-Disable Icon to perform its action
    When I click on "Select Checkbox"
    And I pause for 1000ms for the disabled text to appear
    Then I expect that element "Account List" contains the text "DISABLED"

    # Grid Delete Icon validation for a disabled record
    And I click on "Grid Delete Icon"
    Then I expect that element "Delete Confirmation Popup" does exist
    Then I expect that element "Delete Button in Delete Confirmation Pop-Up" does exist
    And I expect that element "Cancel Button in Delete Confirmation Pop-Up" does exist
   # And I expect that element "Delete Confirmation Message" contains the text "Are you sure you want to delete 'ViralGains'?" TODO
    And I click on "Delete Button in Delete Confirmation Pop-Up"

    Examples:
      | Valid EmailId             | Parent Account Name | Account Name | Domain           |DSP Login|DSP Password    |
      | qa@viralgains.com         | QA_ViralGains       | tsst1        | https://ebay.com | gdpr    |GDPR123         |



##  Enable Grid Icon feature validation in the Account List for an newly created Disable Account

  Scenario Outline:
    # Create New Account with Disabled Status
    When I click on "New Account Button"
    Then I expect that element "Modal Window" does exist
    When I set "<Parent Account Name>" to "Parent Account Name"
    And I click on "Parent Menu"
    And I set "<Account Name>" to the inputfield appended with current Date_Time "Account Name"
    And I click on "Status dropdown"
    And I click on "DISABLED" in the drop down
    And I set "<Valid EmailId>" to "Contact Email"
    And I click on "Industry dropdown"

    And I click on "Healthcare" in the drop down
    And I set "<Domain>" to "Domain"
    And I press "Enter"
    And I click on "TimeZone"
    And I click on "TimeZone Value"
    And I click on "DateTime Format"
    And I click on "DateTime Value"
    When I select file "Image.jpg" of type "jpg" for the element "Imagepic"
    And I set "<DSPLogin>" to "DSP Login"
    And I set "<DSPPassword>" to "DSP Password"

    And I click on "Submit"

   # Verify Grid Enable and Grid Delete Icons functionality
    And I click on "Select Checkbox"
    Then I expect that element "Existing Test Account" does exist
    When I pause for 800ms for grid enable button to appear for the selected row
    And I click on "Grid Enable Icon"
    And I pause for 800ms for grid enable button to perform enable action to the account
    And I click on "Select Checkbox"
    And I pause for 1000ms to validate the Enabled icon
    Then I expect that element "Account List" contains the text "ENABLED"
    And I click on "Grid Delete Icon"
    And I click on "Delete Button in Delete Confirmation Pop-Up"
    Then I expect to be on the "ODCDashboard" page


    Examples:

      | Valid EmailId     | Domain           | Account Name       | Parent Account Name | Account Name|DSPLogin|DSPPassword     |
      | qa@viralgains.com | https://ebay.com | AC to Edit         | QA_ViralGains       | ViralGains  | gdpr   |GDPR123         |




# Create Account with Disable Status then Edit all fields includes all values


@Bug @ODC-686

  Scenario Outline:
  And I create New Account with user defined values "<Parent Account Name>", "<Account Name>", "<Valid EmailId>", "<Domain>", "Imagepic", "<DSP Login>" and "<DSP Password>"

  When I click on "Select Checkbox"
    Then I expect that element "Existing Test Account" does exist
    When I click on "Select Checkbox"
    And I pause for 400ms for the grid to show icon
    And I click on "Grid Edit Icon"
    Then I expect that element "Modal Window" does exist
    And I clear the inputfield "Account Name"
    When I set "<Edit Account Name>" to the inputfield appended with current Date_Time "Account Name"
    And I click on "Edit Status dropdown"
    And I click on "Status Menu-Enable"
    And I set "<Edit ValidEmailId>" to "Contact Email"
    And I click on "Industry dropdown"
    And I click on "Edit Industry Value"
    And I set "<Edit Domain>" to "Domain"
    And I click on "Edit TimeZone dropdown"
    And I click on "Edit TimeZone Value"
    And I click on "Edit DateTime Format"
    And I click on "Edit DateTime Value"
   # And I expect that element "Imagepic" does exist
    And I click on "Remove Account ImagePic"
    And I select file "Imageteam.png" of type "jpg" for the element "Imagepic"
    And I click on "Save"
    When I click on "Select Checkbox"
    Then I expect that element "Existing Test Account" does exist

    ##cleanup steps in Account GRID
    And I click on "Delete Button"
    Then I expect that element "Delete Confirmation Popup" does exist
    And I click on "Delete Button in Delete Confirmation Pop-Up"

    Examples:
      | Valid EmailId      | Domain           | Account Name | Parent Account Name | Edit Account Name     | Edit ValidEmailId | Edit Domain          |DSP Login|DSP Password    |
      | qa@viralgains.com  | https://ebay.com | tsst1        | QA_ViralGains       | Create_Edit_Account   | hkodey@gmail.com  | https://facebook.com | gdpr    |GDPR123         |


# ODC-316 : Verify the validation for the required fields
  Scenario Outline:
    And I click on "New Account Button"
    Then I expect that element "Modal Window" does exist


    And I click on "Parent dropdown"
    And I click on "Account Management and Campaign Popup Title"
    Then I expect that element "Dropdown Field Error" contains the text "Required"
    And I expect that element "Create Button" is enabled
    And I click on "Parent dropdown"
    When I set "<Parent Account Name>" to "Parent Account Name"
    And I click on "Parent Menu"
    And I expect that element "Create Button" is enabled

    And I click on "Account Name"
    And I click on "Account Management and Campaign Popup Title"
    Then I expect that element "Field Error Message" contains the text "Required"
    And I expect that element "Create Button" is enabled
    And I set "<Account Name>" to "Account Name"
    And I expect that element "Create Button" is enabled


    And I click on "Status dropdown"
    And I click on "Account Management and Campaign Popup Title"
    Then I expect that element "Dropdown Field Error" contains the text "Required"
    And I expect that element "Create Button" is enabled
    And I click on "Status dropdown"
    And I click on "Status Menu-Disable"
    And I expect that element "Create Button" is enabled

    And I click on "Contact Email"
    And I click on "Account Management and Campaign Popup Title"
    Then I expect that element "Field Error Message" contains the text "Required"
    And I expect that element "Create Button" is enabled


    And I set "<InValid format EmailId>" to "Contact Email"
    And I click on "Account Management and Campaign Popup Title"
    Then I expect that element "Field Error Message" contains the text "You have entered an invalid email address"
    And I clear the inputfield "Contact Email"
    And I set "<InValid format EmailId without domain>" to "Contact Email"
    And I click on "Account Management and Campaign Popup Title"
    Then I expect that element "Field Error Message" contains the text "You have entered an invalid email address"
    And I clear the inputfield "Contact Email"
    And I set "<InValid format EmailId without dot>" to "Contact Email"
    And I click on "Account Management and Campaign Popup Title"
    Then I expect that element "Field Error Message" contains the text "You have entered an invalid email address"


    And I set "<Valid EmailId>" to "Contact Email"
    And I expect that element "Create Button" is enabled

    And I set "<Domain without Https>" to "Domain"
    And I click on "Account Management and Campaign Popup Title"
    Then I expect that element "Domain Field Error messsage" contains the text "Please enter valid URL with https:// at the beginning"

    And I set "<Domain with Https>" to "Domain"
    And I click on "Account Management and Campaign Popup Title"
    Then I expect that element "Field Error Validation" contains the text "Required"
    And I click on "Domain"
    And I clear the inputfield "Domain"
    And I set "<Domain with Https>" to "Domain"
    And I press "Enter"

    And I set "<Domain with Https>" to "Domain2 Text"
    And I press "Enter"
    Then I expect that element "Domain Field Error messsage" contains the text "Duplicate values not allowed"
    And I expect that element "Create Button" is enabled
    And I set "<Domain with Https>" to "Domain2 Text"

    And I click on "DSP Login"
    And I click on "Account Management and Campaign Popup Title"
    Then I expect that element "Field Error Message" contains the text "Required"
    And I set "<DSP Login>" to "DSP Login"

    And I click on "DSP Password"
    And I click on "Account Management and Campaign Popup Title"
    Then I expect that element "Field Error Message" contains the text "Required"
    And I set "<DSP Password>" to "DSP Password"

    And I click on "Create Button"

    When I click on "Select Checkbox"
    Then I expect that element "Existing Test Account" does exist
    And I pause for 800ms
    When I click on "Select Checkbox"
    And I click on "Grid Edit Icon"
    Then I expect that element "Modal Window" does exist
  #    And I expect that element "Create Button" is enabled

    And I clear the inputfield "Account Name"
    And I click on "Account Management and Campaign Popup Title"
    Then I expect that element "Field Error Message" contains the text "Required"
    And I expect that element "Save Button" is enabled
    And I set "<Account Name>" to "Account Name"
    When I set "<Edit Account Name>" to the inputfield appended with current Date_Time "Account Name"
    And I expect that element "Save Button" is enabled

    And I click on "Edit Status dropdown"
    And I click on "Status Menu-Enable"


    And I clear the inputfield "Contact Email"
    And I click on "Account Management and Campaign Popup Title"
    Then I expect that element "Field Error Message" contains the text "Required"
    And I expect that element "Save Button" is enabled
    And I set "<Edit ValidEmailId>" to "Contact Email"
    And I expect that element "Save Button" is enabled

    And I click on "Save"
    When I click on "Select Checkbox"
    Then I expect that element "Existing Test Account" does exist


     ##cleanup steps in Account GRID
    And I click on "Delete Button"
    Then I expect that element "Delete Confirmation Popup" does exist
    And I click on "Delete Button in Delete Confirmation Pop-Up"
    And I expect to be on the "ODCDashboard" page

    Examples:
    |Different Domain with Https| Domain without Https| Domain with Https  | Valid EmailId      |Account Name             | Parent Account Name | Edit Account Name                             | Edit ValidEmailId      |InValid format EmailId without dot| InValid format EmailId without domain |InValid format EmailId |DSP Login|DSP Password    |
    | https://facebook.com      | qatest.org          | https://ebay.com   | qa@viralgains.com  |QA'Account!&^#@spchars* | QA_ViralGains       | Create_Edit_SPAccountQA'Account!&^#@spchars*   | hkodey@viralgains.com  |t@tcom                            | hkodey@gmail                          |hkodeygmail.com        | gdpr    |GDPR123         |


## Create Group for a new account and validate the Incremented Group count in Accounts Tab for the same Account

  Scenario Outline:
##Create New Account
    And I create New Account with user defined values "<Parent Account Name>", "<Account Name>", "<Valid EmailId>", "<Domain>", "Imagepic", "<DSP Login>" and "<DSP Password>"
    When I click on "Select Checkbox"

 ## Capture initial group count for the account
    And I store the value from element "Number of Groups" as "Initial Group Count for Account"

 ##Create New User
     And I create a new user named "<User Name>" with email "<User Email Id>" under account named with stored variable "New Account Name"
    And I pause for 800ms for the database to update

 ##Email Invite Acceptance and provide User details
    And I receive an email to join "New Account Name" account
    And I click on the email link
    And I accept New User Invite and provide user defined values "<First Name>", "<Last Name>", "<Job Title>" and "<Password>"
    And I pause for 2000ms for the database to update

 ##Login as Admin to create a Group
    Given I log into the site "ODC" as an admin

 ##Create Group fields
    And I am on the "groups" tab of the "account management" page using the account "QA_ViralGains"
    And I click on "New Group Button"
    And I set stored value "New Account Name" to inputfield "Group Account Name"
    And I click on "Industry Value"
    And I set "<Group Name>" to the inputfield appended with current Date_Time "Group Name"
    And I store the value from inputfield "Group Name" as "New Group Name"
    And I click on "Group Status dropdown"
    And I click on "Status Menu-Enable"
    And I click on "Campaign Management: Write Select Checkbox"
    And I click on "Campaign Management: Read Select Checkbox"
    And I set stored value "New User Email" to inputfield "User Group InputField"
    And I click on stored value "New User Email" in the "Group Name Dropdown" drop down
    And I click on "Add"
    And I click on "Create Button"

 ##Navigate to Account Tab and verify current Group Count
    And I click on "Account Tab"
    And I click on "Select Checkbox"
    And I store the value from element "Number of Groups" as "Updated Group Count for Account"

 #Verify the Expected result : Group Count incremented by 1
    Then I expect "Updated Group Count for Account" to be 1 more than "Initial Group Count for Account"

  ##cleanup steps in Account GRID
    And I click on "Delete Button"
    And I click on "Delete Button in Delete Confirmation Pop-Up"


    Examples:

      | Valid EmailId     | Domain           | Account Name       | Parent Account Name | User Name  |User Email Id                |Group Name          |First Name|Last Name|Job Title|Account Name|Password   |DSP Login|DSP Password    |
      | qa@viralgains.com | https://ebay.com | AC for Group Count | QA_ViralGains       | QAUser test|viralgainstestemail@gmail.com|QA Test Group Name  |Test_First|Test_Last|QA       |ViralGains  |mypassword | gdpr    |GDPR123         |


## Create 3 Groups for a single Account and Validate the incremented group count in the account tab; now delete a group and check the decremented value
  ## in the account tab for the same account (Initial : 3 after deleting the group the count should be 2)

  Scenario Outline:
 ##Create New Account
    And I create New Account with user defined values "<Parent Account Name>", "<Account Name>", "<Valid EmailId>", "<Domain>", "Imagepic", "<DSP Login>" and "<DSP Password>"
    When I click on "Select Checkbox"

 ## Capture initial group count for the account
    And I store the value from element "Number of Groups" as "Initial Group Count for Account"

 ##Create New User
    And I create a new user named "<User Name>" with email "<User Email Id>" under account named with stored variable "New Account Name"
    And I pause for 800ms for the database to update

 ##Email Invite Acceptance and provide User details
    And I receive an email to join "New Account Name" account
    And I click on the email link
    And I accept New User Invite and provide user defined values "<First Name>", "<Last Name>", "<Job Title>" and "<Password>"
    And I pause for 2000ms for the database to update

 ##Login as Admin to create a Group
    Given I log into the site "ODC" as an admin
    And I select default account
    And I click on "Account Management"

 ## Create Group 1
    When I create a new group named "<Group Name>" under account named with stored variable "New Account Name" with email named with stored variable "New User Email" and Campaign Write permissions

 ## Create Group 2
    And I create a new group named "<Group Name>" under account named with stored variable "New Account Name" with email named with stored variable "New User Email" and Campaign Read permissions

 ## Create Group 3
    And I create a new group named "<Group Name>" under account named with stored variable "New Account Name" with email named with stored variable "New User Email" and Campaign Write permissions

 ##Navigate to Account Tab and verify current Group Count
    And I click on "Account Tab"
    And I click on "Select Checkbox"
    And I store the value from element "Number of Groups" as "Updated Group Count for Account"

 ##Verify the Expected result : Group Count incremented by 3 for the account
    Then I expect "Updated Group Count for Account" to be 3 more than "Initial Group Count for Account"

 ##Delete One Group associated to the Account
    When I click on "Groups Tab"
    And I delete the Group named "<Group Name>" that is paired with the Account named with stored variable "New Account Name"

 ##Navigate to Account Tab and verify current Group Count
    And I click on "Account Tab"
    And I click on "Select Checkbox"
    And I store the value from element "Number of Groups" as "Updated Group Count for Account"

 ##Verify the Expected result : Group Count is now decremented from 3 to 2 for the account
    Then I expect "Updated Group Count for Account" to be 2 more than "Initial Group Count for Account"

 ##Cleanup steps in Users GRID
    And I click on "Users Tab"
    And I delete the User named with stored variable "New User Email" that is paired with the Account named with stored variable "New Account Name"

 ##Cleanup steps in Groups GRID
    And I click on "Groups Tab"
    And I delete the Group named "<Group Name>" that is paired with the Account named with stored variable "New Account Name"
    And I delete the Group named "<Group Name>" that is paired with the Account named with stored variable "New Account Name"

   ##Cleanup steps in Accounts GRID
    And I click on "Account Tab"
    And I delete the Campaign named with stored variable "New Account Name"

    Examples:

      | Valid EmailId     | Domain           | Account Name       | Parent Account Name | User Name  |User Email Id                |Group Name            |First Name|Last Name|Job Title|Account Name|Password   |DSP Login|DSP Password    |
      | qa@viralgains.com | https://ebay.com | AC for Group Count | QA_ViralGains       | QANoRW Perm|viralgainstestemail@gmail.com|Group for Group Count |Test_First|Test_Last|QA       |ViralGains  |mypassword | gdpr    |GDPR123         |


## Create User for a new account and validate the Incremented User count in Accounts Tab for the same Account

    Scenario Outline:
   ##Create New Account
    And I create New Account with user defined values "<Parent Account Name>", "<Account Name>", "<Valid EmailId>", "<Domain>", "Imagepic", "<DSP Login>" and "<DSP Password>"
    When I click on "Select Checkbox"

   ## Capture initial user count for the account
    And I store the value from element "Number of Users in Account Tab" as "Initial Users Count for Account"

   ##Create New User
    And I create a new user named "<User Name>" with email "<User Email Id>" under account named with stored variable "New Account Name"
    And I pause for 800ms for the database to update

   ##Email Invite Acceptance and provide User details
    And I receive an email to join "New Account Name" account
    And I click on the email link
    And I accept New User Invite and provide user defined values "<First Name>", "<Last Name>", "<Job Title>" and "<Password>"
    And I pause for 2000ms for the database to update

  ##Login as Admin
      Given I log into the site "ODC" as an admin
      And I select default account
      And I click on "Account Management"

   ##Navigate to Account Tab and store current User Count
    And I click on "Account Tab"
    And I click on "Select Checkbox"
    And I store the value from element "Number of Users in Account Tab" as "Updated Users Count for Account"

   ##Verify the Expected result : User Count incremented by 1 for the account
    Then I expect "Updated Users Count for Account" to be 1 more than "Initial Users Count for Account"

   ##Cleanup steps in Accounts GRID
    And I click on "Delete Button"
    And I click on "Delete Button in Delete Confirmation Pop-Up"




      Examples:

   | Valid EmailId     | Domain           | Account Name       | Parent Account Name | User Name  |User Email Id                |First Name|Last Name|Job Title|Account Name|Password   |DSP Login|DSP Password    |
   | qa@viralgains.com | https://ebay.com | AC for Group Count | QA_ViralGains       | QANoRW Perm|viralgainstestemail@gmail.com|Test_First|Test_Last|QA       |ViralGains  |mypassword | gdpr    |GDPR123         |


## Create 3 Users for a single Account and Validate the incremented User count in the account tab; now delete a User and check the decremented value
  ## in the account tab for the same account (Initial : 3 after deleting the User the count should be 2)

  Scenario Outline:
 ##Create New Account
    And I create New Account with user defined values "<Parent Account Name>", "<Account Name>", "<Valid EmailId>", "<Domain>", "Imagepic", "<DSP Login>" and "<DSP Password>"
    When I click on "Select Checkbox"

 ## Capture initial user count for the account
    And I store the value from element "Number of Users in Account Tab" as "Initial Users Count for Account"

 ##Create New User 1
    And I create a new user named "<User Name>" with email "<User Email Id>" under account named with stored variable "New Account Name"
    And I pause for 800ms for the database to update

 ##Email Invite Acceptance and provide User details
    And I receive an email to join "New Account Name" account
    And I click on the email link
    And I accept New User Invite and provide user defined values "<First Name>", "<Last Name>", "<Job Title>" and "<Password>"
    And I pause for 2000ms for the database to update

 ##Login as Admin
    Given I log into the site "ODC" as an admin
    And I select default account
    And I click on "Account Management"

 ##Create New User 2
    And I create a new user named "<User Name>" with email "<User Email Id>" under account named with stored variable "New Account Name"
    And I pause for 800ms for the database to update

 ##Email Invite Acceptance and provide User details
    And I receive an email to join "New Account Name" account
    And I click on the email link
    And I accept New User Invite and provide user defined values "<First Name>", "<Last Name>", "<Job Title>" and "<Password>"
    And I pause for 2000ms for the database to update

 ##Login as Admin
    Given I log into the site "ODC" as an admin
    And I select default account
    And I click on "Account Management"

 ##Create New User 3
    And I create a new user named "<User Name>" with email "<User Email Id>" under account named with stored variable "New Account Name"
    And I pause for 800ms for the database to update

 ##Email Invite Acceptance and provide User details
    And I receive an email to join "New Account Name" account
    And I click on the email link
    And I accept New User Invite and provide user defined values "<First Name>", "<Last Name>", "<Job Title>" and "<Password>"
    And I pause for 2000ms for the database to update

 ##Login as Admin
    Given I log into the site "ODC" as an admin
    And I select default account
    And I click on "Account Management"

 ##Navigate to Account Tab and store current User Count
    And I click on "Account Tab"
    And I click on "Select Checkbox"
    And I store the value from element "Number of Users in Account Tab" as "Updated Users Count for Account"

 ##Verify the Expected result : User Count incremented by 1 for the account
    Then I expect "Updated Users Count for Account" to be 3 more than "Initial Users Count for Account"

 ##Delete One User associated to the Account
    When I click on "Users Tab"
    And I click on "Select Checkbox"
    And I click on "Delete Button"
    And I click on "Delete Button in Delete Confirmation Pop-Up"

 ##Navigate to Account Tab and verify current USer Count
    And I click on "Account Tab"
    And I click on "Select Checkbox"
    And I store the value from element "Number of Users in Account Tab" as "Updated Users Count for Account"

 ##Verify the Expected result : USer is now decremented from 3 to 2 for the account
    Then I expect "Updated Users Count for Account" to be 2 more than "Initial Users Count for Account"

 ##Cleanup steps in Accounts GRID
    And I click on "Delete Button"
    And I click on "Delete Button in Delete Confirmation Pop-Up"


    Examples:

      | Valid EmailId     | Domain           | Account Name       | Parent Account Name | User Name  |User Email Id                |First Name|Last Name|Job Title|Account Name|Password   |DSP Login|DSP Password    |
      | qa@viralgains.com | https://ebay.com | AC for Group Count | QA_ViralGains       | QAUser Test|viralgainstestemail@gmail.com|Test_First|Test_Last|QA       |ViralGains  |mypassword | gdpr    |GDPR123         |


  ## Verify user is NOT able to delete the Parent Account that has sub-accounts

  Scenario Outline:
    ##Create Parent Account
    And I create New Account with user defined values "<Global Account Name>", "<Parent Account Name>", "<Valid EmailId>", "<Domain>", "Imagepic", "<DSP Login>" and "<DSP Password>"

    ##Create Child Account
    And I create New Account with user defined values "<Parent Account Name>", "<Child Account Name>", "<Valid EmailId>", "<Domain>", "Imagepic", "<DSP Login>" and "<DSP Password>"
    When I click on "2nd Select Checkbox"


   # Verify parent account is not deleted when sub accounts are associated to it
    And I click on "Delete Button"
    And I click on "Delete Button in Delete Confirmation Pop-Up"
   # To be implemented validated message : Parent Account shouldn't be deleted

   # Delete Child Account
    When I click on "Select Checkbox"
    And I click on "Delete Button"
    And I click on "Delete Button in Delete Confirmation Pop-Up"
    Then I expect that element "Existing Test Account" does not exist

   # Now Delete Parent Account as child account is deleted after the parent account error message is updated..
    When I click on "2nd Select Checkbox"
    And I click on "Delete Button"
    And I click on "Delete Button in Delete Confirmation Pop-Up"
   # Then I expect that element "Existing Test Account" does not exist (validate it after the parent account error message is updated..)

    Examples:
      |Valid EmailId     | Domain           |Parent Account Name| Child Account Name |Global Account Name|DSP Login|DSP Password    |
      |qa@viralgains.com | https://ebay.com |PA Account         | Child AC to PA     |QA_ViralGains      | gdpr    |GDPR123         |

  # ODC-569


#
#  # Verify to create a Account with the same name of a previously deleted Account
#  Scenario Outline:
#    Given I log into the site "ODC" as an admin
#    And I select default account
#    When I click on "Account Management"
#
#    And I create New Account with user defined values "<Parent Account Name>", "<Account Name>", "<Valid EmailId>", "<Domain>" and "Imagepic"
#    And I pause for 800ms for the database to update
#
#   ##Cleanup steps in Accounts GRID
#    And I click on "Account Tab"
#    And I click on "Select Checkbox"
#    And I click on "Delete Button"
#    And I click on "Delete Button in Delete Confirmation Pop-Up"
#
#   # Create another campaign with the previously deleted Campaign Name
#    And I click on "Account Management"
#    When I click on "New Account Button"
#
#    Then I expect that element "Modal Window" does exist
#    When I set "<Parent Account Name>" to "Parent Account Name"
#    And I click on "Parent Menu"
#    And I set stored value "New Account Name" to inputfield "Account Name"
#    And I click on "Status dropdown"
#    And I click on "Status Menu-Disable"
#    And I set "<Valid EmailId>" to "Contact Email"
#    And I click on "Industry dropdown"
#    And I click on "Industry Value"
#    And I set "<Domain>" to "Domain"
#    And I click on "TimeZone"
#    And I click on "TimeZone Value"
#    And I click on "DateTime Format"
#    And I click on "DateTime Value"
#    When I select file "Image.jpg" of type "jpg" for the element "Imagepic"
#    And I click on "Submit"
#    And I wait for "Account Management and Campaign Popup" to become not visible
#
#   ##Cleanup steps in Accounts GRID
#    And I click on "Account Tab"
#    And I click on "Select Checkbox"
#    And I click on "Delete Button"
#    And I click on "Delete Button in Delete Confirmation Pop-Up"
#
#    Examples:
#      | Valid EmailId     | Domain           | Account Name       | Parent Account Name | Account Name|
#      | qa@viralgains.com | https://ebay.com | AC for Group Count | QA_ViralGains       | ViralGains  |
#

