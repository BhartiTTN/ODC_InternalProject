Feature: ODC-504: Generate Vast Url and Xml

  Background: I am on the canvas page of a new campaign
    And I have a Campaign named "AutoCampaignName" under Account "QA_ViralGains" and I am on the canvas screen


  Scenario Outline: Generate Click to Play Vast URL, check that is plays in Google Vast Inspector
    #Adding Creative

    And I click on "Canvas Toggle Button"
    And I create and save a new creative named "<Creative Name>" with vast url "<VAST URL>"

    And I mousehover on element "Creative_more_Icon"
    And I mousehover on element "Creative__controlsCover"
    And I click on the "Creative__previewIcon"
    And I pause for 800ms for video to load
    And I click on the "VPAID Checkbox"
    And I store the value from inputfield "Vast Tag Inputfield" as "Initial Creative Vast Tag Url"
    And I click on "Close"

    #Testing Vast Tag Url
    Given I open the url "https://developers.google.com/interactive-media-ads/docs/sdks/html5/vastinspector"
    And I switch to the frame "GoogleFrame"
    And I set stored value "Initial Creative Vast Tag Url" to inputfield "Google Vast Inspector Vast Tag Inputfield"
    And I click on "Test Ad Button"
#    And I scroll to element "Vast Inspector Video" ToDo uncomment when implementation is done
#    And I pause for 800ms for video to load
#    And I click on "Video Play Button" on the "YouTubeGVVideo"
#    And I pause for 800ms for video to play
    # TODO Autoplay once implemented ^^ and check below selector that is failing
    # Then I expect that the Grid element "Google Vast Inspector Events" does contain the text " Ad event: start"

    Examples:
      | Creative Name   | VAST URL                                              |
      | Auto_QACreative | https://rtr.innovid.com/r1.5b06dff09f4739.45624862;cb=|

  Scenario Outline: Generate Click to Play Vast Url, delete creative, check that it doesn't play in Google Vast Inspector
    #Adding Creative
    And I click on "Canvas Toggle Button"
    And I create and save a new creative named "<Creative Name>" with vast url "<VAST URL>"
    And I mousehover on element "Creative_more_Icon"
    And I mousehover on element "Creative__controlsCover"
    And I click on the "Creative__previewIcon"
    And I pause for 800ms for video to load
    And I click on the "VPAID Checkbox"
    And I store the value from inputfield "Vast Tag Inputfield" as "Initial Creative Vast Tag Url"
    And I click on "Close"

  #  #Cleanup
#    And I click on "Back" ToDo uncomment when implementation is done
#    And I click on "Creative Tab"
#    And I delete the newly added row in the Grid


    #Testing Vast Tag Url
    Given I open the url "https://developers.google.com/interactive-media-ads/docs/sdks/html5/vastinspector"
    And I switch to the frame "GoogleFrame"
    And I set stored value "Initial Creative Vast Tag Url" to inputfield "Google Vast Inspector Vast Tag Inputfield"
    And I click on "Test Ad Button"
#    And I scroll to element "Vast Inspector Video"  ToDo uncomment when implementation is done
#    Then I expect that the Grid element "Google Vast Inspector Events" does contain the text "<Ad Error Message>"

    Examples:
      | Creative Name   | VAST URL                                               |Ad Error Message                                                                |
      | Auto_QACreative | https://rtr.innovid.com/r1.5b06dff09f4739.45624862;cb= |Ad error: AdError 1012: Unable to request ads from server due to network error.|


    Scenario Outline: Create a Creative with Duration and generate Click to Play Vast URL, check that is plays in Google Vast Inspector
    #Adding Creative
    And I click on "Canvas Toggle Button"
    And I create a new creative named "<Creative Name>" with vast url "<VAST URL>"

#    And I click on "Video Duration" Todo if needed, remove the steps
#    When I set "<Video Duration>" to "Video Duration"

    And I click on "Save"
    And I pause for 800ms for the modal window to close and mousehover on the creative node to edit
    And I mousehover on element "Creative_more_Icon"
    And I mousehover on element "Creative__controlsCover"
    And I click on the "Creative__previewIcon"
    And I pause for 800ms for video to load
    And I click on the "VPAID Checkbox"
    And I store the value from inputfield "Vast Tag Inputfield" as "Initial Creative Vast Tag Url"

    #Testing Vast Tag Url
    Given I open the url "https://developers.google.com/interactive-media-ads/docs/sdks/html5/vastinspector"
    And I switch to the frame "GoogleFrame"
    And I set stored value "Initial Creative Vast Tag Url" to inputfield "Google Vast Inspector Vast Tag Inputfield"
    And I click on "Test Ad Button"

#    And I scroll to element "Vast Inspector Video"  ToDo uncomment when implementation is done
#    And I pause for 800ms for video to load
#    And I click on "Video Play Button" on the "YouTubeGVVideo"
#
#    And I pause for 800ms for video to load
#    And I expect that element "Video Play Button" is not visible

    Examples:
      | Creative Name   | VAST URL                                               |Video Duration|
      | Auto_QACreative | https://rtr.innovid.com/r1.5b06dff09f4739.45624862;cb= |143           |
