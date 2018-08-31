Feature: Testing for NODE_NOT_IN_CAMPAIGN error message

  Background: There is a new Campaign with a Creative
    Given I have a Campaign named "QA_ViralGainsCampaign" under Account "QA_ViralGains"
    And that Campaign has a Creative Node named "Creative 1"
    And That "Creative" node is updated to be named "Creative 1", and have x position "300" and y position "300"

  Scenario Outline: On the Campaign Canvas: User B tries to save a change to a creative after User A has deleted it.
  Testing that User B sees a save conflict error.
    And Both users are on the canvas screen for the newly created campaign
    When I mousehover on element "Creative_more_Icon"
    And I mousehover on element "Creative__controlsCover"

      #browserA deletes the creative
    And "browserA" clicks on "Creative__deleteIcon"
    And "browserA" clicks on "Delete Button in Delete pop-up"

      #browserB tries to save a change to the deleted creative
    And "browserB" clicks on "Creative__editIcon"
    And "browserB" clicks on "Video Type"
    And "browserB" clicks on "Video Type YT_URL"
    And "browserB" sets "<Video URL>" to "Video URL"
    And "browserB" clicks on "Save"

    Then I expect that "browserB" sees the error message "<Error Message>"

    Examples:
      | Video URL                                   | Error Message               |
      | https://www.youtube.com/watch?v=89bLt90xfV0 | Node is not in the campaign |

  Scenario Outline: On the Creative tab of the Campaign Grid: User B tries to save a change to a creative after User A has deleted it.
  Testing that User B sees a save conflict error.
    And I am on the "creatives" tab of the "campaigns" page using the account "QA_ViralGains"
    When I edit the Creative named "<Creative Name>"
    And "browserA" clicks on "Close"

    And "browserB" clicks on "Video Type"
    And "browserB" clicks on "Video Type YT_URL"
    And "browserB" sets "<Video URL>" to "Video URL"

    And "browserA" clicks on the "Delete Button"
    And "browserA" clicks on "Delete Button in Delete Confirmation Pop-Up"
    And I pause for 4000ms to let browserAs changes go through
    And "browserB" clicks on "Save"
    Then I expect that "browserB" sees the error message "<Error Message>"

    Examples:
      | Creative Name | Video URL                                   | Error Message               |
      | Creative 1    | https://www.youtube.com/watch?v=89bLt90xfV0 | Node is not in the campaign |


