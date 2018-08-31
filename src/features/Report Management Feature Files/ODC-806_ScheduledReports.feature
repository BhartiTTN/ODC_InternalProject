Feature: ODC-806

  Background: I have a scheduled report and am on the report management screen
    Given I am on the "report management" page using the account "QA_ViralGains"
    And I create a new report named "AUTOMATION" with dimensions "Campaign" metrics "25% Completion, Delivered Views" and run type "Scheduled"

  Scenario Outline:
    And I view the report named with stored variable "New Report Name" that is paired with the account named "QA_ViralGains"
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
