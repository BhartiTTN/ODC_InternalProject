Feature: Testing api setup and tear Down

  Scenario Outline: Some examples of how to use
    Given I have a Campaign named "New Campaign" under Account "QA_ViralGains"

    #The below assumes you have already created new User Email stored with values newEmail1, newEmail2
    And I have a Group named "New Group" under Account "QA_ViralGains" with user emails "newEmail1,newEmail2" and permissions "<permissions>"

    Examples:
      |permissions                                           |
      |CAMPAIGN_WRITE,CAMPAIGN_READ,REPORT_WRITE,ACCOUNT_READ|
