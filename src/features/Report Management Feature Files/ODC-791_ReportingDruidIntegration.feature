Feature: ODC-791

  Background: Create a new Report
    Given I have a report named "xx" under Account "QA_ViralGains" with dimensions "Campaign" and metrics "Completed Views, Delivered Views" and I am on the view report screen
    And I click on "Generate Latest Data"

  Scenario Outline:
    And I wait for the report to generate
    And I store the value from element "CampaignID in row #1" as "Current Campaign ID"
    And I store the value from element "CompletedViews in row #1" as "completed views in report"
    And I store the value from element "DeliveredViews in row #1" as "delivered views in report"

    And I open the perf rtb site "PlayerEvent" for the newest campaign
    And I log into the site with email "<EmailId>" and password "<Password>"

    Then I expect that element "Druid PlayerEvent Done" does equal stored value "completed views in report"
    And  I expect that element "Druid PlayerEvent Counts as View" does equal stored value "delivered views in report"

  Examples:
  | EmailId               |Password |
  | hkodey@viralgains.com |sairam1.1|
