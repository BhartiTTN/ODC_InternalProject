Feature: ODC-350 User Invitation Expiration/Resend

 #Testing Resend expires old email, and that new invite works like it should (test decline accept etc)
 #Testing decline works (error when trying to use link after declining, resend button and DECLINE statuses exist after declining invite.
  Scenario Outline:
    Given I log into the site "ODC" as an admin
    And I select default account
    When I click on "Account Management"
    When I click on "Users Tab"
    And I click on "New User Button"
    And I click on "Parent dropdown"
    And I set "<Account Name>" to "Group Account Name"
    And I click on "<Account Name>" in the "Parent Account" drop down
    And I set "<User Name>" to "User Name"
    When I set "<User Email Id>" to the inputfield appended with current Date_Time "User Email Id"
    Then I store the value from inputfield "User Email Id" as "user email"
    And I click on "Invite"
    Then I expect that element "Resend Button in row #1" does exist
    Then I expect that element "Status in row #1" contains the text "INVITED"
    When I click on "Resend Button in row #1"
    Given I open the expired account invitation email for account "QA_ViralGains"
    When I click on the email link
    And I accept the alertbox
    #TODO: CHECK THAT ERROR BOX IS THERE. Can't use expired invite

    Given I receive an email to join "<Account Name>" account
    When I click on the email link
    And I click on "Deny Invite"
    And I click on "Public account"
    When I click on "Account Management"
    When I click on "Users Tab"
    Then I expect that element "Status in row #1" contains the text "DECLINED"
    And I expect that element "Resend Button in row #1" does exist
     And I delete the User named with stored variable "user email" that is paired with the Account named "<Account Name>"
    When I click on the email link
    #TODO: CHECK THAT ERROR BOX IS THERE. Can't use declined invite

    Examples:
      | Account Name    | User Email Id                 | User Name    |
      | QA_ViralGains   | viralgainstestemail@gmail.com | QA-userTest  |


    #Testing accepting invites works
  Scenario Outline:
    #Inviting User
    Given I log into the site "ODC" as an admin
    And I select default account
    When I click on "Account Management"
    When I click on "Users Tab"
    And I click on "New User Button"
    And I click on "Parent dropdown"
    And I set "<Account Name>" to "Group Account Name"
    And I click on "<Account Name>" in the "Parent Account" drop down
    And I set "<User Name>" to "User Name"
    And I set "<User Email Id>" to "User Email Id"
    When I set "<User Email Id>" to the inputfield appended with current Date_Time "User Email Id"
    Then I store the value from inputfield "User Email Id" as "user email"
    And I click on "Invite"

    #Can accept invites even after declining
    When I receive an email to join "<Account Name>" account
    When I click on the email link
    And I click on "Deny Invite"
    And I click on "Public account"
    When I click on "Account Management"
    When I click on "Users Tab"
    Then I expect that element "Status in row #1" contains the text "DECLINED"
    When I click on "Resend Button in row #1"
    When I receive an email to join "<Account Name>" account
    And I click on the email link
    And I click on "Accept Invite"
    When I set "<First Name>" to "First Name"
    When I set "<Last Name>" to "Last Name"
    When I set "<Job Title>" to "Job Title"
    When I set "<Valid Password>" to "Password"
    And I click on "Save"
    When I pause for 2000ms for the database to update

    Given I log into the site "ODC" as an admin
    And I select default account
    When I click on "Account Management"
    When I click on "Users Tab"
    #^Gives time for table to refresh and text to change to DISABLED
    Then I expect that element "Status in row #1" contains the text "ENABLED"
    Then I expect that element "Resend Button in row #1" does not exist
    And I delete the newly added row in the Grid

    Examples:
      | Valid Password | Account Name    | User Email Id                 | User Name    |First Name|Last Name|
      | mypassword     | QA_ViralGains   | viralgainstestemail@gmail.com | QA-UserTest  |Test_First|Test_Last|
