Feature: ODC-601 Engagement Card node creation and ODC-486 : EC type Thank you CTA

#TODO Changing the Font and Button colors with Sketch_Picker Color Selector

  Background: Create and Open a new Campaign
    And I have a Campaign named "AutoCampaignName" under Account "QA_ViralGains" and I am on the canvas screen

  Scenario:
    And I expect that element "Create Engagement Card" does exist

# Verify the default position and multiple Tracking icons that appear on the canvas UI that many times user clicks on Engagement Card Icon.

  Scenario:
      # Engagement Card  1
    When I click on "Create Engagement Card"
    Then I expect that element "Engagement Card 1" does exist
    And I expect that element "Engagement Card 2" does not exist
    Then I expect that the css attribute "transform" of element "Engagement Card in the Graph" is "matrix(1, 0, 0, 1, 100, 30)"
    And I set the "transform" attribute of the "Engagement Card 1" to "translate(230,230)"

    # Engagement Card  2
    When I click on "Create Engagement Card"
    Then I expect that element "Engagement Card 2" does exist
    #And I expect that the css attribute "transform" of element "Engagement Card 2" is "matrix(1, 0, 0, 1, 100, 30)"


# E2E - Engagement Card fields Edit and Save with mandatory fields data

  Scenario Outline:
    # Engagement Card Edit window with default values
    When I click on "Create Engagement Card"
    And I mousehover on element "Engagement Card_moreIcon"
    And I mousehover on element "Engagement Card__controlsCover"
    And I click on "Engagement Card editIcon"
    Then I expect that element "Engagement Experience Type Section" does exist
    Then I expect that element "Engagement Type Disable Option" is selected

   # Enter Engagement Card fields Name and choose Engagement Experience Type
    When I clear the inputfield "Engagement Card Name"
    And I set "<Engagement Card Name>" to "Engagement Card Name"
    And I click on "Engagement Type Traditional"
    Then I expect that element "Engagement Type CTA" does exist
   # And I expect that element "Engagement Type CTA" contains the text "Thank you CTA"

    # Enter the fields of the " Thank you CTA"
    When I click on "Engagement Type CTA"
    And I click on "EC Type Thank you CTA Font"
    And I scroll to element "EC Type Thank you CTA Font Value"
    And I click on "EC Type Thank you CTA Font Value"
    And I click on "EC Type Thank you CTA Header"
    And I set "<Header Text>" to "EC Type Thank you CTA Header"
    And I click on "EC Type Thank you CTA Button"
    And I set "<CTA Button Text>" to "EC Type Thank you CTA Button"
    And I click on "EC Type Thank you CTA Button Hyperlink"
    And I set "<CTA Hyperlink>" to "EC Type Thank you CTA Button Hyperlink"
    And I pause for 800ms for server to save the values entered
    And I click on "Save"

    # Validate the EC name is as entered
    Then I expect that element "Engagement Card in the Graph" contains the text "<Engagement Card Name>"

    # Update the EC name to lengthy text and verify the node name display in canvas with '..'
    When I mousehover on element "Engagement Card_moreIcon"
    And I mousehover on element "Engagement Card__controlsCover"
    And I click on "Engagement Card editIcon"
    And I clear the inputfield "Engagement Card Name"
    And I set "<Engagement Card Name>" to the inputfield appended with current Date_Time "Engagement Card Name"
    And I pause for 800ms for server to save the values entered
    And I click on "Save"
    Then I expect that element "Engagement Card in the Graph" contains the text "Ha_QA T.."



    Examples:
      |Engagement Card Name|Header Text                  |CTA Button Text |CTA Hyperlink       |
      |Ha_QA Test EC1      |Thank you CTA Header or TITLe|CTA Button Label|https://facebook.com|




