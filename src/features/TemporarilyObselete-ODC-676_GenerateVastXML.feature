Feature: ODC-651: Generate Vast Xml and ODC-676 validate Duration field in Vast XML

  Background: Create and Open a new Campaign
    And I have a Campaign named "AutoCampaignName" under Account "QA_ViralGains" and I am on the canvas screen


  Scenario Outline: Open the stored Vast to generate Vast Tag XML
    #Adding Creative
    And I click on "Canvas Toggle Button"
    And I create and save a new creative named "<Creative Name>" with vast url "<VAST URL>"

    And I mousehover on element "Creative_more_Icon"
    And I mousehover on element "Creative__controlsCover"
    And I click on the "Creative__previewIcon"
    And I click on the "VPAID Checkbox"
    And I store the value from inputfield "Vast Tag Inputfield" as "Initial Creative Vast Tag Url"

    #Open the stored Vast to generate Vast Tag XML
    Given I open the url named with stored variable "Initial Creative Vast Tag Url"
    Then I expect that element "Vast XML Text" contains the text "This XML file does not appear to have any style information associated with it. The document tree is shown below."

    #Contacting endpoint to generate Vast Tag XML 
    When I make an API call to the endpoint named with stored variable "Initial Creative Vast Tag Url" and store the response as "Vast XML Text"

    #Testing Vast response on Google Vast Inspector
    Given I open the url "https://developers.google.com/interactive-media-ads/docs/sdks/html5/vastinspector"
    When I click on "Vast Xml Radio Button" on the "GoogleFrame"
    And I set stored value "Vast XML Text" to inputfield "Google Vast Inspector Vast XML Inputfield"
    And I click on "Test Ad Button"
#    And I scroll to element "Vast Inspector Video" ToDo uncomment when the implementation is done
#    And I click on "Video Play Button" on the "YouTubeGVVideo"
#    And I expect that element "Video Play Button" is not visible



    Examples:
      | Creative Name   | VAST URL                                               |
      | Auto_QACreative | https://rtr.innovid.com/r1.5b06dff09f4739.45624862;cb= |

#    #ODC-676

  Scenario Outline: Open the stored Vast to generate Vast Tag XML and validate Duration field
  #Adding Creative

    And I click on "Canvas Toggle Button"
    And I create a new creative named "<Creative Name>" with vast url "<VAST URL>"

    And I click on "Save"
    And I mousehover on element "Creative_more_Icon"
    And I mousehover on element "Creative__controlsCover"
    And I click on the "Creative__previewIcon"
    And I click on the "VPAID Checkbox"
    And I store the value from inputfield "Vast Tag Inputfield" as "Initial Creative Vast Tag Url"

  #Open the stored Vast to generate Vast Tag XML and validate the duration tag has the time entered in the Creative CTA
    Given I open the url named with stored variable "Initial Creative Vast Tag Url"
    Then I expect that element "Vast XML Text" contains the text "This XML file does not appear to have any style information associated with it. The document tree is shown below."
    And I expect that element "Duration Tag in VAST XML generated" contains the text "00:00:10"




    Examples:
      | Creative Name   | VAST URL                                               |
      | Auto_QACreative | https://rtr.innovid.com/r1.5b06dff09f4739.45624862;cb= |


