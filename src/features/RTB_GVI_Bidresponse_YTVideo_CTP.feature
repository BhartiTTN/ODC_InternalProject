Feature: GoogleVastInspector_RTBBidresponse_YoutubeVideo- CTP

  Scenario Outline:

    Given I open the url "https://developers.google.com/interactive-media-ads/docs/sdks/html5/vastinspector"
    When I click on "Vast Xml Radio Button" on the "GoogleFrame"
    And I set "<VastXmlCTP>" to the inputfield "Google Vast Inspector Vast XML Inputfield"
    And I click on "Test Ad Button"
    And I scroll to element "Vast Inspector Video"
    And I pause for 2000ms
    When I click on "button.ytp-large-play-button.ytp-button" on the "YouTubeGVVideo"
    And I pause for 2000ms
    When I open the perf rtb site "RTBWin"
    And I log into the site with email "<EmailId>" and password "<Password>"
    And I pause for 2000ms
    Then I expect that table element "Druid RTBWin AdUnitId Table" contains element with text "8a80813c5e0fe52b015e1061e0d9002f"
    Then I store that element "Table:nth-of-type(9) tbody tr td" text "8a80813c5e0fe52b015e1061e0d9002f"
    And I pause for 2000ms

    Examples:
      |VastXmlCTP                                                      | EmailId               | Password  |
      |<VAST version='2.0'>  <Ad id='8a80813c5e0fe52b015e1061e0d9002f'>    <InLine>      <AdSystem>https://perf-wasabi.viralgains.com</AdSystem>      <AdTitle>test</AdTitle><Impression><![CDATA[https://perfplayer.viralgains.com/vga/capture/index?auctionBidID=02994590-fd64-4839-be7d-2e66647f32c5&auctionPrice=0.4&auctionSeatID=${AUCTION_SEAT_ID}&auctionCurrency=USD&auctionAdID=${AUCTION_AD_ID}&auctionImpID=${AUCTION_IMP_ID}&auctionID=${AUCTION_ID}&type=RTBWinEvent&ed=CwjXQyCYMREPnww85FsZE%2FhsUWuCXGLGKpF1NUW%2B7%2BE5rh70r1cdeCPGZVaUUV7qG2n6BEI63Hjg2yzWugPT%2FeaGMZfTbG3Qp3QAoLRvJPyNH%2B1OOmNEFALVIMKYpU1HtQLJFHwqqEOc0RABg1F3NynegYdhc8W7kMIdfzymP1q7ZjK%2BWJgmC8jPSK2%2BMkb3e9O1SWNa2PEldyJBPPAZdDfEJc2ydtYpBsxLRiLXhbl9N20BE4H97ofjIhEURKFWxKYp9tqlp7G51Sz8qVDKeykH3oM%2BcOyQlSNzPIs6KtjRMg7pMEJOMSEZWpVzTT%2FZ0w7lpN12YMlgO6uIF4TN6GE2OET3mBgLz9zFlAqH7jUc7CIzLFiJT13yBlEaeDEA]]></Impression>      <Creatives>        <Creative>          <Linear>            <Duration>00:01:44</Duration>            <AdParameters><![CDATA[<Root><CampaignId>8a80813c5e0fe52b015e1061e0d9002f</CampaignId><Ed>XvLWWe04e9laPd6WsOpQZpE6L0DTxthCKBVHCuvFvdiTzUmSrMsGqc7Qt9/NE414YZdiYDQPYoDEuBUXQvOOzK5nbFnOZmzbMWmVnFKorNH+fviaMSQPhlUJ74jggeRFGRnWY90rbOa4kuANQrC3i/8MDVfVG4I45zPFGBisKwwhTSFVi2dyOFf1G4+lz1RbECsXSelOYNac7IoG63Z/pBI7sAcz1561cXU6jNjFco+zYtJzWy+NkYPg7P+NkQo3A0V5CwJS3wmOe1cg4kO5VJs6IWfzQFkwE+K8YvVpTzfVVF9MeS9C5JHGyc0Nhf7EcwSePVdFI0znf/dWEzAfFJXh0inTBTBKVzTASvIWJRh6OuMDy0VcgamYnB68P+UjpuWRsxNCDVyk+i8fiqkmirHC8IWDCkrj3NaO5BjX6qh2bWDMvV+OJzGtLmYsw51P/YQM7iJcavYIbb8PZ6/EeiqmEEowYy9ueweHA8hyXyRyAVY8G+CaMPS+eJDc559+cO09lJN9iwt0h0YsyjgaWvdIDGj7pmlA1nSooBs0ayU=</Ed><ServerUrl>https://perf-wasabi.viralgains.com</ServerUrl><AnalyticsUrl>https://perfplayer.viralgains.com/vga</AnalyticsUrl><legacyJsUrl>https://d2gk9nivmtl2c9.cloudfront.net/vg/static/qUcMsEPtoaX6MoJrwIdPyAF4kiMa8o0n31okZVnGFWl.js</legacyJsUrl><ovvbSWF>https://d2gk9nivmtl2c9.cloudfront.net/vg/static/hmSpAPbRaM6xNaqC37wdTC3hi3EaGG0ioqfqvrN9fuf.swf</ovvbSWF><cdnUrl>https://d2gk9nivmtl2c9.cloudfront.net/vg</cdnUrl><durationSeconds>104</durationSeconds><campaignName>test</campaignName><vendorId>bdf5485f-4bd5-4b90-b572-9e6090784c4b</vendorId><organizationId>677c9e86-2021-4fed-9ef5-c34375e90357</organizationId><enableDVV>false</enableDVV><doubleVerifyTag/>&lt;APS&gt;&lt;rtbDomain&gt;www.thebootandjetstream.com&lt;/rtbDomain&gt;&lt;rtbAuctionPrice&gt;${AUCTION_PRICE}&lt;/rtbAuctionPrice&gt;&lt;/APS&gt;&lt;Autoplay&gt;True&lt;/Autoplay&gt;</Root>]]></AdParameters>            <MediaFiles>              <MediaFile type='application/javascript' bitrate='300' width='600' height='400' delivery='progressive' apiFramework='VPAID'>https://d2gk9nivmtl2c9.cloudfront.net/vg/static/qUcMsEPtoaX6MoJrwIdPyAF4kiMa8o0n31okZVnGFWl.js</MediaFile>            </MediaFiles>          </Linear>        </Creative>      </Creatives>    </InLine>  </Ad></VAST>|hkodey@viralgains.com|sairam1.1|