# E2E - Verify Delete functionality for an Engagement Card that is saved with CTA and all mandatory fields

  Scenario Outline:
    # Engagement Card Edit window with default values
    When I click on "Create Engagement Card"
    And I mousehover on element "Engagement Card_moreIcon"
    And I mousehover on element "Engagement Card__controlsCover"
    And I click on "Engagement Card editIcon"
    Then I expect that element "Engagement Experience Type Section" does exist
    Then I expect that element "Engagement Type Disable Option" is selected

   # Enter Engagement Card fields Name and choose Engagement Experience Type
    When I clear the inputfield "Engagement Card Name"
    And I set "<Engagement Card Name>" to "Engagement Card Name"
    And I click on "Engagement Type Traditional"
    Then I expect that element "Engagement Type CTA" does exist
   # And I expect that element "Engagement Type CTA" contains the text "Thank you CTA"

    # Enter the fields of the " Thank you CTA"
    When I click on "Engagement Type CTA"
    And I click on "EC Type Thank you CTA Font"
    And I scroll to element "EC Type Thank you CTA Font Value"
    And I click on "EC Type Thank you CTA Font Value"
    And I click on "EC Type Thank you CTA Header"
    And I set "<Header Text>" to "EC Type Thank you CTA Header"
    And I click on "EC Type Thank you CTA Button"
    And I set "<CTA Button Text>" to "EC Type Thank you CTA Button"
    And I click on "EC Type Thank you CTA Button Hyperlink"
    And I set "<CTA Hyperlink>" to "EC Type Thank you CTA Button Hyperlink"
    And I pause for 800ms for server to save the values entered
    And I click on "Save"

    # Validate the EC name is as entered
    Then I expect that element "Engagement Card in the Graph" contains the text "<Engagement Card Name>"

    # Update the EC name to lengthy text and verify the node name display in canvas with '..'
    When I mousehover on element "Engagement Card_moreIcon"
    And I mousehover on element "Engagement Card__controlsCover"
    And I click on "Engagement Card editIcon"
    And I clear the inputfield "Engagement Card Name"
    And I set "<Engagement Card Name>" to the inputfield appended with current Date_Time "Engagement Card Name"
    And I pause for 800ms for server to save the values entered
    And I click on "Save"
    Then I expect that element "Engagement Card in the Graph" contains the text "Ha_QA T.."

    #Delete
    When I mousehover on element "Engagement Card_moreIcon"
    And I mousehover on element "Engagement Card__controlsCover"
    And I click on "Engagement Card Delete Icon"

    Then I expect that element "Delete Confirmation Popup" does exist
    And I expect that element "Delete Confirmation Popup" contains the text "Are you sure you want to delete this Element and all the data entered within?"
    And I expect that element "Delete Button in Delete pop-up" does exist
    And I expect that element "Cancel Button in Delete pop-up" does exist

 #  Delete Line Item
    When I click on "Delete Button in Delete pop-up"
    Then I expect that element "Engagement Card in the Graph" does not exist



    Examples:
      |Engagement Card Name|Header Text                  |CTA Button Text |CTA Hyperlink       |
      |Ha_QA Test EC1      |Thank you CTA Header or TITLe|CTA Button Label|https://facebook.com|


#Verify 'Disable' default options selected and Save button is disabled

  Scenario:
     # Engagement Card Edit window with default values.
    When I click on "Create Engagement Card"
    And I mousehover on element "Engagement Card_moreIcon"
    And I mousehover on element "Engagement Card__controlsCover"
    And I click on "Engagement Card editIcon"
    Then I expect that element "Engagement Experience Type Section" does exist

    #'Disable' default options selected and Save button is disabled
    And I expect that element "Engagement Type Disable Option" is selected

    And I expect that element "Save" is not enabled


  Scenario Outline:
# Check default Color#Verify 'Traditional - Thank You CTA' with all required fields (font as GothamMedium, default Font & Button Color and with max characters)
     # Engagement Card Edit window with default values
    When I click on "Create Engagement Card"
    And I mousehover on element "Engagement Card_moreIcon"
    And I mousehover on element "Engagement Card__controlsCover"
    And I click on "Engagement Card editIcon"
    Then I expect that element "Engagement Experience Type Section" does exist
    # Choose Engagement Experience Type
    When I click on "Engagement Type Traditional"
    Then I expect that element "Engagement Type CTA" does exist
     # Enter the fields of the "Thank you CTA"
    When I click on "Engagement Type CTA"
    And I click on "EC Type Thank you CTA Font"
    And I scroll to element "EC Type Thank you CTA Font Value#6"
    And I click on "EC Type Thank you CTA Font Value#6"
    And I click on "EC Type Thank you CTA Header"
    And I set "<Header Text>" to "EC Type Thank you CTA Header"
    # Validate the Default Header Font Color
    Then I expect that element "Message Font Color Icon" does exist
#    And I expect that the css attribute "backgroundColor" of element "Message Font Color Icon" is "rgba(246,230,82,1)"
    And I expect that the css attribute "backgroundColor" of element "Message Font Color Icon" is "rgba(255,255,255,1)"
    When I click on "EC Type Thank you CTA Button"
    And I set "<CTA Button Text>" to "EC Type Thank you CTA Button"
     # Validate the Default Header CTA Button Font Color & Button Color
    Then I expect that element "CTA Button Font Color Icon" does exist
