@Regression
Feature: ODC-34 Forgot Password and Reset


  Background: Open the Password Reset Page
    Given I have a user named "TestUser" with email "viralgainstestemail@gmail.com" and password "nerfguncup7" under account "QA_ViralGains"
    Given I open the url "/"
    And I click on "Forgot Password?"
    Then I expect to be on the "PasswordReset" page

# Password Reset success confirmation message
  Scenario Outline:
    When I set "<Valid EmailId>" to "Email"
    And I click on "Submit"
    Then I expect that element "Message" contains the text "An Email has been sent with instructions to reset the password"


    Examples:
      | Valid EmailId     |
      | qa@viralgains.com |


 #Password Reset Invalid format email and error message
  Scenario Outline:
    When I set "<InValid EmailId>" to "Email"
    And I click on "Submit"
    And I expect that element "Form Field Value Incorrect" contains the text "You have entered an invalid email address"


    Examples:
      | InValid EmailId     |
      | developerviralgains |


 #Password Reset : First Enter Invalid and enter Valid email id
  Scenario Outline:
    And I set "<InValid EmailId>" to "Email"
    And I click on "Submit"
    Then I expect that element "Form Field Value Incorrect" contains the text "You have entered an invalid email address"

    When I clear the inputfield "Email"
    And I set "<Valid EmailId>" to "Email"
    And I click on "Submit"
    Then I expect that element "Message" contains the text "An Email has been sent with instructions to reset the password"


    Examples:
      | InValid EmailId      | Valid EmailId     |
      | developer@viralgains | qa@viralgains.com |


## NOT REQUIRED SCENARIO FOR AUTOMATION TESTING
## Password Blank email Id and Validate error message
#  Scenario Outline:
#
#    Given I open the url "/"
#    And I click on "Forgot Password?"
#    Then I expect to be on the "PasswordReset" page
#    When I set "<BlankEmailId>" to "Email"
#    And I click on "Submit"
#
#    And I expect that element "Form Field Value Incorrect" contains the text "You have entered an invalid email address"
#
#
#    Examples:
#      | BlankEmailId |
#      |              |
 #Integration with CheckEmail Code - Reset Password Page Navigation
  Scenario Outline:
    And I set stored value "New User Email" to inputfield "User Email"
    And I click on "Submit"
    Then I expect that element "Message" contains the text "An Email has been sent with instructions to reset the password"

    When I receive an email to reset my password
    And I click on the email link
#   Then I expect to be on the "ChangePassword" page
    And I set "<Valid Password>" to "Password"
    And I set "<Valid Confirm Password>" to "Confirm Password"
    And I click on "Submit"
#    Then I expect that element "Message" contains the text "Password has been changed"
    #^^ commented this line as the message is displayed for only 2 seconds of time on the page

    Examples:
      | Valid Password | Valid Confirm Password |
      | nerfguncup7    | nerfguncup7            |



# Password Reset Page : Blank Values Validate Error message
  Scenario Outline:
    And I set stored value "New User Email" to inputfield "User Email"
    And I click on "Submit"
    Then I expect that element "Message" contains the text "An Email has been sent with instructions to reset the password"

    When I receive an email to reset my password
    And I click on the email link
#    Then I expect to be on the "ChangePassword" page
    And I set "<Blank Password>" to "Password"
    And I click on "Confirm Password"
    Then I expect that element "Password Field Value Message" contains the text "Required"

    When I set "<Blank Confirm Password>" to "Confirm Password"
    And I click on "Form"
    Then I expect that element "Confirm Password Field Value Message" contains the text "Required"


    Examples:
      | Blank Password | Blank Confirm Password |
      |                |                        |


# Password and Confirm Password don't Match Values : Validate Error message
  Scenario Outline:
    And I set stored value "New User Email" to inputfield "User Email"
    And I click on "Submit"
    Then I expect that element "Message" contains the text "An Email has been sent with instructions to reset the password"
    When I receive an email to reset my password
    And I click on the email link
#    Then I expect to be on the "ChangePassword" page
    And I set "<Password>" to "Password"
    And I click on "Confirm Password"
    And I set "<Different Confirm Password>" to "Confirm Password"
    And I click on "Form"
    Then I expect that element "Confirm Password Field Value Message" contains the text "The password and confirmation do not match"


    Examples:
      | Password   | Different Confirm Password |
      | mypassword | 8                          |


