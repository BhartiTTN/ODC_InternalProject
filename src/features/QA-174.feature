Feature: QA-174 Automate Relish Player Test
  Example feature file shares ad on Twitter, and Facebook
  Logs onto Gmail and opens up the link
  opens the link in a new tab
  Clicks on the Pinterest share button


  ##Temporarily broken. Have to Create mappings for the "click on element"s
#  Scenario:
#    Given I log into the site "Facebook"
#    And I log into the site "QA3"
#    And I open the url "https://qa3.viralgains.com/vg/campaign/video?campaignId=8a8081cf5e32ceb1015e339a67400016"
#    When I click on player's element ".share-button-icon-icon" on the "player"
#    When I click on ".fa-facebook"
#    And I focus the last opened window
#    And I click on "#u_0_1v"
#    And I pause for Demo
#
#  Scenario:
#    Given I focus the last opened window
#    Given I log into the site "Twitter"
#    And I log into the site "QA3"
#    And I open the url "https://qa3.viralgains.com/vg/campaign/video?campaignId=8a8081cf5e32ceb1015e339a67400016"
#    When I click on player's element ".share-button-icon-icon" on the "player"
#    When I click on ".fa-twitter"
#    #^Using the bare selectors for now. I plan on refactoring clickElement and clickKnownElement.
#    And I focus the last opened tab
#    And I click on ".button.submit"
#    And I pause for Demo
#
#  Scenario:
#    Given I focus the last opened window
#    Given I log into the site "Gmail"
#    And I log into the site "QA3"
#    And I open the url "https://qa3.viralgains.com/vg/campaign/video?campaignId=8a8081cf5e32ceb1015e339a67400016"
#    When I click on player's element ".share-button-icon-icon" on the "player"
#    When I click on ".fa-envelope"
#    When I click on "#email-option-Gmail"
#    And I pause for Demo
#
#  Scenario:
#    Given I focus the last opened window
#    Given I log into the site "QA3"
#    And I open the url "https://qa3.viralgains.com/vg/campaign/video?campaignId=8a8081cf5e32ceb1015e339a67400016"
#    When I click on player's element ".share-button-icon-icon" on the "player"
#    When I click on ".share-button-copyandpasteshareurl"
#    And I copy the attribute "value" from element ".radius5" and open the url in a new tab
#    And I pause for Demo
#
#  Scenario:
#    Given I focus the last opened window
#    Given I log into the site "QA3"
#    And I open the url "https://qa3.viralgains.com/vg/campaign/video?campaignId=8a8081cf5e32ceb1015e339a67400016"
#    When I click on player's element ".share-button-icon-icon" on the "player"
#    When I click on ".fa-pinterest"
#    And I pause for Demo
