Feature: ODC-481 Video Creative Configuration - Player Overlay and CTA

  Background: I am on the canvas page of a new campaign
    And I have a Campaign named "AutoCampaignName" under Account "QA_ViralGains" and I am on the canvas screen

#Verify Save button is disabled when Header field is blank in the CTA section with default options selected


  Scenario Outline:
    # Creative with Video URL section but CTA checkbox is checked without data
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

    # Verify Default option
    And I pause for 800ms
    Then I expect that element "Show on hover option" is selected
    When I click on "CTA Section Checkbox"

    # Verify Default option
    Then I expect that inputfield "CTA Header Text" is empty
    And I expect that element "CTA Bottom Option" is selected
    And I expect that element "Save" is not enabled

    Examples:
      | Creative Name   | Video URL                                        |
      | Auto_QACreative | https://www.youtube.com/watch?v=EOVJOxmuB-g&t=6s |


#Validation of Destination URL by entering CTA Header with default options selected & font style as Gotham Medium [URL without http or https / URL with http / invalid url by parameter update]
  Scenario Outline:
    # Create Creative with mandatory fields
    And I create a new creative named "<Creative Name>" with vast url "<VAST URL>"
    And I click on "CTA Top"
    And I expect that element "CTA Top Option" is selected

    #Validate the CTA destinationUrl
    Then I expect that element "CTA_destinationUrl_Validation" contains the text "Please enter valid URL with https:// at the beginning"

    Examples:
      | Creative Name   | VAST URL                                              |
      | Auto_QACreative | https://rtr.innovid.com/r1.5b06dff09f4739.45624862;cb=|
      | Auto_QACreative | https://rtr.innovid.com/r1.5b06dff09f4739.45624862;cb=|
      | Auto_QACreative | https://rtr.innovid.com/r1.5b06dff09f4739.45624862;cb=|


#Verify the Line Item 3 Color Picker Width and Height and Cancel Functionality
  Scenario Outline:
      # Create Creative with mandatory fields
    And I create a new creative named "<Creative Name>" with vast url "<VAST URL>"

      #Validate the Line 3 Color Icon and Chrome Picker Width and Height
    And I click on "Line3 Color Icon"
    Then I expect that element "Sketch_Picker" does exist
    And I expect that the css attribute "width" of element "Sketch_Picker" is "225px"
    #  And I expect that the css attribute "height" of element "Sketch_Picker" is "241.75px"
    When I click on "Close CTA Line3 Color Picker"
    Then I expect that element "Sketch_Picker" is not visible

    Examples:
      | Creative Name   | VAST URL                                               |
      | Auto_QACreative | https://rtr.innovid.com/r1.5b06dff09f4739.45624862;cb= |


#Verify the Line Item 2 & Line Item 3 Text Character Count Validation as per the value entered
  Scenario Outline:
    # Create Creative with mandatory fields
    When I click on "Create Creative Icon"
    And I mousehover on element "Creative_more_Icon"
    And I mousehover on element "Creative__controlsCover"
    And I click on "Creative__editIcon"

    And I click on "CTA Section Checkbox"
    And I set "<CTA HeaderText>" to "CTA Header Text"

     #Validate the Validate Line2 character count before and after entering text
    Then I expect that element "Line2 Character Count" contains the text "0/50"
    When I click on "Line2 Text"
    And I set "<Line2 Text>" to "Line2 Text"
    And I store the count from the field "Line2 Character Count" as "Line2 Text Characters Entered"
    Then I expect that character count "Line2 Text Characters Entered" of the field is as per the value's "<Line2 Text>" length
    And I expect that element "Line2 Character Count" contains the text "47/50"

     #Validate the Validate Line2 & Line3 character count before and after entering text
    And I expect that element "Line3 Character Count" contains the text "0/50"
    When I click on "Line3 Text"
    And I set "<Line3 Text>" to "Line3 Text"
    And I store the count from the field "Line3 Character Count" as "Line3 Text Characters Entered"
    Then I expect that character count "Line3 Text Characters Entered" of the field is as per the value's "<Line3 Text>" length
    And I expect that element "Line3 Character Count" contains the text "46/50"

    Examples:
      | CTA HeaderText                 | Line2 Text                                      | Line3 Text                                     |
      | Start saving for college today | Open your child’s future to more possibilities. | Visit Fidelity.com/ufund for more information. |


