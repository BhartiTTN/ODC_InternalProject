Feature: ODC-70 Limelight

  Background: I am on the canvas page of a new campaign
    And I have a Campaign named "Ha_CampaignName123" under Account "QA_ViralGains" and I am on the canvas screen

  Scenario Outline: Create a Creative with Lime Light Video, Verify in the Preview Play and Store Limelight VAST URL and play it in GVI

    When I click on "Create Creative Icon"
    And I set the "transform" attribute of the "Creative 1" to "translate(230,230)"
    And I mousehover on element "Creative_more_Icon"
    And I mousehover on element "Creative__controlsCover"
    And I click on "Creative__editIcon"
    And I set "<Creative Name>" to the inputfield appended with current Date_Time "Name Field"
    And I store the value from inputfield "Name Field" as "New Creative Name"
    And I click on "Video Type"
    And I click on "Video Type LL_Raw file"

    When I select file "Limelight_Video_VGMonday.mp4" of type "raw" for the element "LL_Video_Upload"
    And I pause for 25500ms for video to upload
    And I pause for 25500ms for video to upload
    And I pause for 15500ms for video to upload
    And I click on "Save"
    Then I expect that element "Creative Title" contains the text "<Creative Name>"

    When I mousehover on element "Creative_more_Icon"
    And I mousehover on element "Creative__controlsCover"


    # Verify the Preview load the video
    Then I expect that element "Creative__previewIcon" does exist
    When I click on "Creative__previewIcon"
    And I pause for 2000ms for video to load
    And I pause for 25500ms for video to load
    And I pause for 25500ms for video to load
    Then I expect that element "Creative Preview Video" does exist

    # Click on the Video and verify the Video Plays (by checking Play button is not existing when video plays)
    When I click on "Creative Preview Video"
    And I pause for 9000ms for video to show playing
    And I mousehover on element "Creative Preview Video"
    Then I expect that element "Video Play Button" does not exist

#    # Store Limelight Video Plays
#    And I click on the "VPAID Checkbox"
#    And I store the value from inputfield "Vast Tag Inputfield" as "Initial Creative Vast Tag Url"
#
#    #Testing LimeLight Video Plays
#    Given I open the url "https://developers.google.com/interactive-media-ads/docs/sdks/html5/vastinspector"
#    And I switch to the frame "GoogleFrame"
#    And I set stored value "Initial Creative Vast Tag Url" to inputfield "Google Vast Inspector Vast Tag Inputfield"
#    And I click on "Test Ad Button"
#    And I scroll to element "Vast Inspector Video"
#    And I pause for 15500ms
#    And I click on "Video Play Button" on the "YouTubeGVVideo"
#    And I pause for 9000ms for video to show playing
#    And I expect that element "Video Play Button" is not visible


#    And I click on "Creative__deleteIcon"
#    Then I expect that element "Delete Confirmation Popup" does exist
#    And I expect that element "Delete Button in Delete pop-up" does exist
#    And I expect that element "Cancel Button in Delete pop-up" does exist
#
#   # Creative 1 : click on Delete Icon and verify
#    When I click on "Delete Button in Delete pop-up"
#    Then I expect that element "Creative 1" does not exist

    Examples:
      | Creative Name        |
      | Ha_MultipleCreative1 |

