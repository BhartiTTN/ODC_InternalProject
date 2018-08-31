Feature: ODC-121 Testing Report Permissions

  Scenario Outline: Test a user with no permissions sees no reports
  Given I am logged in to the email account "<noPermissionsEmail>"
  And I have a user named "<UserName>" with email "<noPermissionsEmail>" and password "<password>" under account "<AccountName>"
  And I have a Group named "no permissions" under Account "<AccountName>" with stored user emails "New User Email" and permissions ""

  And  I log into the site "ODC" with stored userName "New User Email" and password "<password>"
  And I select default account
  And I click on "Report Management"

  Then I expect that element "No Rows Found" does exist
  And I expect that element "Error Notification" is visible
    #^Test for no read permissions

  When I click on "Dismiss Error Notification"
  And I create a new report named "AUTOMATION" with dimensions "Campaign" metrics "25% Completion, Delivered Views" and run type "On Demand"
  Then I expect that element "Error Notification" is visible
    #^Test for no write permissions

  Examples:
  |AccountName  |UserName       |noPermissionsEmail                   |password  |
  |QA_ViralGains|New Report User|viralGainsTestNoPermissions@gmail.com|mypassword|


  Scenario Outline: Test a user with Read Permissions sees reports but cannot create any
    Given I am logged in to the email account "<readPermissionsEmail>"
    And I have a user named "<UserName>" with email "<readPermissionsEmail>" and password "<password>" under account "<AccountName>"
    And I have a Group named "read permissions" under Account "<AccountName>" with stored user emails "New User Email" and permissions "REPORT_READ"

    And  I log into the site "ODC" with stored userName "New User Email" and password "<password>"
    And I select default account
    And I click on "Report Management"

    Then I expect that element "No Rows Found" does not exist
    And I expect that element "Error Notification" is not visible
  #^Test for read permissions

    And I create a new report named "AUTOMATION" with dimensions "Campaign" metrics "25% Completion, Delivered Views" and run type "On Demand"
    Then I expect that element "Error Notification" is visible
  #^Test for no write permissions

    Examples:
      |AccountName  |UserName       |readPermissionsEmail                  |password  |
      |QA_ViralGains|New Report User|ViralGainsTestReadPermission@gmail.com|mypassword|


  Scenario Outline: Test a user with Write Permissions write reports but not see any
    Given I am logged in to the email account "<writePermissionsEmail>"
    And I have a user named "<UserName>" with email "<writePermissionsEmail>" and password "<password>" under account "<AccountName>"
    And I have a Group named "write permissions" under Account "<AccountName>" with stored user emails "New User Email" and permissions "REPORT_WRITE"

    And  I log into the site "ODC" with stored userName "New User Email" and password "<password>"
    And I select default account
    And I click on "Report Management"

    Then I expect that element "No Rows Found" does exist
    And I expect that element "Error Notification" is visible
    #^Test for not read permissions

    When I click on "Dismiss Error Notification"
    And I create a new report named "AUTOMATION" with dimensions "Campaign" metrics "25% Completion, Delivered Views" and run type "On Demand"
    Then I expect that element "No Rows Found" does exist
#^Test for write permissions

    Examples:
      |AccountName  |UserName       |writePermissionsEmail                   |password  |
      |QA_ViralGains|New Report User|ViralGainsTestWritePermissions@gmail.com|mypassword|

  Scenario Outline: Test a user with Read and Write Permissions can both see and create reports
    Given I am logged in to the email account "<readWritePermissionsEmail>"
    And I have a user named "<UserName>" with email "<readWritePermissionsEmail>" and password "<password>" under account "<AccountName>"
    And I have a Group named "read write permissions" under Account "<AccountName>" with stored user emails "New User Email" and permissions "REPORT_READ,REPORT_WRITE"

    And  I log into the site "ODC" with stored userName "New User Email" and password "<password>"
    And I select default account
    And I click on "Report Management"

    Then I expect that element "No Rows Found" does not exist
    And I expect that element "Error Notification" is not visible
    #^Test for read permissions

    And I create a new report named "AUTOMATION" with dimensions "Campaign" metrics "25% Completion, Delivered Views" and run type "On Demand"
    Then I expect that element "Error Notification" is not visible
#^Test for write permissions

    Examples:
      |AccountName  |UserName       |readWritePermissionsEmail    |password  |
      |QA_ViralGains|New Report User|ViralGainsTestEmail@gmail.com|mypassword|
