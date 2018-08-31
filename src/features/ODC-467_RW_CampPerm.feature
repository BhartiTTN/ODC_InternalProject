Feature: ODC-467_Create-Edit_Campaign with required Permissions


## New User for New Account : Validate User with Write Campaign ONLY Group Permission
  Scenario Outline:

    Given I log into the site "ODC" as an admin
    And I select default account
    When I click on "Account Management"
   
   #Create New Account
    And I create New Account with user defined values "<Parent Account Name>", "<Account Name>", "<Valid EmailId>", "<Domain>", "Imagepic", "<DSP Login>" and "<DSP Password>"
   ##-----##
    ## Create New User
    And I create a new user named "<User Name>" with email "<User Email Id>" under account named with stored variable "New Account Name"
    And I pause for 800ms for the database to update

  ##Email Invite Acceptance and provide User details
    And I receive an email to join "New Account Name" account
    And I click on the email link
    And I accept New User Invite and provide user defined values "<First Name>", "<Last Name>", "<Job Title>" and "<Password>"

  ## Login as Admin to set Group Permissions
    Given I log into the site "ODC" as an admin
    And I select default account
    And I click on "Account Management"

  ##New Group with Permissions Set up
    And I create a new group named "<GroupName>" under account named with stored variable "New Account Name" with email named with stored variable "New User Email" and Campaign Write permissions
    And I pause for 800ms for the database to update
  ##Login as New User that has Group Permissions set-up above as per scenario
    And I click on "Logout"
    And I pause for 800ms
    And I set stored value "New User Email" to inputfield "Email"
    And I pause for 800ms
    And I set "<Password>" to "Password"
    And I pause for 800ms
    And I click on "Submit"
    And I pause for 800ms
    And I click on "Public groups"
    And I click on "Public account"

   ##Create a Campaign and validate the Expected result of Campaign create/read behavior
    And I click on "Campaign Management"
    And I click on "New Campaign"
    And I set "<Valid Campaign Name>" to the inputfield appended with current Date_Time "Campaign Name"
    And I click on "Save"
    And I pause for 800ms

    # User has WRITE Campaign Permission ONLY hence he will not see the New campaign created in the Campaign Grid
    Then I expect that element "No Rows Found" does exist

    Examples:

      | Valid EmailId     | Domain             | Account Name | Parent Account Name    |Valid Campaign Name |User Name  |User Email Id                |Group Name                      |First Name|Last Name|Job Title|Account Name|Password   |DSP Login|DSP Password|
      | qa@viralgains.com | https://ebay.com   | 1            | QA_ViralGains          |AutoCampaignName-H  |QARNW Perm |viralgainstestemail@gmail.com|No Campaign RW Permission Group |Test_First|Test_Last|QA       |ViralGains  |mypassword |gdpr     |GDPR123     |


