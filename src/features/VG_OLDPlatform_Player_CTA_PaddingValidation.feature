Feature: Player_UI_CTA_PaddingValidation Test

  Scenario:
    Given I open the url "https://qa3.viralgains.com/vg/s/8a8081cf5923600901594739ea3b03fd#1"
    Then I expect that the title is "World War Z - Official Trailer (HD)"
    When I click on player's button "span.close-btn" on the "engagement card"
    Then I expect that the css attribute "line-height" from element "div[class='cta-headline']" is "14.4px"
    And I pause for 50000ms
