Feature: ODC-535, ODC-536 Campaign Canvas Optimistic Locking

  Background: Two users are are on the same canvas page for a Campaign with a Creative
    Given I have a Campaign named "QA_ViralGainsCampaign" under Account "QA_ViralGains"
    And that Campaign has a Creative Node named "Creative 1"
    And That "Creative" node is updated to be named "Creative 1", and have x position "300" and y position "300"
    And Both users are on the canvas screen for the newly created campaign


  Scenario Outline: User B tries to save a change to a creative after User A has, and without refreshing the canvas.
  Testing that User B sees a save conflict error.
    When I mousehover on element "Creative_more_Icon"
    And I mousehover on element "Creative__controlsCover"
    And I click on "Creative__editIcon"

    And I click on "Video Type"
    And I click on "Video Type YT_URL"
    And I set "<Video URL>" to "Video URL"
    And "browserA" clicks on "Save"
    And I pause for 4000ms to let browserAs changes go through
    And "browserB" clicks on "Save"

    Then I expect that "browserB" sees the error message "<Error Message>"

    Examples:
      | Video URL                                   | Error Message                                                                 |
      | https://www.youtube.com/watch?v=89bLt90xfV0 | A newer version of the same entity is available in the database,please reload |

