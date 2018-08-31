Feature: ODC-535, ODC-536 Campaign Grid Optimistic Locking

  Scenario Outline: User B tries to save a change to a creative after User A has on creative grid.
  Testing that User B sees a save conflict error.
    Given I have a Campaign named "QA_ViralGainsCampaign" under Account "QA_ViralGains"
    And that Campaign has a Creative Node named "<Creative Name>"
    And I am on the "creatives" tab of the "campaigns" page using the account "QA_ViralGains"
    When I edit the Creative named "<Creative Name>"

    And I click on "Video Type"
    And I click on "Video Type YT_URL"
    And I set "<Video URL>" to "Video URL"

    And "browserA" clicks on "Save"
    And I pause for 4000ms to let browserAs changes go through
    And "browserB" clicks on "Save"
    Then I expect that "browserB" sees the error message "<Error Message>"

    Examples:
      | Creative Name | Video URL                                   | Error Message                                                                 |
      | Creative 1    | https://www.youtube.com/watch?v=89bLt90xfV0 | A newer version of the same entity is available in the database,please reload |

  Scenario Outline: User B tries to save a change to a campaign after User A has on the campaign grid
  Testing that User B sees a save conflict error.
    Given I have a Campaign named "QA_ViralGainsCampaign" under Account "QA_ViralGains"
    And I am on the "campaigns" tab of the "campaigns" page using the account "QA_ViralGains"
    When I edit the Campaign named with stored variable "Newest Campaign Name"

    And I add "1234" to the inputfield "Campaign Name"
    And "browserA" clicks on "Save"
    And I pause for 4000ms to let browserAs changes go through
    And "browserB" clicks on "Save"
    Then I expect that "browserB" sees the error message "<Error Message>"

    Examples:
      | Error Message                                                                 |
      | A newer version of the same entity is available in the database,please reload |