#    And I expect that the css attribute "backgroundColor" of element "CTA Button Font Color Icon" is "rgba(246,230,82,1)"
    And I expect that the css attribute "backgroundColor" of element "CTA Button Font Color Icon" is "rgba(255,255,255,1)"
    And I expect that element "CTA Button Color Icon" does exist
#    And I expect that the css attribute "backgroundColor" of element "CTA Button Color Icon" is "rgba(246,230,82,1)"
    And I expect that the css attribute "backgroundColor" of element "CTA Button Color Icon" is "rgba(255,0,0,1)"
    When I click on "EC Type Thank you CTA Button Hyperlink"
    And I set "<CTA Hyperlink>" to "EC Type Thank you CTA Button Hyperlink"

    Examples:
      |Header Text                                                                                          |CTA Button Text |CTA Hyperlink         |
      |Thank you CTA Header or Title for automation testing result Ready for adventure?Click to learn more! |Click Here      |https://bit.ly/2sZTyQW|


#Fields validation for "Required" and Cancel Functionality

  Scenario:
     # Engagement Card Edit window with default values
    When I click on "Create Engagement Card"
    And I mousehover on element "Engagement Card_moreIcon"
    And I mousehover on element "Engagement Card__controlsCover"
    And I click on "Engagement Card editIcon"
    Then I expect that element "Engagement Experience Type Section" does exist
    And I expect that element "Engagement Type Disable Option" is selected

     # Verify the "Required" for the default fields
    When I clear the inputfield "Engagement Card Name"
    And I click on "Engagement Type Traditional"
    Then I expect that element "Engagement Card Name_Validation" contains the text "Required"
    When I click on "Engagement Type Traditional"
    Then I expect that element "Engagement Type CTA" does exist
    When I click on "Engagement Type CTA"
    And I click on "EC Type Thank you CTA Font"
    And I click on "EC Type Thank you CTA Header"
    Then I expect that element "EC Type Thank you CTA Font_Validation" contains the text "Required"
    When I click on "EC Type Thank you CTA Button"
    Then I expect that element "EC Type Thank you CTA Header_Validation" contains the text "Required"
    When I click on "EC Type Thank you CTA Button Hyperlink"
    Then I expect that element "EC Type Thank you CTA Button_Validation" contains the text "Required"
    And I expect that element "Save" is not enabled



#Validation of Hyperlink field [URL without http or https / URL with http / invalid url by parameter update]

  Scenario Outline:
     # Engagement Card Edit window with default values
    When I click on "Create Engagement Card"
    And I mousehover on element "Engagement Card_moreIcon"
    And I mousehover on element "Engagement Card__controlsCover"
    And I click on "Engagement Card editIcon"
    Then I expect that element "Engagement Experience Type Section" does exist

    # Choose Engagement Experience Type
    When I click on "Engagement Type Traditional"
    Then I expect that element "Engagement Type CTA" does exist

     # Enter the fields of the "Thank you CTA"
    When I click on "Engagement Type CTA"
    And I click on "EC Type Thank you CTA Font"
    And I scroll to element "EC Type Thank you CTA Font Value#6"
    And I click on "EC Type Thank you CTA Font Value#6"
    And I click on "EC Type Thank you CTA Header"
    And I set "<Header Text>" to "EC Type Thank you CTA Header"
    And I click on "EC Type Thank you CTA Button"
    And I set "<CTA Button Text>" to "EC Type Thank you CTA Button"
    And I click on "EC Type Thank you CTA Button Hyperlink"
    And I set "<CTA Hyperlink>" to "EC Type Thank you CTA Button Hyperlink"
    And I click on "Engagement Type CTA"

     #Validate the CTA destinationUrl
    Then I expect that element "CTA Hyperlink_Validation" contains the text "Please enter valid URL with https:// at the beginning"

    Examples:
      |Header Text                   |CTA Button Text |CTA Hyperlink         |
      |Thank you CTA Header or Title |CTA Button Label|bit.ly/2sZTyQW        |
      |Thank you CTA Header or Title |CTA Button Label|http://bit.ly/2sZTyQW |
      |Thank you CTA Header or Title |CTA Button Label|https://bit           |


