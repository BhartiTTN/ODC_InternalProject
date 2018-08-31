Feature: Simple RTB test

  Scenario Outline:
    #When I make a bid request
    #When I make a bid request with host "<urlName>"
    When I make a bid request with host "<urlName>" and userAgent "<userAgent>"
    #When I make a bid request with configuration "bidResponseData"
    #When I make a bid request with host "<urlName>" and configuration "bidResponseData"
    Then I expect a bid

  Examples:
    |urlName                                                         |userAgent                                                                     |buyeruid|
    |https://perfrtb.viralgains.com/rtb/Harini_Valid_Exchange_RTB/bid|Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:52.0) Gecko/20100101 Firefox/52.0|        |
