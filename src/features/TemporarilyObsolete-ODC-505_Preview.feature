Feature: ODC-505 Preview feature

  Background: I am on the canvas page of a new campaign
    And I have a Campaign named "AutoCampaignName" under Account "QA_ViralGains" and I am on the canvas screen

 # 505: Verify default Preview for a creative that has no valid Video

  Scenario:
    And I click on "Create Creative Icon"

    # Create Creative with mandatory fields and click on Preview Icon
    And I mousehover on element "Creative_more_Icon"
    And I mousehover on element "Creative__controlsCover"

    # Verify the Preview load the video
    Then I expect that element "Creative__previewIcon" does exist
    When I click on "Creative__previewIcon"
    Then I expect that element "Video Play Button" does not exist

 # 505: Verify Video Plays in the Preview for a creative that has valid Video
  Scenario Outline:

    # Create Creative with mandatory fields and click on Preview Icon
    And I create and save a new creative named "<Creative Name>" with vast url "<VAST URL>"
    And I mousehover on element "Creative_more_Icon"
    And I mousehover on element "Creative__controlsCover"

    # Verify the Preview load the video
    Then I expect that element "Creative__previewIcon" does exist
    When I click on "Creative__previewIcon"
    And I pause for 1000ms for video to load
    Then I expect that element "Creative Preview Video" does exist

    # Click on the Video and verify the Video Plays (by checking Play button is not existing when video plays)
    When I click on "Creative Preview Video"
    And I pause for 3000ms for video to show playing
    And I mousehover on element "Creative Preview Video"
    Then I expect that element "Video Play Button" does not exist

    Examples:
      |Creative Name    |VAST URL                                               |
      |Auto_QACreative  |https://rtr.innovid.com/r1.5b06dff09f4739.45624862;cb= |

#
## 505: Verify CTA section in the Video Preview (TODO work in progress - Story scope changed today)
#
#  Scenario Outline:
#
#    Given I log into the site "ODC" as an admin
#    And I select default account
#    When I click on "Campaign Management"
#
#    # Create Campaign
#    And I create a campaign "<Valid Campaign Name>" and click on the campaign link to navigate to Creative Page
#    And I click on "Create Creative Icon"
#
#    # Create Creative with mandatory fields and click on Preview Icon
#    And I enter user defined values in the Creative Page "<Creative Name>", "<Video URL>", "<CTA HeaderText>" and "<CTA destinationUrl>"
#    And I click on "Save"
#    And I mousehover on element "Creative_more_Icon"
#    And I mousehover on element "Creative__controlsCover"
#
#    # Verify the Preview with CTA
#    Then I expect that element "Creative__previewIcon" does exist
#    When I click on "Creative__previewIcon"
#    And I pause for 1000ms for video to load
#    Then I expect that element "Creative Preview Video" does exist
#    And I mousehover on element "Creative Preview Video"
#
#    And I pause for 1000ms
#    And I expect that element "CTA Header Message" contains the text "TEST"
#
#    Examples:
#      |Valid Campaign Name  |Creative Name    |Video URL                                   |CTA HeaderText                  |CTA destinationUrl      |
#      |Auto_CampaignName    |Auto_QACreative  |https://www.youtube.com/watch?v=Vy5jelDmhDg |Start saving for college today  | https://viralgains.com |
