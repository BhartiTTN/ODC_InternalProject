Feature: ODC-690 , ODC-691 and ODC-710

  Background: I am editing a targeting node of a new campaign
    Given I have a Campaign named "AutoCampaignName" under Account "QA_ViralGains"
    And that Campaign has a Targeting Node named "Targeting 1"
    And That "Targeting" node is updated to be named "Targeting 1", and have x position "300" and y position "300"
    And I am on the canvas screen for the newly created campaign


    And I mousehover on element "Targeting__moreIcon"
    And I mousehover on element "Targeting__controlsCover"
    And I click on "Targeting__editIcon"


  Scenario: Testing for User Initiation
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-User Initiation"
    Then I expect that checkbox "Auto Play Muted Checkbox Status" is checked
    And I expect that checkbox "Auto Play Unmuted Checkbox Status" is checked
    And I expect that checkbox "Click to Play Checkbox Status" is checked

    When I click on "Update Auto Play Muted Checkbox"
    And I click on the "Add Targeting Criteria Button"
    And I click on "Save"
    #Update Targeting

    And I mousehover on element "Targeting__moreIcon"
    And I mousehover on element "Targeting__controlsCover"
    And I click on "Targeting__editIcon"
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-User Initiation"
    # Save and reopen targeting

    Then I expect that element "Included Targetings" contains the text "Auto Play Unmuted, Click to Play"

    When I click on "Update Auto Play Unmuted Checkbox"
    And I click on "Update Click to Play Checkbox"
    Then I expect that element "Included Targetings" contains the text "Auto Play Unmuted, Click to Play"


  Scenario: Testing for Device
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-Device"
    Then I expect that checkbox "Desktop Checkbox Status" is checked
    And I expect that checkbox "Mobile Checkbox Status" is checked
    And I expect that checkbox "Tablet Checkbox Status" is checked

    When I click on "Update Desktop Checkbox"
    And I click on "Add Targeting Criteria Button"
    And I click on "Save"
    #Update Targeting

    And I mousehover on element "Targeting__moreIcon"
    And I mousehover on element "Targeting__controlsCover"
    And I click on "Targeting__editIcon"
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-Device"
    # Save and reopen targeting

    Then I expect that the Grid element "Included Targetings" does contain the text "Mobile, Tablet"

    When I click on "Update Mobile Checkbox"
    And I click on "Update Tablet Checkbox"
    Then I expect that the Grid element "Included Targetings" does contain the text "Mobile, Tablet"


  Scenario: Testing for Environment
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-Environment"
    Then I expect that checkbox "Web Checkbox Status" is checked
    And I expect that checkbox "App Checkbox Status" is checked

    When I click on "Update Web Checkbox"
    And I click on "Add Targeting Criteria Button"
    And I click on "Save"
#Update Targeting

    And I mousehover on element "Targeting__moreIcon"
    And I mousehover on element "Targeting__controlsCover"
    And I click on "Targeting__editIcon"
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-Environment"
# Save and reopen targeting

    Then I expect that the Grid element "Included Targetings" does contain the text "App"

    When I click on "Update App Checkbox"
    Then I expect that the Grid element "Included Targetings" does contain the text "App"

    Scenario: Testing for Video Aspect Ratio
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-Video Aspect Ratio"
    Then I expect that checkbox "Horizontal Checkbox Status" is checked
    And I expect that checkbox "Vertical Checkbox Status" is checked

    When I click on "Update Horizontal Checkbox"
    And I click on "Add Targeting Criteria Button"
    And I click on "Save"
#Update Targeting

    And I mousehover on element "Targeting__moreIcon"
    And I mousehover on element "Targeting__controlsCover"
    And I click on "Targeting__editIcon"

  # reopen targeting
  Then I expect that the Grid element "Included Targetings" does contain the text "Vertical"


    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-Video Aspect Ratio"

    When I click on "Update Vertical Checkbox"
    And I click on "Add Targeting Criteria Button"
    Then I expect that the Grid element "Included Targetings" does contain the text "Horizontal"


  Scenario: Testing for Placement Type
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-Placement Type"
    Then I expect that checkbox "Out-Stream Checkbox Status" is checked
    And I expect that checkbox "In-Stream Checkbox Status" is checked
    And I expect that checkbox "MRAID Interstitial (Video) Checkbox Status" is checked
    And I expect that checkbox "Other Placement Checkbox Status" is checked

    When I click on "Update In-Stream Checkbox"
    And I click on "Add Targeting Criteria Button"
    And I click on "Save"
