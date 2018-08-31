Feature: Simple Video Test

  Scenario:
    Given I open the url "https://qa3.viralgains.com/vg/s/8a8081cf5923600901594739ea3b03fd#1"
    Then I expect that the title is "World War Z - Official Trailer (HD)"

    When I click on player's button "span.close-btn" on the "engagement card"

    And I click on player's button "body" on the "YouTube Video"
    #Then Video Plays
    And I pause for 6000ms

#
#    When I click on player's <"PauseIcon">
#
#    When I click on link <"SocialShareExpandArrow">
#
#    Then <"FacebookIcon"> is visible
#
#    And <"TwitterIcon"> is visible
