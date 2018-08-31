Feature: This tests that variables are being stored and compared correctly

  Scenario: Testing Variable storage
    When I set stored value "firstEmail" to "X"
    And I set stored value "secondEmail" to "X"
    And I set stored value "perfCount" to "5"
    And I set stored value "updatedPerfCount" to "7"
    Then I expect "perfCount" to be 2 less than "updatedPerfCount"
    And I expect "updatedPerfCount" to be 2 more than "perfCount"
    And I expect the string values "firstEmail" and "secondEmail" to be equal
