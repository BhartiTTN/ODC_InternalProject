Feature: ODC-743 Site List Targeting


Background: I am editing the Site List section of a  targeting node in a new Campaign
  Given I have a Campaign named "AutoCampaignName" under Account "QA_ViralGains"
  And that Campaign has a Targeting Node named "Targeting 1"
  And That "Targeting" node is updated to be named "Targeting 1", and have x position "300" and y position "300"
  And I am on the canvas screen for the newly created campaign
  And I open the targeting node
  When I click on the "Targeting Type Dropdown"
  When I click on "Site List" in the drop down

  Scenario Outline: Typing valid urls with Include, testing delete (Reqs 1-3, 5-6).
    When I set "<First Url>" to the inputfield "Site List Inputfield"
    And I press "Enter"
    And I set "<Second Url>" to the inputfield "Site List Inputfield"
    And I press "Space"
    And I click on "Add Targeting Criteria Button"

    # Testing Save functionality
    And I click on "Save"
    And I open the targeting node
    Then I expect that the Grid element "Included Targetings" does contain the text "<First Url>, <Second Url>"

    #Test Update
    When I click on the "Targeting Type Dropdown"
    And I click on "Site List" in the drop down
    And I set "<First Url>" to the inputfield "Site List Inputfield"
    And I press "Enter"
    And I click on "Add Targeting Criteria Button"
    Then I expect that the Grid element "Included Targetings" does contain the text "<First Url>"

    # Test Delete
    When I click on the "Targeting Type Dropdown"
    And I click on "Site List" in the drop down
    And I set "<First Url>" to the inputfield "Site List Inputfield"
    And I press "Enter"
    And I set "<Second Url>" to the inputfield "Site List Inputfield"
    And I press "Space"
    And I click on "Delete First Site"
    And I click on "Add Targeting Criteria Button"
    Then I expect that the Grid element "Included Targetings" does contain the text "<Second Url>"

  Examples:
    |First Url       |Second Url    |
    |www.facebook.com|www.google.com|

  Scenario Outline: Typing valid urls with Exclude, testing delete (Reqs 1-3, 5-6).
    When I click on "Include_Exclude dropdown"
    And I click on "Exclude" in the drop down

    When I set "<First Url>" to the inputfield "Site List Inputfield"
    And I press "Enter"
    And I set "<Second Url>" to the inputfield "Site List Inputfield"
    And I press "Enter"
    And I click on "Add Targeting Criteria Button"

    # Testing Save functionality
    And I click on "Save"
    And I open the targeting node
    Then I expect that the Grid element "Excluded Targetings" does contain the text "<First Url>, <Second Url>"

    Examples:
      |First Url       |Second Url    |
      |www.facebook.com|www.google.com|

  Scenario Outline: Typing invalid urls (Req 7, 8)
    When I set "<Valid Url>" to the inputfield "Site List Inputfield"
    And I press "Enter"
    And I set "<Invalid Url>" to the inputfield "Site List Inputfield"
    And I press "Enter"

    Then I expect that element "Second Targeting Site" has the class "Invalid"
    And I expect that element "Site List Error Message" is visible
    And I expect that element "Add Targeting Criteria Button" is not enabled

  Examples:
    |Valid Url       |Invalid Url|
    |www.facebook.com|fff        |



  Scenario Outline: Valid Copy and Paste (Req 4)
    Given I have "<First Url> <Second Url>" copied to the clipboard

    When I paste copied text into the inputfield "Site List Inputfield"
    And I click on "Add Targeting Criteria Button"
    Then I expect that the Grid element "Included Targetings" does contain the text "<First Url>, <Second Url>"

  Examples:
    |First Url       |Second Url    |
    |www.facebook.com|www.google.com|

  Scenario Outline: Testing maximum copy and paste, few large values
    Given I have "<Url 1> <Url 2> <Url 3> <Url 4> <Url 5>" copied to the clipboard

    When I paste copied text into the inputfield "Site List Inputfield"
    And I click on "Add Targeting Criteria Button"
    Then I expect that the Grid element "Included Targetings" does contain the text "<Url 1>, <Url 2>, <Url 3>, <Url 4>, <Url 5>"

    Examples:
      |Url 1                                                                                                                                                                                                                                                              | Url 2                                                                       | Url 3                                                              | Url 4                                                                      | Url 5                                                                         |
      |http://thelongestlistofthelongeststuffatthelongestdomainnameatlonglast.com/wearejustdoingthistobestupidnowsincethiscangoonforeverandeverandeverbutitstilllookskindaneatinthebrowsereventhoughitsabigwasteoftimeandenergyandhasnorealpointbutwehadtodoitanyways.html|https://3.141592653589793238462643383279502884197169399375105820974944592.eu/| thelongestdomainnameintheworldandthensomeandthensomemoreandmore.com| http://iamtheproudownerofthelongestlongestlongestdomainnameinthisworld.com/| http://www.llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogochuchaf.eu/|

  Scenario Outline: Testing maximum copy and paste, many small values
    Given I have "<Url 1> <Url 2> <Url 3> <Url 4> <Url 5> <Url 6> <Url 7> <Url 8> <Url 9> <Url 10> <Url 11> <Url 12> <Url 13> <Url 14> <Url 15> <Url 16> <Url 17> <Url 18> <Url 19> <Url 20> <Url 21> <Url 22> <Url 23> <Url 24> <Url 25> <Url 26> <Url 27> <Url 28> <Url 29> <Url 30> <Url 31> <Url 32> <Url 33> <Url 34> <Url 35> <Url 36> <Url 37> <Url 38> <Url 39> <Url 40>" copied to the clipboard

    When I paste copied text into the inputfield "Site List Inputfield"
    And I click on "Add Targeting Criteria Button"
    Then I expect that the Grid element "Included Targetings" does contain the text "<Url 1>, <Url 2>, <Url 3>, <Url 4>, <Url 5>, <Url 6>, <Url 7>, <Url 8>, <Url 9>, <Url 10>, <Url 11>, <Url 12>, <Url 13>, <Url 14>, <Url 15>, <Url 16>, <Url 17>, <Url 18>, <Url 19>, <Url 20>, <Url 21>, <Url 22>, <Url 23>, <Url 24>, <Url 25>, <Url 26>, <Url 27>, <Url 28>, <Url 29>, <Url 30>, <Url 31>, <Url 32>, <Url 33>, <Url 34>, <Url 35>, <Url 36>, <Url 37>, <Url 38>, <Url 39>, <Url 40>"

    Examples:
      |Url 1|Url 2|Url 3|Url 4|Url 5|Url 6|Url 7|Url 8|Url 9|Url 10|Url 11|Url 12|Url 13|Url 14|Url 15|Url 16|Url 17|Url 18|Url 19|Url 20|Url 21|Url 22|Url 23|Url 24|Url 25|Url 26|Url 27|Url 28|Url 29|Url 30|Url 31|Url 32|Url 33|Url 34|Url 35|Url 36|Url 37|Url 38|Url 39|Url 40|
      |a.com|b.com|c.com|d.com|e.com|f.com|g.com|h.com|i.com|j.com |k.com |l.com |m.com |n.com |o.com |p.com |q.com |r.com |s.com |t.com |u.com |v.com |w.com |x.com |y.com |z.com |aa.com|bb.com|cc.com|dd.com|ee.com|ff.com|gg.com|hh.com|ii.com|jj.com|kk.com|ll.com|mm.com|nn.com|



  Scenario Outline: Invalid Copy and Paste (Req 7, 8)
    Given I have "<Valid Url> <Invalid Url>" copied to the clipboard
    When I paste copied text into the inputfield "Site List Inputfield"
    Then I expect that element "Second Targeting Site" has the class "Invalid"
    And I expect that element "Site List Error Message" is visible
    And I expect that element "Add Targeting Criteria Button" is not enabled

    Examples:
      |Valid Url       |Invalid Url|
      |www.facebook.com|fff        |

  Scenario Outline: Duplicate typed entries should be deleted, and a messaged should be shown
    When I set "<Url> <Url>" to the inputfield "Site List Inputfield"
    And I press "Enter"
    And I click on "Add Targeting Criteria Button"
    Then I expect that the Grid element "Included Targetings" does not contain the text "<Url>, <Url>"
    And I expect that element "Notification" is visible


    Examples:
    | Url            |
    |www.facebook.com|
    
  Scenario Outline: Duplicate Pasted entries should be deleted, and a messaged should be shown
    Given I have "<Url> <Url>" copied to the clipboard
    When I paste copied text into the inputfield "Site List Inputfield"
    And I click on "Add Targeting Criteria Button"
    Then I expect that the Grid element "Included Targetings" does not contain the text "<Url>, <Url>"
    And I expect that element "Notification" is visible


    Examples:
      | Url            |
      |www.facebook.com|
