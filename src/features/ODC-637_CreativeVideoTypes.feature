Feature: ODC-637 Creative Video Types VAST-URL and VAST-XML

  Background: I am on the canvas page of a new campaign
    And I have a Campaign named "AutoCampaignName" under Account "QA_ViralGains" and I am on the canvas screen


# Verify VAST URL Label and Field appears when Vast URL option is selected in the Video Dropdown
  Scenario Outline:
    And I click on "Canvas Toggle Button"
    When I click on "Create Creative Icon"
    And I mousehover on element "Creative_more_Icon"
    Then I expect that element "Creative__editIcon" does exist
    When I mousehover on element "Creative__controlsCover"
    And I click on "Creative__editIcon"
    Then I expect that element "Modal Window" does exist
    When I set "<Creative Name>" to the inputfield appended with current Date_Time "Name Field"
    And I store the value from inputfield "Name Field" as "New Creative Name"
    And I click on "Video Type"
    And I click on "Video Type VAST_URL"
    Then I expect that element "Video Type Field-Label" contains the text "VAST Tag URL"
    And I set "<VAST_URL>" to "Vast URL"
    And I click on "Save"

    Examples:
      | Creative Name   | VAST_URL                                               |
      | Auto_QACreative | https://rtr.innovid.com/r1.5b06dff09f4739.45624862;cb= |


# Verify VAST XML Label and Field appears when Vast URL option is selected in the Video Dropdown
  Scenario Outline:
    And I click on "Canvas Toggle Button"
    When I click on "Create Creative Icon"
    And I mousehover on element "Creative_more_Icon"
    Then I expect that element "Creative__editIcon" does exist
    When I mousehover on element "Creative__controlsCover"
    And I click on "Creative__editIcon"
    Then I expect that element "Modal Window" does exist
    When I set "<Creative Name>" to the inputfield appended with current Date_Time "Name Field"
    And I store the value from inputfield "Name Field" as "New Creative Name"
    And I click on "Video Type"
    And I click on "Video Type VAST_XML"
    Then I expect that element "Video Type Field-Label" contains the text "VAST Xml"
    And I set "<VAST_XML>" to "Vast XML"
    And I click on "Save"

    Examples:
      | Creative Name   | VAST_XML                                               |
      | Auto_QACreative | https://rtr.innovid.com/r1.5b06dff09f4739.45624862;cb= |
