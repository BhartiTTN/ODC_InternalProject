Feature: ODC-537 Delivery Optimistic Locking

  Scenario Outline: User B tries to save a change to a delivery after User A has, and without refreshing the canvas.
  Testing that User B sees a save conflict error.
    Given I have a Campaign named "QA_ViralGainsCampaign" under Account "QA_ViralGains"
    And Both users are on the canvas screen for the newly created campaign

    When I click on the "delivery button"
    And I click on the "Campaign Pause Button"
    And "browserA" clicks on "Save"
    And I pause for 4000ms to let browserAs changes go through
    And "browserB" clicks on "Save"

    Then I expect that "browserB" sees the error message "<Error Message>"

    Examples:
      |Error Message                                                                 |
      |A newer version of the same entity is available in the database,please reload|