#Edit Creative CTA section for Font & text for Line Item 2 and Line Item 3 in the Creative Grid for a newly created Creative that has CTA section elements

  Scenario Outline:
   # Create Creative with mandatory fields
    And I create a new creative named "<Creative Name>" with vast url "<VAST URL>"

   # Adding Line2 and Line3 Text
    And I click on "Line2 Text"
    And I set "<Line2 Text>" to "Line2 Text"
    And I click on "Line3 Text"
    And I set "<Line3 Text>" to "Line3 Text"


    And I click on "Save"

    # Edit Creative in the Creative Grid
    And I click on "Back"
    Then I expect to be on the "ODC-Campaign_Dashboard" page
    When I click on "Creative Tab"
    Then I expect that element "Existing Creative" does exist
    When I click on "Select Checkbox"
    And I click on "Grid Edit Icon"
    Then I expect that element "Modal Window" does exist
    When I set "<Edit Creative Name>" to the inputfield appended with current Date_Time "Name Field"
    And I click on "Edit CTA Font"
    And I click on "Edit CTA Font Value"
    And I click on "Line2 Text"
    And I set "<Edit CTA Line2 Text>" to "Line2 Text"
    And I click on "Line3 Text"
    And I set "<Edit CTA Line3 Text>" to "Line3 Text"

    And I click on "Save"

    Examples:
      | Creative Name   | VAST URL                                               | Line2 Text                                      | Line3 Text                                     | Edit Creative Name   | Edit CTA Line2 Text                           | Edit CTA Line3 Text                           | Video Duration |
      | Auto_QACreative | https://rtr.innovid.com/r1.5b06dff09f4739.45624862;cb= | Open your child’s future to more possibilities. | Visit Fidelity.com/ufund for more information. | Edited_Creative_Name | Edit1_Citigold® Mobile Experience for iPhone® | Edit2_Citigold® Mobile Experience for iPhone® | 123            |


#Scenario:1 - Verify display of Show on Hover - BOTTOM CTA Header, Line 2 and Line 3 with No Text Shadow with default Colors, font style as Gotham Medium [with No URL/with URL by parameter update]

  Scenario Outline:

    # Create Creative with mandatory fields
    And I create a new creative named "<Creative Name>" with vast url "<VAST URL>"

    # Adding Line2 and Line3 Text
    And I click on "Line2 Text"
    And I set "<Line2 Text>" to "Line2 Text"
    And I click on "Line3 Text"
    And I set "<Line3 Text>" to "Line3 Text"

    # Validate that Text Shadow is not selected
    Then I expect that element "Text Shadow Checkbox Status" is not selected

    # Validate the Default Header Background Color
    And I expect that element "CTA Header Color Icon" does exist
    And I expect that the css attribute "backgroundColor" of element "CTA Header Color Icon" is "rgba(246,230,82,1)"


    # Validate the Line2 Background Color
    And I expect that element "Line2 Color Icon" does exist
    And I expect that the css attribute "backgroundColor" of element "Line2 Color Icon" is "rgba(246,230,82,1)"

    # Validate the Line3 Background Color
    And I expect that element "Line3 Color Icon" does exist
    And I expect that the css attribute "backgroundColor" of element "Line3 Color Icon" is "rgba(246,230,82,1)"

    When I click on "Save"

    Examples:
      | Creative Name   | VAST URL                                               | Line2 Text                                      | Line3 Text                                     |
      | Auto_QACreative | https://rtr.innovid.com/r1.5b06dff09f4739.45624862;cb= | Open your child’s future to more possibilities. | Visit Fidelity.com/ufund for more information. |
      | Auto_QACreative | https://rtr.innovid.com/r1.5b06dff09f4739.45624862;cb= | Open your child’s future to more possibilities. | Visit Fidelity.com/ufund for more information. |



