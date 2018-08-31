Feature: ODC-431 , ODC-451 , ODC-385 , ODC-468 and ODC -473 Creative Page features- E2E with Video and CTA fields validation

  Background: I am on the canvas page of a new campaign
    And I have a Campaign named "AutoCampaignName" under Account "QA_ViralGains" and I am on the canvas screen


## Creative Page Navigation Link and validate the Creative page has the same Campaign Name in the BreadCrumbs
  Scenario:
    Then I expect to be on the "ODC-Creative" page
    And I expect that element "Campaign Name Banner" does equal stored value "Newest Campaign Name"

## Creative Page : Back button Navigation to Campaign Dashboard page
  Scenario:
    When I click on "Back"
    Then I expect to be on the "ODC-Campaign_Dashboard" page


# ODC-451 New Campaign: Creative Page Graph Components: Start Node validation and Drag & Drop of Start Node to 200,110px position
  Scenario:
    And I expect that element "Creative Graph" does exist
    And I expect that element "Start Node Title in Graph" contains the text "Campaign Start"
    And I expect that the css attribute "font-size" of element "Start Node_Campaign Name" is "14px"
    And I expect that the css attribute "font-family" of element "Start Node_Campaign Name" is "helveticaneue"


#TODO

## ODC-385 and ODC-468 : Floating Toolbar for creative

  # Create a New Campaign Create a New Creative with Video_URL
  # Edit the Creative Name, Video Type & Video URL in the Creative Grid using Grid Edit button
  # and then Delete the creative


  Scenario Outline:
    And I expect that element "Create Creative Icon" does exist

    When I click on "Create Creative Icon"
    And I move "Creative 1" by x offset 300 and y offset 150
    And I mousehover on element "Creative_more_Icon"
    Then I expect that element "Creative__editIcon" does exist

    When I mousehover on element "Creative__controlsCover"
    And I click on "Creative__editIcon"
    Then I expect that element "Modal Window" does exist

    When I set "<Creative Name>" to the inputfield appended with current Date_Time "Name Field"
    And I store the value from inputfield "Name Field" as "New Creative Name"
    And I click on "Video Type"
    And I click on "Video Type YT_URL"
    And I set "<Video URL>" to "Video URL"
    And I pause for 800ms
    And I click on "Save"
    And I mousehover on element "Creative_more_Icon"
    Then I expect that element "Creative__editIcon" does exist
    And I expect that element "Creative__deleteIcon" does exist
    And I expect that element "Creative__statIcon" does exist
    And I expect that element "Creative__previewIcon" does exist
    And I expect that element "Creative Title" contains the text "<Creative Name>"
    And I pause for 800ms

    # Edit Creative in the Creative Grid
    When I click on "Back"
    And I click on "Creative Tab"
    And I expect that element "Existing Creative" does exist
    And I click on "Select Checkbox"
    And I click on "Grid Edit Icon"
    Then I expect that element "Modal Window" does exist
    When I set "<Edit Creative Name>" to the inputfield appended with current Date_Time "Name Field"
   # And I click on "Edit Video Type"
   # And I click on "Video Type VAST_URL"
    And I click on "Video URL"
    And I clear the inputfield "Video URL"
    And I set "<Edit URL>" to "Video URL"
    And I click on "Save"

    Examples:
      |Creative Name  |Video URL                                   |Edit Creative Name     |Edit URL                                    |
      |QA_TestCN123   |https://www.youtube.com/watch?v=4KWjh8fY214 |Edited_Creative_Name   |https://www.youtube.com/watch?v=4KWjh8fY214 |


