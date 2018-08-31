Feature: ODC-121

  Scenario: Testing that Report Name is a required field
    Given I am on the "report builder" page using the account "QA_ViralGains"

    When I click on "Report Name"
    And I click on "Campaign Report Column"

    Then I expect that element "Report Name Error" is visible

  Scenario Outline: Testing that duplicate report names are not allowed
    Given I have a report named "<reportName>" under Account "<AccountName>" with dimensions "<dimensions>" and metrics "<metrics>"
    And I am on the "report builder" page using the account "QA_ViralGains"

    When I set stored value "Newest Report Name" to the inputfield "Report Name"
    And I click on "Campaign Report Column"
    And I click on "Delivered Views Report Column"
    And I click on the "Run Type Dropdown"
    And I click on "On Demand" in the drop down
    And I click on "Save"

    Then I expect that element "Error Notification" is visible

    Examples:
      | reportName | AccountName   | dimensions| metrics                         |
      | AUTOMATION | QA_ViralGains | Campaign  | 25% Completion, Delivered Views |

  Scenario Outline: Testing Report Creation and Editing
    Given I have a report named "<reportName>" under Account "<AccountName>" with dimensions "<dimensions>" and metrics "<metrics>" and I am on the edit screen

    Then I expect the "Included Report Columns" to contain the ordered elements "Campaign, Delivered Views, Quartile Views(25% Completion)"

    #Update the Report, check that the change is saved
    When I click on "Delivered Views Report Column"
    And I click on "Save"
    And I edit the report named with stored variable "Newest Report Name" that is paired with the account named "QA_ViralGains"
    Then I expect the "Included Report Columns" to contain the ordered elements "Campaign, Quartile Views(25% Completion)"

    Examples:
      | reportName | AccountName   | dimensions| metrics                         |
      | AUTOMATION | QA_ViralGains | Campaign  | 25% Completion, Delivered Views |
