Feature: ODC-513 Tracking Box (Node) creation

Background: Create and Open a new Campaign
  And I have a Campaign named "AutoCampaignName" under Account "QA_ViralGains" and I am on the canvas screen


# Verify the default position and multiple Tracking icons that appear on the canvas UI that many times user clicks on Tracking Icon.

  Scenario:
    Then I expect that element "Campaign Name Banner" does equal stored value "Newest Campaign Name"
    And I expect that element "Creative Graph" does exist
    And I expect that element "Create Tracking Icon" does exist

      # Targeting 1
    When I click on "Create Tracking Icon"
    Then I expect that element "Tracking 1" does exist
    And I expect that element "Tracking 2" does not exist
    Then I expect that the css attribute "transform" of element "Tracking in the Graph" is "matrix(1, 0, 0, 1, 100, 30)"
    When I move "Tracking 1" by x offset 230 and y offset 230

    # Targeting 2
    When I click on "Create Tracking Icon"
    Then I expect that element "Tracking 2" does exist
    And I pause for 400ms
    When I move "Tracking 2" by x offset 330 and y offset 170

    # Targeting 3
    When I click on "Create Tracking Icon"
    Then I expect that element "Tracking 3" does exist


# Verify the doubleClick on the Tracking Icon and then On Tracking Box Opens the Creative Modal Window

  Scenario:
   # Creative 1 - doublClick option verification
    When I doubleClick on "Create Tracking Icon"
    Then I expect that element "Tracking 1" does exist

   # When I mousehover on element "Tracking_more_Icon"
   # Then I expect that element "Tracking_more_Icon" does exist
