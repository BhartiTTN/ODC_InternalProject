Feature: Testing Installation

  Scenario Outline: Simple canvas test example
    Given I have a Campaign named "<Campaign Name>" under Account "<accountName>"
    And that Campaign has a Creative Node named "<Creative Name>"
    And That "Creative" node is updated to be named "<Creative Name>", and have x position "300" and y position "300"
    And I am on the canvas screen for the newly created campaign

    When I move "Start Node" by x offset 300 and y offset 0
    And I move "Line Item 1" by x offset 300 and y offset 150
    And I create an edge from the bottom port of "Line Item 1" and connect it to the top port of "<Creative Name>"
    And I click on the "delivery button"

    Then I expect the "Delivery Connected Elements List" to contain the ordered elements "Stored Value: Newest Campaign Name, Line Item 1, Creative 1"

    Examples:
    |accountName  | Campaign Name          | Creative Name|
    |QA_ViralGains|Getting Started Campaign| Creative 1   |


  Scenario Outline: Clicking on the "Edit Report" button should lead to the report builder screen
    Given I have a report named "<reportName>" under Account "<accountName>" with dimensions "<dimensions>" and metrics "<metrics>" and I am on the view report screen

    When I click on "Edit Report"

    Then I expect to be on the "Report Builder" page
    And I expect that inputfield "Report Name" does equal stored value "Newest Report Name"

    Examples:
      | reportName | accountName   | dimensions         | metrics                         |
      | New Report | QA_ViralGains | Creative, Campaign | 25% Completion, Delivered Views |
