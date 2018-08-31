Feature: GoogleVastInspector_RTB_WIN_Count_Validation


  Scenario:

    When I make a bid request with configuration "bidResponseData"
    Then I expect a bid
    And I open the url "https://qa2.viralgains.com/rtb/util"

    And I store the value from element "actual views for the adUnit from the bid response" as "initial delivered views"

    Given I open the url "https://developers.google.com/interactive-media-ads/docs/sdks/html5/vastinspector"
    And I switch to the frame "GoogleFrame"
    When I click on "Google Vast Inspector Vast XML Radio"
    When I set the updated vast url from the bid response to the inputfield "Google Vast Inspector Vast XML Inputfield"
    And I pause for 2000ms
    And I click on "Test Ad Button"
    And I scroll to element "Vast Inspector Video"
   # And I click on "Video Play Button" on the "YouTubeGVVideo"
    Then I expect that the Grid element "Google Vast Inspector Events" does contain the text "Ad event: start"
    And I let the video play long enough to trigger a delivered view

    And I open the url "https://qa2.viralgains.com/rtb/util"
    And I store the value from element "actual views for the adUnit from the bid response" as "updated delivered views"
    Then I expect "updated delivered views" to be 1 more than "initial delivered views"



