Feature: Simple Screenshot Test

  Scenario:
    Given I open the url "https://qa2.viralgains.com/vg/"
    Then I expect the screenshot of element ".box-content form" to match the reference screenshot "login box"
