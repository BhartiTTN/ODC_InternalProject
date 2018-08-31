Feature: GoogleVastInspector_RTBBidresponse_VastVideo - Autoplay


  Scenario Outline:

    Given I open the url "https://developers.google.com/interactive-media-ads/docs/sdks/html5/vastinspector"
    When I click on "Vast Xml Radio Button" on the "GoogleFrame"
    And I set "<VastXml>" to the inputfield "vastUrlInputField"
    And I pause for 2000ms
    And I click on "Test Ad Button"
    And I scroll to element "Vast Inspector Video"
    And I pause for 2000ms
    And I pause for 2000ms
    When I open the perf rtb site "RTBBid"
    And I log into the site with email "<EmailId>" and password "<Password>"
    And I pause for 2000ms
    #Then I expect that element "Table:nth-of-type(9) tbody tr:nth-of-type(2) td:nth-of-type(1)" matches the text "8a80813c5a47f6c3015a487f59c00099"
    Then I expect that table element "Druid RTBBid AdUnitId Table" contains element with text "8a80813c5a47f6c3015a487f59c00099"


    Examples:
      |VastXml                                                      | EmailId               | Password  |
      |<VAST version='2.0'>  <Ad id='8a80813c5a47f6c3015a487f59c00099'>    <InLine>      <AdSystem>https://perf-wasabi.viralgains.com</AdSystem>      <AdTitle>QAtesthariniadunit</AdTitle><Impression><![CDATA[https://perfplayer.viralgains.com/vga/capture/index?auctionBidID=cbeb80aa-5a0c-4a84-b246-675b9a0c077a&auctionPrice=0.1&auctionSeatID=${AUCTION_SEAT_ID}&auctionCurrency=USD&auctionAdID=${AUCTION_AD_ID}&auctionImpID=${AUCTION_IMP_ID}&auctionID=${AUCTION_ID}&type=RTBWinEvent&ed=CwjXQyCYMREPnww85FsZE%2FhsUWuCXGLGKpF1NUW%2B7%2BHy2Dh337VY7QpMyymvMZw%2FgAItb7ynn2tpFCiDZnpAXvJ3OyH0FHk5%2FkDecs2VtzLUvNJV%2BMmDzDqO%2FK0ZZj%2BFECfByNMh3EPRZU0T0d2uBkmmEP8%2BeQ6RIrPVTUWNmb%2BKZufL05ukRBBBDyIIoRdgAMplt9FI%2Fux%2BpcsuVBe6SIESrafCGQhjsO%2FtaApgPNLbHEqIEPLe2M4WGBskLYWxureaF2%2FibInIvrFX4IuimpqAoX3SwwrR4A1gRURHOHTdHGHIqJgcBUdKK%2BPiMz8wdobPHnT2O1L%2B5kXW2x%2Bbl97wv4RN324MXEgakB%2F1%2BdNyhPvkSwTqDvILGq9aMby2Dm0rEQK6Vt4k0JwGZQ5FXMy7CNJJhHr6SKXdW%2FIn3VE%3D]]></Impression>      <Creatives>        <Creative>          <Linear>            <Duration>00:00:15</Duration>            <AdParameters><![CDATA[<Root><CampaignId>8a80813c5a47f6c3015a487f59c00099</CampaignId><Ed>XvLWWe04e9laPd6WsOpQZpE6L0DTxthCKBVHCuvFvdiTzUmSrMsGqc7Qt9/NE414YZdiYDQPYoDEuBUXQvOOzK5nbFnOZmzbMWmVnFKorNH+fviaMSQPhlUJ74jggeRFGRnWY90rbOa4kuANQrC3i7nJi/BTYXnvJmXdFRGMK05niPJDoqNlUw1k8eOB9N+qkVOdG2Lvy4vdSJAEiziTFgqYAiZelNlocddNqvzdmg+EcYNKFMJGzr9UzsRVp/dJ+8SGiGpLU/TWQIvIvCStOEaDpR3dj7dISMrZOxXl/boL97I3nuqNdNN2uvsJIcAuDm0rEQK6Vt4k0JwGZQ5FXNlNIjBg7R+mzeIa/hwc/c5/emUs/lnOt5srWTwne6DN3RxhyKiYHAVHSivj4jM/ME/tE2Iap5iPhFaZvtKNiUAcv+4cmK0Nocdy6ADJtZT8q3w5zYOO9uds7felmuQwIG6q09hh17llPRSVgCHBzu/9hAzuIlxq9ghtvw9nr8R6KqYQSjBjL257B4cDyHJfJHIBVjwb4Jow9L54kNznn35w7T2Uk32LC3SHRizKOBpa90gMaPumaUDWdKigGzRrJQ==</Ed><ServerUrl>https://perf-wasabi.viralgains.com</ServerUrl><AnalyticsUrl>https://perfplayer.viralgains.com/vga</AnalyticsUrl><legacyJsUrl>https://d2gk9nivmtl2c9.cloudfront.net/vg/static/qUcMsEPtoaX6MoJrwIdPyAF4kiMa8o0n31okZVnGFWl.js</legacyJsUrl><ovvbSWF>https://d2gk9nivmtl2c9.cloudfront.net/vg/static/hmSpAPbRaM6xNaqC37wdTC3hi3EaGG0ioqfqvrN9fuf.swf</ovvbSWF><cdnUrl>https://d2gk9nivmtl2c9.cloudfront.net/vg</cdnUrl><durationSeconds>15</durationSeconds><campaignName>QAtest_harini_adunit</campaignName><vendorId>bdf5485f-4bd5-4b90-b572-9e6090784c4b</vendorId><organizationId>7d3d479a-ef5c-47d9-a43e-6672380eafa4</organizationId><enableDVV>true</enableDVV><doubleVerifyTag>//cdn.doubleverify.com/dvvid_src.js?ctx=818052&amp;cmp=3545302&amp;sid=viralgains&amp;crt=8a80813c5a47f6c3015a487f59c00099&amp;plc=jstest&amp;adsrv=0&amp;tagformat=2&amp;tagtype=video&amp;dvtagver=6.1.src</doubleVerifyTag>&lt;APS&gt;&lt;rtbDomain&gt;www.thebootandjetstream.com&lt;/rtbDomain&gt;&lt;rtbAuctionPrice&gt;${AUCTION_PRICE}&lt;/rtbAuctionPrice&gt;&lt;/APS&gt;&lt;Autoplay&gt;True&lt;/Autoplay&gt;</Root>]]></AdParameters>            <MediaFiles>              <MediaFile type='application/javascript' bitrate='300' width='600' height='400' delivery='progressive' apiFramework='VPAID'>https://d2gk9nivmtl2c9.cloudfront.net/vg/static/qUcMsEPtoaX6MoJrwIdPyAF4kiMa8o0n31okZVnGFWl.js</MediaFile>            </MediaFiles>          </Linear>        </Creative>      </Creatives>    </InLine>  </Ad></VAST> | hkodey@viralgains.com | sairam1.1 |
