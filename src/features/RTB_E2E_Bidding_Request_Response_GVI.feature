Feature: RTB Bid Response Test - End to End

  Scenario Outline:

    When I make a bid request with configuration "bidResponseData"
    Then I expect a bid

    Given I open the url "https://developers.google.com/interactive-media-ads/docs/sdks/html5/vastinspector"
    And I switch to the frame "GoogleFrame"
    When I click on "Google Vast Inspector Vast XML Radio"
   # And I set stored value "Initial Creative Vast Tag Url" to inputfield "Google Vast Inspector Vast XML Inputfield"
    When I set the vast url from the bid response to the inputfield "Google Vast Inspector Vast XML Inputfield"
    And I pause for 2000ms
    And I click on "Test Ad Button"
    And I pause for 2000ms
    And I scroll to element "Vast Inspector Video"
   # And I click on "Video Play Button" on the "YouTubeGVVideo"
    And I expect that element "Video Play Button" is not visible
    And I pause for 9000ms


    When I open the perf rtb site "RTBBid"
    And I log into the site with email "<EmailId>" and password "<Password>"
    And I pause for 10000ms
    Then I store adID "Druid RTBBid AdUnitId Table" in RTB druid



  Examples:
  | EmailId               |Password|
  | hkodey@viralgains.com |sairam1.1|