##Verify the Color Picker Width and Height for Header and CTA Button; Changing the Font colors to Red and Button colors to Blue

  Scenario Outline:
     # Engagement Card Edit window with default values
    When I click on "Create Engagement Card"
    And I mousehover on element "Engagement Card_moreIcon"
    And I mousehover on element "Engagement Card__controlsCover"
    And I click on "Engagement Card editIcon"
    Then I expect that element "Engagement Experience Type Section" does exist
    And I expect that element "Engagement Type Disable Option" is selected

    # Enter Engagement Card fields Name and choose Engagement Experience Type
    When I clear the inputfield "Engagement Card Name"
    And I set "<Engagement Card Name>" to "Engagement Card Name"
    And I click on "Engagement Type Traditional"
    Then I expect that element "Engagement Type CTA" does exist

     # Enter the fields of the " Thank you CTA"
    When I click on "Engagement Type CTA"
    And I click on "EC Type Thank you CTA Font"
    And I scroll to element "EC Type Thank you CTA Font Value"
    And I click on "EC Type Thank you CTA Font Value"
    And I click on "EC Type Thank you CTA Header"
    And I set "<Header Text>" to "EC Type Thank you CTA Header"

    #Validate the Header Color Icon and Chrome Picker Width and Height
    And I click on "Message Font Color Icon"
    Then I expect that element "Sketch_Picker" does exist
    And I expect that the css attribute "width" of element "Sketch_Picker" is "225px"
  #  And I expect that the css attribute "height" of element "Sketch_Picker" is "241.75px"

     #Chaning the Header font Color to Red
    When I click on the "Sketch_Picker HEX"
    And I set "<Sketch_Picker Font HEX>" to "Sketch_Picker HEX"
    And I click on "Close Message Font Color Icon"
    Then I expect that the css attribute "backgroundColor" of element "Message Font Color Icon" is "rgba(255,255,0,0)"
    When I click on "EC Type Thank you CTA Button"
    And I set "<CTA Button Text>" to "EC Type Thank you CTA Button"

     #Validate the CTA Button Font Color Icon and Chrome Picker Width and Height
    And I click on "CTA Button Font Color Icon"
    Then I expect that element "Sketch_Picker" does exist
    And I expect that the css attribute "width" of element "Sketch_Picker" is "225px"
   # And I expect that the css attribute "height" of element "Sketch_Picker" is "241.75px"

     #Chaning the CTA Button font Color to Red
    When I click on the "Sketch_Picker HEX"
    And I set "<Sketch_Picker Font HEX>" to "Sketch_Picker HEX"
    And I click on "Close CTA Button Font Color Icon"
    Then I expect that the css attribute "backgroundColor" of element "CTA Button Font Color Icon" is "rgba(255,255,0,0)"


     #Validate the CTA Button Color Icon and Chrome Picker Width and Height
    When I click on "CTA Button Color Icon"
    Then I expect that element "Sketch_Picker" does exist
    And I expect that the css attribute "width" of element "Sketch_Picker" is "225px"
  #  And I expect that the css attribute "height" of element "Sketch_Picker" is "241.75px"

     #Chaning the CTA Button Color to Blue
    When I click on the "Sketch_Picker HEX"
    And I set "<Sketch_Picker Button HEX>" to "Sketch_Picker HEX"
    And I click on "Close CTA Button Color Icon"
    Then I expect that the css attribute "backgroundColor" of element "CTA Button Color Icon" is "rgba(153,85,102,0.533)"

    Examples:
      |Engagement Card Name   |Header Text                   |CTA Button Text | Sketch_Picker Font HEX | Sketch_Picker Button HEX |
      |Auto_QA Test EE-TYCTA  |Thank you CTA Header or Title |CTA Button Label| #FF0000                | #9568ff                  |


