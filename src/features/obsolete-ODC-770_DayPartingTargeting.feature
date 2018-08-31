Feature: ODC-770 Testing Day Parting

  Background: I am editing the Day Parting section of a  targeting node in a new Campaign
    Given I have a Campaign named "AutoCampaignName" under Account "QA_ViralGains"
    And that Campaign has a Targeting Node named "Targeting 1"
    And That "Targeting" node is updated to be named "Targeting 1", and have x position "300" and y position "300"
    And I am on the canvas screen for the newly created campaign
    And I open the targeting node
    When I click on the "Targeting Type Dropdown"
    When I click on "Day Parting" in the drop down


    Scenario: Testing Defaults
      Then I expect the "Day Options" to contain the ordered elements "Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday"

      And I expect that checkbox "Sunday Checkbox" is checked
      And I expect that checkbox "Monday Checkbox" is checked
      And I expect that checkbox "Tuesday Checkbox" is checked
      And I expect that checkbox "Wednesday Checkbox" is checked
      And I expect that checkbox "Thursday Checkbox" is checked
      And I expect that checkbox "Friday Checkbox" is checked
      And I expect that checkbox "Saturday Checkbox" is checked

      And I expect that the background color of element "Sunday" is "Day Parting Blue"
      And I expect that the background color of element "Monday" is "Day Parting Blue"
      And I expect that the background color of element "Tuesday" is "Day Parting Blue"
      And I expect that the background color of element "Wednesday" is "Day Parting Blue"
      And I expect that the background color of element "Thursday" is "Day Parting Blue"
      And I expect that the background color of element "Friday" is "Day Parting Blue"
      And I expect that the background color of element "Saturday" is "Day Parting Blue"


    Scenario Outline:
      When I click on "Tuesday"
      And I click on "Wednesday"
      And I click on "Thursday"
      And I click on "Friday"
      And I click on "Saturday"

      When I set "<Start Time>" to "First Day Parting Start Input"
      When I set "<End Time>" to "First Day Parting End Input"
      And I click on "close timepicker"

      And I click on the "Add Targeting button"
      And I click on "Save"
      And I open the targeting node

      Then I expect the "Included Targetings" to contain the ordered elements "<Expected Day Targeting>" with delimiter ";"

      Examples:
        |Start Time| End Time|Expected Day Targeting                          |
        |01:01 PM  | 01:02 PM|Sun 01:01 PM - 01:02 PM, Mon 01:01 PM - 01:02 PM|


    Scenario Outline: Invalid times should show "Required" message
      When I set "<Invalid Time>" to "First Day Parting Start Input"
      Then I expect that element "Field Error Validation" contains the text "Required"
      When I set "<Start Time>" to "First Day Parting Start Input"

      When I set "<Invalid Time>" to "First Day Parting End Input"
      Then I expect that element "Field Error Validation" contains the text "Required"

      When I click on "close timepicker"
      Then I expect that element "Add Targeting button" is not enabled

      Examples:
        |Start Time| Invalid Time|
        |01:01 PM  | 99:99 PM    |


  Scenario Outline: Start time must come before end time
    When I set "<End Time>" to "First Day Parting Start Input"
    And I set "<Start Time>" to "First Day Parting End Input"
    And I click on "close timepicker"

    Then I expect that element "Field Error Validation" contains the text "End time should be greater than start time"
    And I expect that element "Add Targeting button" is not enabled

    Examples:
      |Start Time| End Time|
      |01:01 PM  | 01:02 PM|


  Scenario Outline: Time overlaps are not allowed
    When I set "<First Start Time>" to "First Day Parting Start Input"
    And I set "<First End Time>" to "First Day Parting End Input"
    And I click on "close timepicker"
    And I click on "Add More Time Ranges"
    And I set "<Second Start Time>" to "Second Day Parting Start Input"
    And I set "<Second End Time>" to "Second Day Parting End Input"
    And I click on "close timepicker"

    Then I expect that element "Field Error Validation" contains the text "Time Range overlap for one or more time frames."
    And I expect that element "Add Targeting button" is not enabled

    Examples:
      |First Start Time| First End Time| Second Start Time| Second End Time|
      |12:00 PM        | 2:00 PM       | 1:00 PM          | 5:00 PM        |


  Scenario Outline: Adding Multiple Time Ranges
    When I set "<First Start Time>" to "First Day Parting Start Input"
    And I set "<First End Time>" to "First Day Parting End Input"
    And I click on "close timepicker"
    And I click on "Add More Time Ranges"
    And I set "<Second Start Time>" to "Second Day Parting Start Input"
    And I set "<Second End Time>" to "Second Day Parting End Input"
    And I click on "close timepicker"

    And I click on the "Add Targeting button"
    And I click on "Save"
    And I open the targeting node

    Then I expect the "Included Targetings" to contain the ordered elements "<Expected Day Targeting>" with delimiter ";"

    Examples:
      |First Start Time| First End Time| Second Start Time| Second End Time|Expected Day Targeting                                                                                                                                                                                                                                                                                                          |
      |05:05 AM        | 10:00 AM      | 01:01 PM         | 01:02 PM       |Sun 05:05 AM - 10:00 AM, 01:01 PM - 01:02 PM, Mon 05:05 AM - 10:00 AM, 01:01 PM - 01:02 PM, Tue 05:05 AM - 10:00 AM, 01:01 PM - 01:02 PM, Wed 05:05 AM - 10:00 AM, 01:01 PM - 01:02 PM, Thu 05:05 AM - 10:00 AM, 01:01 PM - 01:02 PM, Fri 05:05 AM - 10:00 AM, 01:01 PM - 01:02 PM, Sat 05:05 AM - 10:00 AM, 01:01 PM - 01:02 PM|


  Scenario Outline: Shouldn't be able to delete a time range if there is only one
    When I set "<Start Time>" to "First Day Parting Start Input"
    And I set "<End Time>" to "First Day Parting End Input"
    And I click on "close timepicker"

    Then I expect that element "Remove Time Range" is not visible

    Examples:
      | Start Time| End Time |
      |05:05 AM   | 10:00 AM |


  Scenario Outline: Deleting Time Ranges
    When I set "<First Start Time>" to "First Day Parting Start Input"
    And I set "<First End Time>" to "First Day Parting End Input"
    And I click on "close timepicker"

    And I click on "Add More Time Ranges"
    And I set "<Second Start Time>" to "Second Day Parting Start Input"
    And I set "<Second End Time>" to "Second Day Parting End Input"
    And I click on "close timepicker"
    And I click on "Remove Time Range"

    And I click on the "Add Targeting button"
    And I click on "Save"
    And I open the targeting node

    Then I expect the "Included Targetings" to contain the ordered elements "<Expected Day Targeting>" with delimiter ";"

    Examples:
      |First Start Time| First End Time| Second Start Time| Second End Time|Expected Day Targeting                                                                                                                                                                                                                                                                                                          |
      |05:05 AM        | 10:00 AM      | 01:01 PM         | 01:02 PM       |Sun 01:01 PM - 01:02 PM, Mon 01:01 PM - 01:02 PM, Tue 01:01 PM - 01:02 PM, Wed 01:01 PM - 01:02 PM, Thu 01:01 PM - 01:02 PM, Fri 01:01 PM - 01:02 PM, Sat 01:01 PM - 01:02 PM|