#Scenario:2 - Verify display of Show on Hover - BOTTOM CTA Header, Line 2 and Line 3 with Text Shadow with default Colors, font style as Gotham Medium [with No URL/with URL by parameter update]

  Scenario Outline:
    # Create Creative with mandatory fields
    And I create a new creative named "<Creative Name>" with vast url "<VAST URL>"
    And I click on "Text Shadow Checkbox"
    Then I expect that element "Text Shadow Checkbox Status" is selected

   # Adding Line2 and Line3 Text
    And I click on "Line2 Text"
    And I set "<Line2 Text>" to "Line2 Text"
    And I click on "Line3 Text"
    And I set "<Line3 Text>" to "Line3 Text"

    # Validate the Default Header Background Color
    Then I expect that element "CTA Header Color Icon" does exist
    And I expect that the css attribute "backgroundColor" of element "CTA Header Color Icon" is "rgba(246,230,82,1)"
#    And I click on "CTA Header Color Icon"
#    And I click on "Sketch_Picker Bottom Arrow"


    # Validate the Line2 Background Color
    And I expect that element "Line2 Color Icon" does exist
    And I expect that the css attribute "backgroundColor" of element "Line2 Color Icon" is "rgba(246,230,82,1)"

    # Validate the Line3 Background Color
    And I expect that element "Line3 Color Icon" does exist
    And I expect that the css attribute "backgroundColor" of element "Line3 Color Icon" is "rgba(246,230,82,1)"

    When I click on "Save"

    Examples:
      | Creative Name   | VAST URL                                               | Line2 Text                                      | Line3 Text                                     |
      | Auto_QACreative | https://rtr.innovid.com/r1.5b06dff09f4739.45624862;cb= | Open your child’s future to more possibilities. | Visit Fidelity.com/ufund for more information. |
      | Auto_QACreative | https://rtr.innovid.com/r1.5b06dff09f4739.45624862;cb= | Open your child’s future to more possibilities. | Visit Fidelity.com/ufund for more information. |


#Scenario:3 - Verify display of Show on Hover - TOP CTA Header, Line 2 and Line 3 with No Text Shadow with default Colors, font style as Gotham Medium [with No URL/with URL by parameter update]

  Scenario Outline:
   # Create Creative with mandatory fields
    And I create a new creative named "<Creative Name>" with vast url "<VAST URL>"
    And I click on "CTA Top"
  #  Then I expect that element "Show on hover option" is selected
    And I expect that element "Text Shadow Checkbox Status" is not selected

   # Adding Line2 and Line3 Text
    When I click on "Line2 Text"
    And I set "<Line2 Text>" to "Line2 Text"
    And I click on "Line3 Text"
    And I set "<Line3 Text>" to "Line3 Text"

   # Validate the Default Header Background Color
    And I expect that element "CTA Header Color Icon" does exist
    And I expect that the css attribute "backgroundColor" of element "CTA Header Color Icon" is "rgba(246,230,82,1)"

   # Validate the Line2 Background Color
    And I expect that element "Line2 Color Icon" does exist
    And I expect that the css attribute "backgroundColor" of element "Line2 Color Icon" is "rgba(246,230,82,1)"

   # Validate the Line3 Background Color
    And I expect that element "Line3 Color Icon" does exist
    And I expect that the css attribute "backgroundColor" of element "Line3 Color Icon" is "rgba(246,230,82,1)"

    When I click on "Save"

    Examples:
      | Creative Name   | VAST URL                                               | Line2 Text                                      | Line3 Text                                     |
      | Auto_QACreative | https://rtr.innovid.com/r1.5b06dff09f4739.45624862;cb= | Open your child’s future to more possibilities. | Visit Fidelity.com/ufund for more information. |
      | Auto_QACreative | https://rtr.innovid.com/r1.5b06dff09f4739.45624862;cb= | Open your child’s future to more possibilities. | Visit Fidelity.com/ufund for more information. |