#Update Targeting

    And I mousehover on element "Targeting__moreIcon"
    And I mousehover on element "Targeting__controlsCover"
    And I click on "Targeting__editIcon"
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-Placement Type"
# Save and reopen targeting

    Then I expect that the Grid element "Included Targetings" does contain the text "Out-Stream, MRAID Interstitial (Video), Other Placement"

    When I click on "Update Out-Stream Checkbox"
    And I click on "Update MRAID Interstitial (Video) Checkbox"
    And I click on "Update Other Placement Checkbox"
    Then I expect that the Grid element "Included Targetings" does contain the text "Out-Stream, MRAID Interstitial (Video), Other Placement"
    

    Scenario: Testing Multiple Includes and Excludes
      When I click on "Targeting Type Dropdown"
      And I click on "Zipcode" in the drop down
      And I click on "Include_Exclude dropdown"
      And I click on "Exclude" in the drop down
      And I select file "Zip_CSV.csv" of type "csv" for the element "Browse link"
      And I click on "Add Targeting button"

      And I click on "Targeting Type Dropdown"
      And I click on "User Initiation" in the drop down
      And I click on the "Add Targeting Criteria Button"

      And I click on "Targeting Type Dropdown"
      And I click on "Device" in the drop down
      And I click on "Add Targeting Criteria Button"

      And I click on "Save"
      And I mousehover on element "Targeting__moreIcon"
      And I mousehover on element "Targeting__controlsCover"
      And I click on "Targeting__editIcon"

      Then I expect that the Grid element "Excluded Targetings" does contain the text "Zip_CSV.csv"
      And I expect that the Grid element "Included Targetings" does contain the text "Auto Play Muted, Auto Play Unmuted, Click to Play"
      And I expect that the Grid element "Included Targetings" does contain the text "Desktop, Mobile, Tablet"



  # ODC-710

  Scenario Outline: Verify Site List URL entered is selected and displayed in create and edit Targeting node window
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-Site List"
    And I click on "Include_Exclude dropdown"
    And I click on "Include_Exclude Value-Exclude"

   # Select a Site List
    And I set "<Site URL>" to "Site List Inputfield"
    And I click on "Site URL Menu"
    And I click on "Add Targeting button"

    Then I expect that element "File uploaded category Label section" contains the text "EXCLUDE"
    And I expect that element "File uploaded category value section" contains the text "Site List"
    And I expect that element "File uploaded display value section" contains the text "<Site URL>"
    And I expect that element "File upload display section close button" does exist
    And I expect that element "Save" is enabled

   # Remove the file uploaded Site URL by clicking on X button
    When I click on "Remove button on file"
    Then I expect that element "Save" is not enabled

  #Upload another Site URL
    When I set "<Another Site URL>" to "Site List Inputfield"
    And I click on "Site URL Menu"
    And I click on "Add Targeting button"

    Then I expect that element "File uploaded category Label section" contains the text "EXCLUDE"
    And I expect that element "File uploaded category value section" contains the text "Site List"
    And I expect that element "File uploaded display value section" contains the text "<Another Site URL>"
    And I expect that element "File upload display section close button" does exist

    And I click on "Save"

    #reopen the Targeting node
    When I mousehover on element "Targeting__moreIcon"
    And I mousehover on element "Targeting__controlsCover"
    And I click on "Targeting__editIcon"

    # Verify the Site List URL uploaded display section
    Then I expect that element "File uploaded category Label section" contains the text "EXCLUDE"
    And I expect that element "File uploaded category value section" contains the text "Site List"
    And I expect that element "File uploaded display value section" contains the text "<Another Site URL>"
    And I expect that element "File upload display section close button" does exist
    And I expect that element "Save" is not enabled

    Examples:
    |Site URL         |Another Site URL   |
    |https://ebay.com |https://youtube.com|



  # ODC-691


  Scenario Outline: Verify Inventory Size in create and edit Targeting node window with multiple values

    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-Inventory Size"

   # Enter Inventory Size
    And I set "<Min Width>" to "Min Width"
    And I set "<Min Height>" to "Min Height"
    And I click on "Add Targeting button"

    Then I expect that element "File uploaded category Label section" contains the text "INCLUDE"
    And I expect that element "File uploaded category value section" contains the text "Inventory Size"
    And I expect that element "File uploaded display value section" contains the text "Min Width : <Min Width>, Min Height : <Min Height>"
    And I expect that element "File upload display section close button" does exist
    And I expect that element "Save" is enabled

   # Remove the file uploaded Site URL by clicking on X button
    When I click on "Remove button on file"
    Then I expect that element "Save" is not enabled

  # Re-Enter Inventory Size
    And I set "<Updated Min Width>" to "Min Width"
    And I set "<Updated Min Height>" to "Min Height"
    And I click on "Add Targeting button"

    Then I expect that element "File uploaded category Label section" contains the text "INCLUDE"
    And I expect that element "File uploaded category value section" contains the text "Inventory Size"
    And I expect that element "File uploaded display value section" contains the text "Min Width : <Updated Min Width>, Min Height : <Updated Min Height>"
    And I expect that element "File upload display section close button" does exist
    And I expect that element "Save" is enabled

    And I click on "Save"

    #reopen the Targeting node
    When I mousehover on element "Targeting__moreIcon"
    And I mousehover on element "Targeting__controlsCover"
    And I click on "Targeting__editIcon"

    Then I expect that element "File uploaded category Label section" contains the text "INCLUDE"
    And I expect that element "File uploaded category value section" contains the text "Inventory Size"
    And I expect that element "File uploaded display value section" contains the text "Min Width : <Updated Min Width>, Min Height : <Updated Min Height>"
    And I expect that element "File upload display section close button" does exist
    And I expect that element "Save" is not enabled

    Examples:
      |Min Width|Min Height |Updated Min Width|Updated Min Height|
      |1234     |1234       |350              |350               |



  Scenario Outline: Verify adding Inventory Size and Zipcode file in create Targeting node window

  # Now Targeting type : Inventory Size
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-Inventory Size"

    # Enter Inventory Size values
    And I set "<Min Width>" to "Min Width"
    And I set "<Min Height>" to "Min Height"
    And I click on "Add Targeting button"

    Then I expect that element "File uploaded category Label section" contains the text "INCLUDE"
    And I expect that element "File uploaded category value section" contains the text "Inventory Size"
    And I expect that element "File uploaded display value section" contains the text "Min Width : <Min Width>, Min Height : <Min Height>"
    And I expect that element "File upload display section close button" does exist
    And I expect that element "Save" is enabled

  # Now add another Targetign type : Zipcode
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-Zipcode"
    And I click on "Include_Exclude dropdown"
    And I click on "Include_Exclude Value-Exclude"

    # Select a file
    When I select file "Zip_CSV.csv" of type "csv" for the element "Browse link"
    And I click on "Add Targeting button"
    And I expect that element "Targeting file uploaded message" contains the text "File uploaded successfully"
    And I expect that element "File uploaded category Label section" contains the text "EXCLUDE"
    And I expect that element "File uploaded category value section" contains the text "Zipcode"
    And I expect that element "File uploaded display value section" contains the text "Zip_CSV.csv"
    And I expect that element "File upload display section close button" does exist


    Examples:
      |Min Width|Min Height |
      |1234     |1234       |




  Scenario Outline: Enter Width field for Targeting Type Inventory Size and then clear the Height entered

    # Now Targeting type : Inventory Size
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-Inventory Size"

      # Enter Inventory Size values -Width
    And I set "<Min Width>" to "Min Width"
    And I click on "Add Targeting button"

    Then I expect that element "File uploaded category Label section" contains the text "INCLUDE"
    And I expect that element "File uploaded category value section" contains the text "Inventory Size"
    And I expect that element "File uploaded display value section" contains the text "Min Width : <Min Width>"
    And I expect that element "File upload display section close button" does exist
    And I expect that element "Save" is enabled

    And I clear the inputfield "Min Width"
    And I set "<Updated Min Width>" to "Min Width"
    And I set "<Min Height>" to "Min Height"
    And I click on "Add Targeting button"

    Then I expect that element "File uploaded category Label section" contains the text "INCLUDE"
    And I expect that element "File uploaded category value section" contains the text "Inventory Size"
    And I expect that element "File uploaded display value section" contains the text "Min Width : <Updated Min Width>, Min Height : <Min Height>"
    And I expect that element "File upload display section close button" does exist
    And I expect that element "Save" is enabled

    Examples:
      |Min Width|Min Height |Updated Min Width|
      |1234     |1234       |400              |