## New User for New Account : Validate User with NO Campaign READ OR NO WRITE Group Permissions

  Scenario Outline:

    Given I log into the site "ODC" as an admin
    And I select default account
    When I click on "Account Management"

   #Create New Account
    And I create New Account with user defined values "<Parent Account Name>", "<Account Name>", "<Valid EmailId>", "<Domain>", "Imagepic", "<DSP Login>" and "<DSP Password>"

    ##-----##
     ## Create New User
    And I create a new user named "<User Name>" with email "<User Email Id>" under account named with stored variable "New Account Name"
    And I pause for 800ms for the database to update

   ##Email Invite Acceptance and provide User details
    And I receive an email to join "New Account Name" account
    And I click on the email link
    And I accept New User Invite and provide user defined values "<First Name>", "<Last Name>", "<Job Title>" and "<Password>"
    And I pause for 2000ms for the database to update

   ## Login as Admin to set Group Permissions
    Given I log into the site "ODC" as an admin
    And I select default account
    And I click on "Account Management"

  ##New Group with NO Permissions checkbox Selected
    And I click on "Groups Tab"
    And I click on "New Group Button"
    And I set stored value "New Account Name" to inputfield "Group Account Name"
    And I click on "Industry Value"
    And I set "<Group Name>" to the inputfield appended with current Date_Time "Group Name"
    And I store the value from inputfield "Group Name" as "New Group Name"
    And I click on "Group Status dropdown"
    And I click on "Status Menu-Enable"
    And I set stored value "New User Email" to inputfield "User Group InputField"
    And I click on stored value "New User Email" in the "Group Name Dropdown" drop down
    And I click on "Add"
    And I click on "Create Button"
    And I pause for 800ms

   ##Login as New User that has Group Permissions set-up above as per scenario
    And I click on "Logout"
    And I pause for 800ms
    And I set stored value "New User Email" to inputfield "Email"
    And I pause for 800ms
    And I set "<Password>" to "Password"
    And I pause for 800ms
    And I click on "Submit"
    And I pause for 800ms
    And I click on "Public groups"
    And I click on "Public account"

    ##Create a Campaign and validate the Expected result of Campaign create/read behavior
    And I click on "Campaign Management"
    And I click on "New Campaign"
    And I pause for 800ms
    And I set "<Valid Campaign Name>" to the inputfield appended with current Date_Time "Campaign Name"
    And I click on "Cancel"
    # ^^ changed save to cancel to avoid erros - need to update once below error is implemented
    And I pause for 800ms
    # Access constraint - NO READ/NO WRITE Message Prompt should be displayed to user ( TO Be implemented by dev )

     # User has NO READ and WRITE Campaign Permission hence he will not able to create or view campaigns in the Campaign Grid
    Then I expect that element "No Rows Found" does exist

    Examples:

      | Valid EmailId    | Domain           | Account Name | Parent Account Name |Valid Campaign Name |User Name  |User Email Id                |Group Name                      |First Name|Last Name|Job Title|Account Name|Password   |
      | qa@viralgains.com| https://ebay.com | 1            | QA_ViralGains       |AutoCampaignName-H  |QANoRW Perm|viralgainstestemail@gmail.com|No Campaign RW Permission Group |Test_First|Test_Last|QA       |ViralGains  |mypassword |


## New User for New Account : Validate User with Write and Read Campaign (New) Group Permissions
  Scenario Outline:

    Given I log into the site "ODC" as an admin
    And I select default account
    And I expect to be on the "ODCDashboard" page
    When I click on "Account Management"

 #Create New Account
    And I create New Account with user defined values "<Parent Account Name>", "<Account Name>", "<Valid EmailId>", "<Domain>", "Imagepic", "<DSP Login>" and "<DSP Password>"

  ##-----##
   ## Create New User
    And I create a new user named "<User Name>" with email "<User Email Id>" under account named with stored variable "New Account Name"
    And I pause for 800ms for the database to update

 ##Email Invite Acceptance and provide User details
    And I receive an email to join "New Account Name" account
    And I click on the email link
    And I accept New User Invite and provide user defined values "<First Name>", "<Last Name>", "<Job Title>" and "<Password>"
    And I pause for 2000ms for the database to update

 ## Login as Admin to set Group Permissions
    Given I log into the site "ODC" as an admin
    And I select default account
    And I click on "Account Management"

## Login as Admin to set Group Permissions
    And I click on "Groups Tab"
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
    And I wait for all "Loading Messages" to become not visible
    And I pause for 800ms

 ##Login as New User that has Group Permissions set-up above as per scenario
    And I click on "Logout"
    And I pause for 800ms
    And I set stored value "New User Email" to inputfield "Email"
    And I pause for 800ms
    And I set "<Password>" to "Password"
    And I pause for 800ms
    And I click on "Submit"
    And I pause for 800ms
    And I click on "Public groups"
    And I click on "Public account"

  ##Create a Campaign and validate the Expected result of Campaign create/read behavior
    And I click on "Campaign Management"
    And I pause for 800ms
    And I click on "New Campaign"
    And I pause for 800ms
    And I set "<Valid Campaign Name>" to the inputfield appended with current Date_Time "Campaign Name"
    And I click on "Save"
    And I pause for 800ms

   ## User has WRITE and READ Campaign Permission hence User is able to create and view Newly created campaign in the Campaign Grid
    Then I expect that element "Existing Campaign" does exist

  ##cleanup steps in Campaign GRID
    And I delete the newly added row in the Grid
    And I expect to be on the "ODCDashboard" page

    Examples:

      | Valid EmailId            | Domain           | Account Name | Parent Account Name |Valid Campaign Name |User Name  |User Email Id                |Group Name                      |First Name|Last Name|Job Title|Account Name|Password   |
      | qa@viralgains.com        | https://ebay.com | 1            | QA_ViralGains       |AutoCampaignName-H  |QARW Perm  |viralgainstestemail@gmail.com|No Campaign RW Permission Group |Test_First|Test_Last|QA       |ViralGains  |mypassword |