#Scenario:4 - Verify display of Show on Hover - TOP CTA Header, Line 2 and Line 3 with Text Shadow with default Colors, font style as Gotham Medium [with No URL/with URL by parameter update]

  Scenario Outline:
   # Create Creative with mandatory fields
    And I create a new creative named "<Creative Name>" with vast url "<VAST URL>"
    And I click on "CTA Top"
    Then I expect that element "CTA Top Option" is selected
    When I click on "Text Shadow Checkbox"
    Then I expect that element "Text Shadow Checkbox Status" is selected

   # Adding Line2 and Line3 Text
    And I click on "Line2 Text"
    And I set "<Line2 Text>" to "Line2 Text"
    And I click on "Line3 Text"
    And I set "<Line3 Text>" to "Line3 Text"

    # Validate the Default Header Background Color
    Then I expect that element "CTA Header Color Icon" does exist
    And I expect that the css attribute "backgroundColor" of element "CTA Header Color Icon" is "rgba(246,230,82,1)"

    # Validate the Line2 Background Color
    And I expect that element "Line2 Color Icon" does exist
    And I expect that the css attribute "backgroundColor" of element "Line2 Color Icon" is "rgba(246,230,82,1)"

    # Validate the Line3 Background Color
    And I expect that element "Line3 Color Icon" does exist
    And I expect that the css attribute "backgroundColor" of element "Line3 Color Icon" is "rgba(246,230,82,1)"

    When I click on "Save"

    Examples:
      | Creative Name   | VAST URL                                               | Line2 Text                                      | Line3 Text                                     |
      | Auto_QACreative | https://rtr.innovid.com/r1.5b06dff09f4739.45624862;cb= | Open your child’s future to more possibilities. | Visit Fidelity.com/ufund for more information. |
      | Auto_QACreative | https://rtr.innovid.com/r1.5b06dff09f4739.45624862;cb= | Open your child’s future to more possibilities. | Visit Fidelity.com/ufund for more information. |



#Scenario:5 - Verify display of Show at all times - BOTTOM CTA Header, Line 2 and Line 3 with No Text Shadow with default Colors, font style as Gotham Medium [with No URL/with URL by parameter update]

  Scenario Outline:
   # Create Creative with mandatory fields
    And I create a new creative named "<Creative Name>" with vast url "<VAST URL>"
    And I click on "Show at all times"
    Then I expect that element "Text Shadow Checkbox Status" is not selected

   # Adding Line2 and Line3 Text
    When I click on "Line2 Text"
    And I set "<Line2 Text>" to "Line2 Text"
    And I click on "Line3 Text"
    And I set "<Line3 Text>" to "Line3 Text"

    # Validate the Default Header Background Color
    Then I expect that element "CTA Header Color Icon" does exist
    And I expect that the css attribute "backgroundColor" of element "CTA Header Color Icon" is "rgba(246,230,82,1)"

    # Validate the Line2 Background Color
    And I expect that element "Line2 Color Icon" does exist
    And I expect that the css attribute "backgroundColor" of element "Line2 Color Icon" is "rgba(246,230,82,1)"

    # Validate the Line3 Background Color
    And I expect that element "Line3 Color Icon" does exist
    And I expect that the css attribute "backgroundColor" of element "Line3 Color Icon" is "rgba(246,230,82,1)"

    When I click on "Save"

    Examples:
      | Creative Name   | VAST URL                                               | Line2 Text                                      | Line3 Text                                     |
      | Auto_QACreative | https://rtr.innovid.com/r1.5b06dff09f4739.45624862;cb= | Open your child’s future to more possibilities. | Visit Fidelity.com/ufund for more information. |
      | Auto_QACreative | https://rtr.innovid.com/r1.5b06dff09f4739.45624862;cb= | Open your child’s future to more possibilities. | Visit Fidelity.com/ufund for more information. |



#Scenario:7 - Verify display of Show at all times - TOP CTA Header, Line 2 and Line 3 with No Text Shadow with default Colors, font style as Gotham Medium [with No URL/with URL by parameter update]

  Scenario Outline:
   # Create Creative with mandatory fields
    And I create a new creative named "<Creative Name>" with vast url "<VAST URL>"
    And I click on "Show at all times"
    And I click on "CTA Top"
    Then I expect that element "Text Shadow Checkbox Status" is not selected

    # Adding Line2 and Line3 Text
    When I click on "Line2 Text"
    And I set "<Line2 Text>" to "Line2 Text"
    And I click on "Line3 Text"
    And I set "<Line3 Text>" to "Line3 Text"

    # Validate the Default Header Background Color
    Then I expect that element "CTA Header Color Icon" does exist
    And I expect that the css attribute "backgroundColor" of element "CTA Header Color Icon" is "rgba(246,230,82,1)"

    # Validate the Line2 Background Color
    And I expect that element "Line2 Color Icon" does exist
    And I expect that the css attribute "backgroundColor" of element "Line2 Color Icon" is "rgba(246,230,82,1)"

    # Validate the Line3 Background Color
    And I expect that element "Line3 Color Icon" does exist
    And I expect that the css attribute "backgroundColor" of element "Line3 Color Icon" is "rgba(246,230,82,1)"

    When I click on "Save"

    Examples:
      | Creative Name   | VAST URL                                               | Line2 Text                                      | Line3 Text                                     |
      | Auto_QACreative | https://rtr.innovid.com/r1.5b06dff09f4739.45624862;cb= | Open your child’s future to more possibilities. | Visit Fidelity.com/ufund for more information. |
      | Auto_QACreative | https://rtr.innovid.com/r1.5b06dff09f4739.45624862;cb= | Open your child’s future to more possibilities. | Visit Fidelity.com/ufund for more information. |