#Verify the Header & CTA Button Text Character Count Validation as per the value entered

  Scenario Outline:
     # Engagement Card Edit window with default values
    When I click on "Create Engagement Card"
    And I mousehover on element "Engagement Card_moreIcon"
    And I mousehover on element "Engagement Card__controlsCover"
    And I click on "Engagement Card editIcon"
    Then I expect that element "Engagement Experience Type Section" does exist

    # Choose Engagement Experience Type
    When I click on "Engagement Type Traditional"
    Then I expect that element "Engagement Type CTA" does exist

     # Enter the fields of the "Thank you CTA"
    When I click on "Engagement Type CTA"
    And I click on "EC Type Thank you CTA Font"
    And I scroll to element "EC Type Thank you CTA Font Value#6"
    And I click on "EC Type Thank you CTA Font Value#6"

    #Validate the Validate EE Type Thank you CTA Header character count before and after entering text
    Then I expect that element "CTA Message Character Count" contains the text "0/100"
    When I click on "EC Type Thank you CTA Header"
    And I set "<Header Text>" to "EC Type Thank you CTA Header"
    And I store the count from the field "CTA Message Character Count" as "CTA Message Text Characters Entered"
    Then I expect that character count "CTA Message Text Characters Entered" of the field is as per the value's "<Header Text>" length
    And I expect that element "CTA Message Character Count" contains the text "29/100"

     #Validate the Validate EE Type Thank you CTA Button character count before and after entering text
    And I expect that element "CTA Button Character Count" contains the text "0/10"
    When I click on "EC Type Thank you CTA Button"
    And I set "<CTA Button Text>" to "EC Type Thank you CTA Button"
    And I store the count from the field "CTA Button Character Count" as "CTA Button Text Characters Entered"
    Then I expect that character count "CTA Button Text Characters Entered" of the field is as per the value's "<CTA Button Text>" length
    And I expect that element "CTA Button Character Count" contains the text "10/10"

    Examples:
      |Header Text                   |CTA Button Text |
      |Thank you CTA Header or Title |Click Here      |


#Edit Creative for a newly created Creative that has existing EE - Thank You CTA
  Scenario Outline:
     # Engagement Card Edit window with default values
    When I click on "Create Engagement Card"
    And I mousehover on element "Engagement Card_moreIcon"
    And I mousehover on element "Engagement Card__controlsCover"
    And I click on "Engagement Card editIcon"
    Then I expect that element "Engagement Experience Type Section" does exist

    # Choose Engagement Experience Type
    When I click on "Engagement Type Traditional"
    Then I expect that element "Engagement Type CTA" does exist

     # Enter the fields of the "Thank you CTA"
    When I click on "Engagement Type CTA"
    And I click on "EC Type Thank you CTA Font"
    And I scroll to element "EC Type Thank you CTA Font Value#6"
    And I click on "EC Type Thank you CTA Font Value#6"
    And I click on "EC Type Thank you CTA Header"
    And I set "<Header Text>" to "EC Type Thank you CTA Header"
    And I click on "EC Type Thank you CTA Button"
    And I set "<CTA Button Text>" to "EC Type Thank you CTA Button"
    And I click on "EC Type Thank you CTA Button Hyperlink"
    And I set "<CTA Hyperlink>" to "EC Type Thank you CTA Button Hyperlink"
    And I click on "Save"

     # Edit EE
    And I click on "Back"
    When I click on "Campaign Name Link"
    And I expect that element "Creative Graph" does exist
    And I expect that element "Engagement Experience" does exist
    And I expect that element "Engagement Card 1" does exist
    And I expect that the css attribute "transform" of element "Engagement Card in the Graph" is "matrix(1, 0, 0, 1, 100, 30)"
    When I set the "transform" attribute of the "Engagement Card 1" to "translate(230,230)"
    And I mousehover on element "Engagement Card_moreIcon"
    And I mousehover on element "Engagement Card__controlsCover"
    And I click on "Engagement Card editIcon"
    Then I expect that element "Engagement Experience Type Section" does exist

     # Update the fields of the "Thank you CTA"
    When I click on "Edit Thank you CTA Font"
    And I scroll to element "EC Type Thank you CTA Font Value#6"
    And I click on "EC Type Thank you CTA Font Value"
    And I clear the inputfield "EC Type Thank you CTA Header"
    And I set "<Edit Header Text>" to "EC Type Thank you CTA Header"
    And I clear the inputfield "EC Type Thank you CTA Button"
    And I set "<Edit CTA Button Text>" to "EC Type Thank you CTA Button"
    And I clear the inputfield "EC Type Thank you CTA Button Hyperlink"
    And I set "<Edit CTA Hyperlink>" to "EC Type Thank you CTA Button Hyperlink"


    Examples:
      |Header Text                                                                                          |CTA Button Text |CTA Hyperlink         | Edit Header Text | Edit CTA Button Text | Edit CTA Hyperlink   |
      |Thank you CTA Header or Title for automation testing result Ready for adventure?Click to learn more! |Click Here      |https://bit.ly/2sZTyQW| Edit Header Text |Edit Click            |https://bit.ly/2sZTyQW|