## Create multiple Creatives i.e., 2 Creatives and Delete the 2 Creatives in the Grid
  # Validate the Delete Confirmation Message count has 2 count as per the 2 Selected Creatives

  Scenario Outline:
    # First Creative
    When I click on "Create Creative Icon"
    And I move "Creative 1" by x offset 300 and y offset 150
    And I mousehover on element "Creative_more_Icon"
    Then I expect that element "Creative__editIcon" does exist
    When I mousehover on element "Creative__controlsCover"
    And I click on "Creative__editIcon"
    Then I expect that element "Modal Window" does exist
    When I set "<Creative Name>" to the inputfield appended with current Date_Time "Name Field"
    And I store the value from inputfield "Name Field" as "New Creative Name"
    And I click on "Video Type"
    And I click on "Video Type YT_URL"
    And I set "<Video URL>" to "Video URL"
    And I pause for 800ms
    And I click on "Save"
    And I pause for 800ms
    Then I expect that element "Creative Title" contains the text "<Creative Name>"

    # Second Creative
    When I click on "Create Creative Icon"
    And I move "Creative 2" by x offset 600 and y offset 600
    And I pause for 2500ms
    And I mousehover on element "Creative2 MoreIcon"
    Then I expect that element "Creative2 EditIcon" does exist
    When I mousehover on element "Creative2 controlsCover"
    And I click on "Creative2 EditIcon"
    Then I expect that element "Modal Window" does exist
    When I set "<Creative2 Name>" to "Name Field"
    And I store the value from inputfield "Name Field" as "New Creative Name2"
    And I click on "Video Type"
    And I click on "Video Type YT_URL"
    And I set "<Video URL>" to "Video URL"
     # And I click on "Video Type VAST_URL" (de-scoped from JIRA : ODC-385)
     # And I set "<VAST_URL>" to "Video URL" (de-scoped from JIRA : ODC-385)
    And I pause for 800ms
    And I click on "Save"
    #Then I expect that element "2nd Creative Title" contains the text "<Creative2 Name>" TO-DO

    # Perform Deletion of the 2 creatives
    And I pause for 800ms
    And I click on "Back"
    And I pause for 800ms

    When I click on "Creative Tab"
    And I click on "Select Checkbox"
    And I pause for 300ms for the grid to load
    And I click on "2nd Select Checkbox"
    And I store the number of "Selected Rows" as "initial number of selected rows"
    And I click on "Delete Button"
    Then I expect that element "Delete Button in Delete Confirmation Pop-Up" does exist
    And I expect that element "Cancel Button in Delete Confirmation Pop-Up" does exist
    And I expect that element "Delete Confirmation Message" contains the text "Are you sure you want to delete all selected creatives (2)?"
    And I store the count from the field "Delete Confirmation Message" as "delete confirmation count"
    And I expect "initial number of selected rows" to be equal to "delete confirmation count"
    When I click on "Delete Button in Delete Confirmation Pop-Up"

    Examples:
      |Creative2 Name       |Creative Name       |Video URL                                   |VAST_URL                                                   |
      |Ha_MultipleCreative2 |Ha_MultipleCreative1|https://www.youtube.com/watch?v=4KWjh8fY214 |https://ad.doubleclick.net/ddm/pfadx/N5359.1753088VIRALGAINS.COM/B11324913.205237081;sz=0x0;ord= |