# Validate Error message : Password Less than 6 characters and Confirmation Password Required
  Scenario Outline:
    And I set stored value "New User Email" to inputfield "User Email"
    And I click on "Submit"
    Then I expect that element "Message" contains the text "An Email has been sent with instructions to reset the password"

    When I receive an email to reset my password
    And I click on the email link
#    Then I expect to be on the "ChangePassword" page
    And I set "<Invalid Length Password>" to "Password"
    And I click on "Confirm Password"
    Then I expect that element "Password Field Value Message" contains the text "Passwords must be a minimum of 6 characters"

    When I set "<Blank Confirm Password>" to "Confirm Password"
    And I click on "Form"
    Then I expect that element "Confirm Password Field Value Message" contains the text "Required"


    Examples:
      | Invalid Length Password | Blank Confirm Password |
      | 1234                    |                        |


 # Verify Reset link should be valid for only 24 hours amount time. When link is expired, message should display that link is expired
  Scenario Outline:
    Given I open an expired reset password email
    When I click on the email link
   #Then I expect to be on the "ChangePassword" page
   #Then I am on the Page "https://odc-ui.int.kube.viralgains.com/change-password/b4420ed9-ef69-4e8e-a36d-7f73412cdc52"
    And I set "<Valid Password>" to "Password"
    And I set "<Valid Confirm Password>" to "Confirm Password"
    And I click on "Submit"
    Then I expect that element "Message" contains the text "Reset link expired"


    Examples:
      | Valid Password | Valid Confirm Password |
      | 1234567        | 1234567                |


# Login Link Navigation Verification
  Scenario:
    And I click on "BacktoLogin"
    And I expect to be on the "ODCLogin" page


# Validation of maximum character limit (more than 1024 characters) for Password and Confirm Password field
  Scenario Outline:
    And I set stored value "New User Email" to inputfield "User Email"
    And I click on "Submit"
    Then I expect that element "Message" contains the text "An Email has been sent with instructions to reset the password"
    And I receive an email to reset my password

    When I click on the email link
    And I set "<Greater Than Max 1024 Characters>" to "Password"
    And I click on "Confirm Password"
    Then I expect that element "Password Field Value Message" contains the text "Password must be less than 1024 characters"

    When I set "<1024 Max Characters>" to "Password"
    And I set "<Greater Than Max 1024 Characters>" to "Confirm Password"
    And I click on "Submit"
    Then I expect that element "Confirm Password Field Value Message" contains the text "The password and confirmation do not match"


    Examples:
      | 1024 Max Characters                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | Greater Than Max 1024 Characters                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      | 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters Valid Test | 1025 Greater than Max Characters  1025 Greater than Max Characters  1025 Greater than Max Characters  1025 Greater than Max Characters  1025 Greater than Max Characters  1025 Greater than Max Characters  1025 Greater than Max Characters  1025 Greater than Max Characters  1025 Greater than Max Characters  1025 Greater than Max Characters  1025 Greater than Max Characters  1025 Greater than Max Characters  1025 Greater than Max Characters  1025 Greater than Max Characters  1025 Greater than Max Characters  1025 Greater than Max Characters  1025 Greater than Max Characters  1025 Greater than Max Characters  1025 Greater than Max Characters  1025 Greater than Max Characters  1025 Greater than Max Characters  1025 Greater than Max Characters  1025 Greater than Max Characters  1025 Greater than Max Characters  1025 Greater than Max Characters  1025 Greater than Max Characters  1025 Greater than Max Characters  1025 Greater than Max Characters  1025 Greater than Max Characters  1025 Greater than Max Characters Limitt 1025 Greater than Max Characters Limitt |


# Validation of successful Reset with 1024 characters (TO-DO : Combine few steps frm logging-in till receive email)
  Scenario Outline:
    And I set stored value "New User Email" to inputfield "User Email"
    And I click on "Submit"
    Then I expect that element "Message" contains the text "An Email has been sent with instructions to reset the password"
    And I receive an email to reset my password

    When I click on the email link
    And I set "<1024 Max Characters>" to "Password"
    And I set "<1024 Max Characters>" to "Confirm Password"
    And I click on "Submit"
    And I pause for 20000ms
    # Then I expect that element "Message" contains the text  "Password has been changed"
    Then I expect that the url is "https://odc-ui.int.kube.viralgains.com/"


    Examples:
      | 1024 Max Characters                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters 1024 Max Valid Characters Valid Test |
