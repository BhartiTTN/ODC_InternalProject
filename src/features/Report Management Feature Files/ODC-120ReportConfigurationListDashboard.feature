Feature: ODC-120


  Background: I am on the Report Management screen
    Given I am on the "report management" page using the account "QA_ViralGains"


  Scenario: Testing List Columns
    Then I expect that table element "List Element" contains element with text "Report Name"
    And I expect that table element "List Element" contains element with text "Account"
    And I expect that table element "List Element" contains element with text "Status"
    And I expect that table element "List Element" contains element with text "Type"
    And I expect that table element "List Element" contains element with text "Generated Date & Time"
    When I click on "First Report Checkbox"
    Then I expect that element "Reports Bulk Delete Button" does exist
    And I expect that element "Reports Bulk Cancel Button" does exist


  Scenario: Verify New Report Button functionality
    When I click on "New Report"
    Then I expect to be on the "ReportBuilder" page


  Scenario: New Report Creation and Report List Validation
    When I create a new report named "TestListColumns" with dimensions "Campaign" metrics "25% Completion, Delivered Views" and run type "On Demand"
    Then I expect that table element "List Element" contains element with text "Report Name"
    When I click on "First Report Checkbox"
    Then I expect that element "Report created has Name" does equal stored value "New Report Name"
    And I expect that element "Reports Bulk Delete Button" does exist
    And I expect that element "Reports Bulk Cancel Button" does exist


  Scenario Outline: Filter for Report Name validation
    When I select Filter Criteria "<Criteria>"
    And I enter Filter Criteria Parameter "<Parameter>"
    And I click on "Apply Button"
    Then I expect that element "Filter Result" contains the text "<Criteria>: <Parameter>"
    And I expect that the Grid element "<Column>" does contain the text "<Parameter>"

    Examples:

      |Criteria    |Parameter  |Column            |
      |Name        |Test       |Report Name Column|


  Scenario Outline: Filter for Account validation
    When I select Filter Criteria "<Criteria>"
    And I select Filter Criteria Parameter "<Parameter>"
    And I click on "Apply Button"
    Then I expect that element "Filter Result" contains the text "<Criteria>: <Parameter>"
    And I expect that the Grid element "<Column>" does contain the text "<Parameter>"

    Examples:

      |Criteria    |Parameter     |Column                               |
      |Account     |QA_ViralGains |Report Management Account Name Column|



  Scenario Outline: Filter with all Status(es)
    When I select Filter Criteria "<Criteria>"
    And I select Filter Criteria Parameter "<Parameter>"
    And I click on "Apply Button"
    Then I expect that element "Filter Result" contains the text "<Criteria>: <Parameter>"
  #  And I expect that the Grid element "<Column>" does contain the text "<Parameter>"

    Examples:

      |Criteria              |Parameter       |Column       |
      |Run Type / Status     |COMPLETED       |Status Column|
    # Add all other status when we get data



  Scenario Outline: Filter the Users Tab with Multiple criteria Report Name and Status
    When I select Filter Criteria "<Criteria1>"
    And I select Filter Criteria Parameter "<Parameter1>"
    And I click on "Apply Button"
    And I select Filter Criteria "<Criteria2>"
    And I enter Filter Criteria Parameter "<Parameter2>"
    And I click on "Apply Button"
    Then I expect that element "Filter Result" contains the text "<Criteria1>: <Parameter1>"
    And I expect that element "Filter Result" contains the text "<Criteria2>: <Parameter2>"
  #  And I expect that the Grid element "<Column1>" does contain the text "<Parameter1>"
    And I expect that the Grid element "<Column2>" does contain the text "<Parameter2>"

    Examples:

      |Criteria1          |Parameter1       |Criteria2  | Parameter2  |Column1          |Column2            |
      |Run Type / Status  |COMPLETED        |Name       | Test        |Status Column    |Report Name Column |


  Scenario: # Verify the Ascending Order of Report Name
    When I click on "Sort By Report Name"
    Then I expect that "Report Name Column" is sorted Ascending
    Then I expect that element "Ascending" does exist


  Scenario Outline: Filter with Report type (all values)

    When I select Filter Criteria "<Criteria>"
    And I select Filter Criteria Parameter "<Parameter>"
    And I click on "Apply Button"
    Then I expect that element "Filter Result" contains the text "<Criteria>: <Parameter>"
    And I expect that the Grid element "<Column>" does contain the text "<Parameter>"

    Examples:

      |Criteria        |Parameter              |Column            |
#      |Report Type     |Vertical Benchmark    |Report Type Column|
#      |Report Type     |Vendor Monthly Stats  |Report Type Column|
#      |Report Type     |Campaign Performance  |Report Type Column|
#      |Report Type     |Revenue               |Report Type Column|
#      |Report Type     |Publisher Tracking    |Report Type Column|
      |Report Type     |Custom                 |Report Type Column|