## Create and Edit Creative : Required Fields Validation along with
  ##verification of Save button which should be enabled only when all fields are entered

  Scenario Outline:
    When I click on "Create Creative Icon"
    And I move "Creative 1" by x offset 300 and y offset 150
    And I mousehover on element "Creative_more_Icon"
    Then I expect that element "Creative__editIcon" does exist
    When I mousehover on element "Creative__controlsCover"
    And I click on "Creative__editIcon"
    Then I expect that element "Modal Window" does exist

    When I click on "Name Field"
    # Then I expect that element "Name Field" contains the text "Creative 1"
    And I pause for 800ms
    And I clear the inputfield "Name Field"
    And I pause for 800ms
    And I click on "Popup Window"

    Then I expect that element "Field Error Message" contains the text "Required"
    And I expect that element "Save" is not enabled

    When I set "<Creative Name>" to the inputfield appended with current Date_Time "Name Field"
    And I click on "Video Type"
    And I click on "Video Type YT_URL"
    And I click on "Video URL"
    And I click on "Popup Window"
    Then I expect that element "Field Error Message" contains the text "Required"
    And I expect that element "Save" is not enabled

    When I set "<Video URL>" to "Video URL"
    And I click on "CTA Section Checkbox"
    And I click on "CTA Font"
    And I click on "Popup Window"
    Then I expect that element "Dropdown Field Error" contains the text "Required"
    And I expect that element "Save" is not enabled

    When I click on "CTA Font"
    And I click on "CTA Font Value"
    Then I expect that element "Save" is not enabled

    When I click on "CTA Header Text"
    And I click on "Popup Window"
    Then I expect that element "Field Error Validation" contains the text "Required"
    And I expect that element "Save" is not enabled

    When I set "<CTA Header Text>" to "CTA Header Text"
    Then I expect that element "Save" is enabled

    And I pause for 800ms
    When I click on "Save"

    # Edit Creative Fields Validation
    And I pause for 800ms
    And I click on "Back"

    When I click on "Creative Tab"
    Then I expect that element "Existing Creative" does exist
    When I click on "Select Checkbox"
    And I click on "Grid Edit Icon"
    Then I expect that element "Modal Window" does exist
    And I clear the inputfield "Name Field"
    When I click on "Popup Window"
    Then I expect that element "Field Error Message" contains the text "Required"
    And I expect that element "Save" is not enabled

    When I set "<Edit Creative Name>" to the inputfield appended with current Date_Time "Name Field"
    And I clear the inputfield "Video URL"
    And I click on "Popup Window"
    Then I expect that element "Field Error Message" contains the text "Required"
    And I expect that element "Save" is not enabled

    When I set "<Edit URL>" to "Video URL"
    Then I expect that element "Save" is enabled
    When I click on "Save"

    Examples:
      |CTA Header Text |Creative Name                                                                                        |Video URL                                    |Edit Creative Name     |Edit URL                                   |
      |CTA header      |Ha Creative Name_100 Characters Validation_Creative Name_100 Characters Validation_Creative Name_100 |https://www.youtube.com/watch?v=89bLt90xfV0  |Edited_Creative_Name   |https://www.youtube.com/watch?v=4KWjh8fY214|



 ## Edit Creative CTA section Font and Header fields in the Creative Grid for a newly created Creative that has NO CTA section elements originally

  Scenario Outline:
     # Creative with ONLY Video URL section and NO CTA section checked
    When I click on "Create Creative Icon"
    And I mousehover on element "Creative_more_Icon"
    Then I expect that element "Creative__editIcon" does exist
    When I mousehover on element "Creative__controlsCover"
    And I click on "Creative__editIcon"
    Then I expect that element "Modal Window" does exist

    When I set "<Creative Name>" to the inputfield appended with current Date_Time "Name Field"
    And I store the value from inputfield "Name Field" as "New Creative Name"
    And I click on "Video Type"
    And I click on "Video Type YT_URL"
    And I set "<Video URL>" to "Video URL"
    And I click on "Video Duration"
    When I set "<Video Duration>" to "Video Duration"
    And I pause for 800ms
    And I click on "Save"

     # Edit Creative
    And I click on "Back"
    And I click on "Creative Tab"
    Then I expect that element "Existing Creative" does exist
    When I click on "Select Checkbox"
    And I pause for 400ms for Grid to show the Edit Icon
    And I click on "Grid Edit Icon"
    Then I expect that element "Modal Window" does exist
    When I set "<Creative Name>" to the inputfield appended with current Date_Time "Name Field"
    And I click on "Edit Video Type"
    And I click on "Video Type YT_URL"
    And I click on "Video URL"
    And I set "<Video URL>" to "Video URL"
    And I click on "Video Duration"
    When I set "<updated Video Duration>" to "Video Duration"

     # Select CTA checkbox to add the CTA fields
    And I click on "CTA Section Checkbox"

    Then I expect that element "Edit CTA Font" does exist
    And I click on "Edit CTA Font"
    And I click on "Edit CTA Font Value"
    And I click on "CTA Header Text"
    When I set "<CTA Header Text>" to "CTA Header Text"
    Then I expect that element "Save" is enabled

    And I pause for 800ms
    When I click on "Save"

    Examples:
      |Creative Name      |Video URL                                   |CTA Header Text|Video Duration|updated Video Duration|
      |Ha_MultipleCreative|https://www.youtube.com/watch?v=89bLt90xfV0 |Ha_CTA Text    |99            |33                    |

