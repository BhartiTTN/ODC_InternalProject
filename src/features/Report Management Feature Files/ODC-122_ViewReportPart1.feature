Feature: ODC-122


  Scenario: Testing View Report and Copy Report Buttons
    Given I have a report named "xx" under Account "QA_ViralGains" with dimensions "Creative, Campaign" and metrics "25% Completion, Delivered Views"
    And I am on the "report management" page using the account "QA_ViralGains"

    When I copy the report named with stored variable "Newest Report Name" that is paired with the account named "QA_ViralGains"

    Then I expect that inputfield "Report Name" contains the stored value "Newest Report Name"
    And I expect the "Included Report Columns" to contain the ordered elements "Campaign, Delivered Views, Quartile Views(25% Completion)"

    When I click on "Cancel"

    And I view the report named with stored variable "Newest Report Name" that is paired with the account named "QA_ViralGains"
    Then I expect to be on the "ReportViewer" page

  Scenario Outline: Clicking on the "Edit Report" button should lead to the report builder screen
    Given I have a report named "<reportName>" under Account "<AccountName>" with dimensions "<dimensions>" and metrics "<metrics>" and I am on the view report screen

    When I click on "Edit Report"

    Then I expect to be on the "ReportBuilder" page
    And I expect that inputfield "Report Name" does equal stored value "Newest Report Name"

    Examples:
      | reportName | AccountName   | dimensions| metrics                         |
      | New Report | QA_ViralGains | Campaign  | 25% Completion, Delivered Views |


  Scenario Outline: Testing Report Download
    Given I have a report named "<reportName>" under Account "<AccountName>" with dimensions "<dimensions>" and metrics "<metrics>" and I am on the view report screen

    When I click on "Download Report"
    Then I expect that the csv file named with stored variable "Newest Report Name" was downloaded

    #TODO: Delete downloaded files

    Examples:
      | reportName | AccountName   | dimensions| metrics                         |
      | New Report | QA_ViralGains | Campaign  | 25% Completion, Delivered Views |