# Scenario:8 - Verify display of Show at all times - TOP CTA Header, Line 2 and Line 3 with Text Shadow with default Colors, font style as Gotham Medium [with No URL/with URL by parameter update]
  Scenario Outline:
   # Create Creative with mandatory fields
    And I create a new creative named "<Creative Name>" with vast url "<VAST URL>"
    And I click on "Show at all times"
    And I click on "CTA Top"
    Then I expect that element "CTA Top Option" is selected
    When I click on "Text Shadow Checkbox"
    Then I expect that element "Text Shadow Checkbox Status" is selected

   # Adding Line2 and Line3 Text
    And I click on "Line2 Text"
    And I set "<Line2 Text>" to "Line2 Text"
    And I click on "Line3 Text"
    And I set "<Line3 Text>" to "Line3 Text"

    # Validate the Default Header Background Color
    Then I expect that element "CTA Header Color Icon" does exist
    And I expect that the css attribute "backgroundColor" of element "CTA Header Color Icon" is "rgba(246,230,82,1)"

    # Validate the Line2 Background Color
    And I expect that element "Line2 Color Icon" does exist
    And I expect that the css attribute "backgroundColor" of element "Line2 Color Icon" is "rgba(246,230,82,1)"

    # Validate the Line3 Background Color
    And I expect that element "Line3 Color Icon" does exist
    And I expect that the css attribute "backgroundColor" of element "Line3 Color Icon" is "rgba(246,230,82,1)"

    When I click on "Save"

    Examples:
      | Creative Name   | VAST URL                                    | Line2 Text                                      | Line3 Text                                     |
      | Auto_QACreative | https://www.youtube.com/watch?v=89bLt90xfV0 | Open your child’s future to more possibilities. | Visit Fidelity.com/ufund for more information. |
      | Auto_QACreative | https://www.youtube.com/watch?v=89bLt90xfV0 | Open your child’s future to more possibilities. | Visit Fidelity.com/ufund for more information. |


  ## ODC-657

