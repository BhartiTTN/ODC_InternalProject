@Regression
Feature: ODC-45 Login Validation


# Login Success

  Scenario: Login Success

    Given I log into the site "ODC" as an admin
    # Then  I expect that the url is "https://odc-ui.int.kube.viralgains.com/dashboard"
    Then I expect to be on the "ODCDashboard" page
    # And I expect that element "Profile Role" contains the text "Profile of ROLE_DEVELOPER" (Phase 2)



# Not Valid Email Id that is present in the system

  Scenario Outline: Not Valid Email Id that is present in the system

    Given I open the url "/"
    And I set "<NotValidEmailId>" to "Email"
    And I click on "Password"
    And I expect that element "Form Field Value Incorrect" contains the text "You have entered an invalid email address"


    Examples:
      | NotValidEmailId       |
      | qa@viralgains.com1235 |


# Valid Email Id (Email Id in caps) that is present in the system
  Scenario Outline: Valid Email Id (Email Id in caps) that is present in the system

    Given I open the url "/"
    And I set "<Valid EmailId in Caps>" to "Email"
    And I click on "Password"
    And I set "<Valid Password>" to "Password"
    And I click on "Login"
    Then I expect to be on the "ODCDashboard" page


    Examples:
      | Valid EmailId in Caps | Valid Password |
      | QA@VIRALGAINS.COM     | mypassword     |





# Not Valid Password that is present in the system
  Scenario Outline: Not Valid Password that is present in the system

    Given I open the url "/"
    And I set "<Valid EmailId>" to "Email"
    And I click on "Password"
    And I set "<InValid Password>" to "Password"
    And I click on "Login"
    Then I expect that element "Message" contains the text "Your email or password is not valid"


    Examples:
      | Valid EmailId     | InValid Password |
      | qa@viralgains.com | 1234             |


# Blank Email Id Validation
  Scenario Outline: Blank Email Id Validation

    Given I open the url "/"
    And I set "<Blank EmailId>" to "Email"
    And I click on "Password"
    Then I expect that element "Form Field Value Incorrect" contains the text "Required"
    And I set "<Valid Password>" to "Password"
    And I click on "Login"



    Examples:
      | Blank EmailId | Valid Password |
      |               | mypassword     |


# Blank Password  Validation
  Scenario Outline: Blank Password  Validation

    Given I open the url "/"
    And I set "<Valid EmailId>" to "Email"
    And I click on "Password"
    And I set "<Blank Password>" to "Password"
    And I click on "Login"
    Then I expect that element "Form Field Value Incorrect" contains the text "Required"

    Examples:
      | Valid EmailId     | Blank Password |
      | qa@viralgains.com |                |


#Login and Logout End to End
  Scenario: Login and Logout End to End

    Given I log into the site "ODC" as an admin

    When I click on "Logout"
    Then I expect to be on the "ODCLogin" page
    And I expect that element "Message" contains the text "You have successfully been logged out"



# Incorrect Password format (less than 6 characters )Validation

  Scenario Outline: Incorrect Password format (less than 6 characters )Validation

    Given I open the url "/"
    And I set "<Existing EmailId>" to "Email"
    And I set "<Wrong length Password>" to "Password"
    And I click on "Submit"
    Then I expect that element "Message" contains the text "Your email or password is not valid"



    Examples:
      | Existing EmailId  | Wrong length Password |
      | qa@viralgains.com | mypass                |


# Incorrect format of the Email Id
  Scenario Outline: Incorrect format of the Email Id

    Given I open the url "/"
    And I set "<Incorrect EmailId>" to "Email"
    And I click on "Password"
    And I set "<Password>" to "Password"
    Then I expect that element "Form Field Value Incorrect" contains the text "You have entered an invalid email address"


    Examples:
      | Incorrect EmailId |
      | developer         |


#ODC-142:
  # Not Valid Email Id that is present in the system
  Scenario Outline: Not Valid Email Id that is present in the system

    Given I open the url "https://odc-ui.int.kube.viralgains.com/dashboard/accounts"
    Then I expect that element "Message" contains the text "Not logged in"

    When I set "<Valid EmailId>" to "Email"
    And I click on "Password"
    And I set "<Password>" to "Password"
    Then I expect to be on the "ODCDashboard" page

    Examples:
      | Valid EmailId     | Password   |
      | qa@viralgains.com | mypassword |


 #ODC 650

  # Remember me Field validation

  Scenario Outline: Remember me Field validation

    Given I open the url "https://odc-ui.int.kube.viralgains.com/dashboard/accounts"
    And I click on "Remember me"
    And I set "<Valid EmailId>" to "Email"
    And I click on "Password"
    And I set "<Password>" to "Password"
    And I click on "Submit"

    Examples:
      | Valid EmailId     | Password   |
      | qa@viralgains.com | mypassword |

    #Task for 30th Aug 2018
  @Accept
  Scenario: To verify that QA_ViralGains is working or not

    Given I open the url "/"
    And I set "qa@viralgains.com" to "Email"
    And I click on "Password"
    And I set "mypassword" to "Password"
    And I click on "Login"
    Then I expect to be on the "ODCDashboard" page

    And I pause for 1000ms
    Then I expect to be on the "ODCDashboard" page
    And I expect that element "QA_ViralGains" does exist
    And I pause for 4000ms
    And I click on "QA_ViralGains"
    Then I expect to be on the "Campaigns" page


    #Task to create new Campaign

    When I click on "New Campaign"
    Then I expect that element "Campaign Create Label" does exist
    When I set "DemoTest" to the inputfield appended with current Date_Time "Campaign Name"
    And I store the value from inputfield "Campaign Name" as "New Campaign Name"
    And I click on "Save"
    Then I expect that element "Existing Campaign" does exist
    And I click on "Select Checkbox"
    Then I expect that element "Delete Button" does exist
    And I expect that element "Cancel Button" does exist


    And I click on "Select Checkbox"
    And I delete the Campaign named with stored variable "New Campaign Name"