# Scenario:6 - Verify display of Show at all times - BOTTOM CTA Header, Line 2 and Line 3 with Text Shadow with default Colors, font style as Gotham Medium [with No URL/with URL by parameter update]

  Scenario Outline:
    And I click on "Create Creative Icon"
    And I pause for 800ms
    And I set the "transform" attribute of the "Creative 1" to "translate(230,230)"
    And I mousehover on element "Creative_more_Icon"
    Then I expect that element "Creative__editIcon" does exist
    When I mousehover on element "Creative__controlsCover"
    And I click on "Creative__editIcon"
    Then I expect that element "Modal Window" does exist

  # Create Creative with mandatory fields
    When I set "<Creative Name>" to the inputfield appended with current Date_Time "Name Field"
    And I click on "Video Type"
    And I click on "Video Type YT_URL"
    And I click on "Video URL"
    When I set "<Video URL>" to "Video URL"

    And I click on "Video Duration"
    When I set "<Video Duration>" to "Video Duration"

    And I click on "Show at all times"

    And I click on "CTA Section Checkbox"
    When I click on "CTA Font"
    And I click on "CTA Font Value"
    When I click on "CTA Header Text"
    When I set "<CTA Header Text>" to "CTA Header Text"

    When I click on "Text Shadow Checkbox"
    Then I expect that element "Text Shadow Checkbox Status" is selected

   # Adding Line2 and Line3 Text
    And I click on "Line2 Text"
    And I set "<Line2 Text>" to "Line2 Text"
    And I click on "Line3 Text"
    And I set "<Line3 Text>" to "Line3 Text"

    # Validate the Default Header Background Color
    Then I expect that element "CTA Header Color Icon" does exist
    And I expect that the css attribute "backgroundColor" of element "CTA Header Color Icon" is "rgba(246,230,82,1)"

    # Validate the Line2 Background Color
    And I expect that element "Line2 Color Icon" does exist
    And I expect that the css attribute "backgroundColor" of element "Line2 Color Icon" is "rgba(246,230,82,1)"

    # Validate the Line3 Background Color
    And I expect that element "Line3 Color Icon" does exist
    And I expect that the css attribute "backgroundColor" of element "Line3 Color Icon" is "rgba(246,230,82,1)"

    When I click on "Save"

    Examples:
      | Creative Name   | Video URL                                   | CTA Header Text                | CTA destinationUrl     | Line2 Text                                      | Line3 Text                                     | Video Duration |
      | Auto_QACreative | https://www.youtube.com/watch?v=89bLt90xfV0 | Start saving for college today |                        | Open your child’s future to more possibilities. | Visit Fidelity.com/ufund for more information. | 143            |
      | Auto_QACreative | https://www.youtube.com/watch?v=89bLt90xfV0 | Start saving for college today | https://bit.ly/2sZTyQW | Open your child’s future to more possibilities. | Visit Fidelity.com/ufund for more information. | 12             |



   ## ODC-657

# Validate Duration field with 9 characters

  Scenario Outline:
    And I click on "Create Creative Icon"
    And I move "Creative 1" by x offset 300 and y offset 150
    And I mousehover on element "Creative_more_Icon"
    Then I expect that element "Creative__editIcon" does exist
    When I mousehover on element "Creative__controlsCover"
    And I click on "Creative__editIcon"
    Then I expect that element "Modal Window" does exist

  # Create Creative with mandatory fields
    When I set "<Creative Name>" to the inputfield appended with current Date_Time "Name Field"
    And I click on "Video Type"
    And I click on "Video Type YT_URL"
    And I click on "Video URL"
    When I set "<Video URL>" to "Video URL"

    And I click on "Video Duration"
    When I set "<Video Duration>" to "Video Duration"

    And I click on "Show at all times"

    When I click on "Save"

    Examples:
      | Creative Name   | Video URL                                   | Video Duration |
      | Auto_QACreative | https://www.youtube.com/watch?v=89bLt90xfV0 | 1234567890     |
      | Auto_QACreative | https://www.youtube.com/watch?v=89bLt90xfV0 | 123456789      |
      | Auto_QACreative | https://www.youtube.com/watch?v=89bLt90xfV0 |                |


# Validate Duration field with > 10 characters , expected : a validation message

  Scenario Outline:
    And I click on "Create Creative Icon"
    And I pause for 800ms
    And I set the "transform" attribute of the "Creative 1" to "translate(230,230)"
    And I mousehover on element "Creative_more_Icon"
    Then I expect that element "Creative__editIcon" does exist
    When I mousehover on element "Creative__controlsCover"
    And I click on "Creative__editIcon"
    Then I expect that element "Modal Window" does exist

  # Create Creative with mandatory fields
    When I set "<Creative Name>" to the inputfield appended with current Date_Time "Name Field"
    And I click on "Video Type"
    And I click on "Video Type YT_URL"
    And I click on "Video URL"
    When I set "<Video URL>" to "Video URL"

    And I click on "Video Duration"
    When I set "<Video Duration greater than 10 digits>" to "Video Duration"
    # Then I expect that element "Field Error Message" contains the text "Correct the Duration value or should be less <..?"

    And I click on "Show at all times"

    Examples:
      | Creative Name   | Video URL                                   | Video Duration greater than 10 digits |
      | Auto_QACreative | https://www.youtube.com/watch?v=89bLt90xfV0 | 12345678912                           |

  # StepMethod:  And I create and save a new creative named "<Creative Name>" with vast url "<VAST URL>" CTA header text "<CTA HeaderText>" and CTA destination url "<CTA destinationUrl>"
