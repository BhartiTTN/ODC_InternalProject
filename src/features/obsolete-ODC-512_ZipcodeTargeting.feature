Feature: ODC-512 Targeting Box (Node) creation and ODC-490 Zipcode Targeting validation and ODC-742 Download Zipfile

  Background: I am on the canvas page of a new campaign
    And I have a Campaign named "AutoCampaignName" under Account "QA_ViralGains" and I am on the canvas screen


##Verify the default position and multiple Targeting icons that appear on the canvas UI that many times user clicks on Targeting Icon.

  Scenario:
    Then I expect that element "Create Targeting Icon" does exist

  Scenario:
      # Targeting 1
    When I click on "Create Targeting Icon"
    Then I expect that element "Targeting 1" does exist
    And I expect that element "Targeting 2" does not exist
    Then I expect that the css attribute "transform" of element "Targeting in the Graph" is "matrix(1, 0, 0, 1, 100, 30)"
    And I set the "transform" attribute of the "Targeting 1" to "translate(230,230)"

    # Targeting 2
    When I click on "Create Targeting Icon"
    Then I expect that element "Targeting 2" does exist
    And I pause for 400ms
    #And I expect that the css attribute "transform" of element "Targeting 2" is "matrix(1, 0, 0, 1, 100, 30)"
    And I set the "transform" attribute of the "Targeting 2" to "translate(330,170)"

    # Targeting 3
    When I click on "Create Targeting Icon"
    Then I expect that element "Targeting 3" does exist
    #And I expect that the css attribute "transform" of element "Targeting 3" is "matrix(1, 0, 0, 1, 100, 30)"


# Delete and then Add a new Targeting for a campaign
  #; validate Delete confirmation message and while Editing enter new Targeting name

  Scenario:
    When I click on "Create Targeting Icon"
    And I set the "transform" attribute of the "Targeting 1" to "translate(230,230)"
    And I mousehover on element "Targeting__moreIcon"

#    Delete the Targeting node from Canvas UI
    And I mousehover on element "Targeting__controlsCover"
    And I click on "Targeting__deleteIcon"

    Then I expect that element "Delete Confirmation Popup" does exist
    And I expect that element "Delete Confirmation Popup" contains the text "Are you sure you want to delete this Element and all the data entered within?"
    And I expect that element "Delete Button in Delete pop-up" does exist
    And I expect that element "Cancel Button in Delete pop-up" does exist

 #  Delete Targeting
    When I click on "Delete Button in Delete pop-up"
    Then I expect that element "Targeting 1" does not exist

# # Create new Targeting ( currently DELETE is not deleting permanently in DB , hence Targeting Already Exists Error is pop-in up
    #when below lines are executed (#TODO Phase 2)
#    When I click on "Create Targeting Icon"
#    And I mousehover on element "Targeting__moreIcon"
#    And I mousehover on element "Targeting__controlsCover"
#    And I click on "Targeting__editIcon"
#    And I clear the inputfield "Targeting Name"
#    When I set "<Targeting Name>" to the inputfield appended with current Date_Time "Targeting Name"
#    And I pause for 800ms
#    And I click on "Save"
#    Then I expect that element "Targeting Title" contains the text "<Targeting Name>"





# Verify the doubleClick on the Tracking Icon and then On Tracking Box Opens the Creative Modal Window

  Scenario:
   # Creative 1 - doubleClick option verification
    When I doubleClick on "Create Targeting Icon"
    Then I expect that element "Targeting 1" does exist

## ODC-490

  ## verify uploading a csv file for Zipcodes targeting type and save the target node

  Scenario Outline:
 # Create new Targeting
    When I click on "Create Targeting Icon"
    And I mousehover on element "Targeting__moreIcon"
    And I mousehover on element "Targeting__controlsCover"
    And I click on "Targeting__editIcon"
    And I clear the inputfield "Targeting Name"
    And I set "<Targeting Name>" to "Targeting Name"
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-Zipcode"
    And I click on "Include_Exclude dropdown"
    And I click on "Include_Exclude Value-Include"

    # Select a file and validate the Node is saved
    When I select file "Zip_CSV.csv" of type "csv" for the element "Browse link"
    And I click on "Add Targeting button"
   # Then I expect that element "Targeting file uploaded message" contains the text "Validating file..."
    And I expect that element "Targeting file uploaded message" contains the text "File uploaded successfully"
    And I click on "Save"
    Then I expect that element "Targeting Title" contains the text "<Targeting Name>"

    Examples:
      |Targeting Name|
      |HA_Targeting  |


    # ODC-742 verification included in the feature steps below
 ##  verify uploading a csv file with name having single quote for zipcodes

  Scenario:
    # Create new Targeting with Include
    When I click on "Create Targeting Icon"
    And I mousehover on element "Targeting__moreIcon"
    And I mousehover on element "Targeting__controlsCover"
    And I click on "Targeting__editIcon"
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-Zipcode"
    And I click on "Include_Exclude dropdown"
    And I click on "Include_Exclude Value-Include"

    # Select a file that has single quote to upload and verify the display section columns once the file is uploaded
    When I select file "Zip_CS'V.csv" of type "csv" for the element "Browse link"
    And I click on "Add Targeting button"
  #  Then I expect that element "Targeting file uploaded message" contains the text "Validating file..."
    And I expect that element "Targeting file uploaded message" contains the text "File uploaded successfully"
    And I expect that element "File uploaded category Label section" contains the text "INCLUDE"
    And I expect that element "File uploaded category value section" contains the text "Zipcode"
    And I expect that element "File uploaded display value section" contains the text "Zip_CS'V.csv"
    And I expect that element "Download File Icon" does exist
    And I click on "Download File Icon"
    And I expect that element "File upload display section close button" does exist

 ##  Verify uploading a csv file that has special characters in the file name that we upload
  Scenario Outline:
 # Create new Targeting
    When I click on "Create Targeting Icon"
    And I mousehover on element "Targeting__moreIcon"
    And I mousehover on element "Targeting__controlsCover"
    And I click on "Targeting__editIcon"
    And I clear the inputfield "Targeting Name"
    And I set "<Targeting Name>" to "Targeting Name"
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-Zipcode"
    And I click on "Include_Exclude dropdown"
    And I click on "Include_Exclude Value-Include"

    # Select a file that has special characters in the file name that we upload
    When I select file "Z%^ip_CS!V$.csv" of type "csv" for the element "Browse link"
    And I click on "Add Targeting button"
  #  Then I expect that element "Targeting file uploaded message" contains the text "Validating file..."
    And I expect that element "Targeting file uploaded message" contains the text "File uploaded successfully"
    When I click on "Save"
    Then I expect that element "Targeting Title" contains the text "<Targeting Name>"

    Examples:
      |Targeting Name|
      |HA_Targeting  |


 ##  Verify uploading a incorrect format file to validate the message- Error in zip code file
  Scenario:
 # Create new Targeting
    When I click on "Create Targeting Icon"
    And I mousehover on element "Targeting__moreIcon"
    And I mousehover on element "Targeting__controlsCover"
    And I click on "Targeting__editIcon"
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-Zipcode"
    And I click on "Include_Exclude dropdown"
    And I click on "Include_Exclude Value-Include"

    # Select a file that has special characters in the file name that we upload
    When I select file "CSVSample_actions.txt" of type "txt" for the element "Browse link"
    And I click on "Add Targeting button"
  #  Then I expect that element "Targeting file uploaded message" contains the text "Validating file..."
    And I expect that element "Targeting file uploaded message" contains the text "Error in zip code file"

 ##  Verify file upload display section in Edit Targeting mode
  Scenario:
 # Create new Targeting
    When I click on "Create Targeting Icon"
    And I mousehover on element "Targeting__moreIcon"
    And I mousehover on element "Targeting__controlsCover"
    And I click on "Targeting__editIcon"
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-Zipcode"
    And I click on "Include_Exclude dropdown"
    And I click on "Include_Exclude Value-Include"

    # Select a file that has special characters in the file name that we upload
    When I select file "Zip_CSV.csv" of type "csv" for the element "Browse link"
    And I click on "Add Targeting button"
  #  Then I expect that element "Targeting file uploaded message" contains the text "Validating file..."
    And I expect that element "Targeting file uploaded message" contains the text "File uploaded successfully"
    And I click on "Save"

    # TODO: pdate the Target name to lengthy (max length of the targeting node) and verify the node name display in canvas with '..'

    When I mousehover on element "Targeting__moreIcon"
    And I mousehover on element "Targeting__controlsCover"
    And I click on "Targeting__editIcon"

    # File uploaded display section
    Then I expect that element "File uploaded category Label section" contains the text "INCLUDE"
    And I expect that element "File uploaded category value section" contains the text "Zipcode"
    And I expect that element "File uploaded display value section" contains the text "Zip_CSV.csv"
    And I expect that element "File upload display section close button" does exist
    And I expect that element "Save" is not enabled


 ##  Verify Close button functionality in the file upload section and reselect another file

  Scenario:
 # Create new Targeting with Zipcode
    When I click on "Create Targeting Icon"
    And I mousehover on element "Targeting__moreIcon"
    And I mousehover on element "Targeting__controlsCover"
    And I click on "Targeting__editIcon"
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-Zipcode"
    And I click on "Include_Exclude dropdown"
    And I click on "Include_Exclude Value-Include"

    # Select a file
    When I select file "Zip_CSV.csv" of type "csv" for the element "Browse link"
    And I click on "Add Targeting button"
  #  Then I expect that element "Targeting file uploaded message" contains the text "Validating file..."
    And I expect that element "Targeting file uploaded message" contains the text "File uploaded successfully"
    And I click on "Save"

    # Open the targeting  node
    When I mousehover on element "Targeting__moreIcon"
    And I mousehover on element "Targeting__controlsCover"
    And I click on "Targeting__editIcon"

    # verify the file uploaded display section
    Then I expect that element "File uploaded category Label section" contains the text "INCLUDE"
    And I expect that element "File uploaded category value section" contains the text "Zipcode"
    And I expect that element "File uploaded display value section" contains the text "Zip_CSV.csv"
    And I expect that element "File upload display section close button" does exist
    And I expect that element "Save" is not enabled

    # Remove the file uploaded by clicking on X button
    When I click on "File upload display section close button"
    # Then I expect that element "Save" is not enabled

    #Reselect the File
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-Zipcode"
    And I click on "Include_Exclude dropdown"
    And I click on "Include_Exclude Value-Exclude"
    Then I expect that element "Targeting file uploaded message" does not exist

    When I select file "Z%^ip_CS!V$.csv" of type "csv" for the element "Browse link"
    And I click on "Add Targeting button"
  #  Then I expect that element "Targeting file uploaded message" contains the text "Validating file..."
    And I expect that element "Targeting file uploaded message" contains the text "File uploaded successfully"
    And I expect that element "File uploaded category Label section" contains the text "EXCLUDE"
    And I expect that element "File uploaded category value section" contains the text "Zipcode"
    And I expect that element "File uploaded display value section" contains the text "Z%^ip_CS!V$.csv"
    And I expect that element "File upload display section close button" does exist


## Remove uploaded file by clicking on the X button present in the file and re-upload new valid file
  Scenario:
# Create new Targeting with Zipcode
    When I click on "Create Targeting Icon"
    And I mousehover on element "Targeting__moreIcon"
    And I mousehover on element "Targeting__controlsCover"
    And I click on "Targeting__editIcon"
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-Zipcode"
    And I click on "Include_Exclude dropdown"
    And I click on "Include_Exclude Value-Exclude"

   # Select a file
    When I select file "Zip_CSV.csv" of type "csv" for the element "Browse link"
    And I click on "Add Targeting button"
  #  Then I expect that element "Targeting file uploaded message" contains the text "Validating file..."
    And I expect that element "Targeting file uploaded message" contains the text "File uploaded successfully"
    And I expect that element "File uploaded category Label section" contains the text "EXCLUDE"
    And I expect that element "File uploaded category value section" contains the text "Zipcode"
    And I expect that element "File uploaded display value section" contains the text "Zip_CSV.csv"
    And I expect that element "File upload display section close button" does exist

    And I expect that element "Save" is enabled

   # Remove the file uploaded by clicking on X button on the File
    When I click on "Remove button on file"
    Then I expect that element "Save" is not enabled

   #Upload another valid file
    When I select file "newMAPResult.csv" of type "csv" for the element "Browse link"
    And I click on "Add Targeting button"
  #  Then I expect that element "Targeting file uploaded message" contains the text "Validating file..."
    And I expect that element "Targeting file uploaded message" contains the text "File uploaded successfully"
    And I expect that element "File uploaded category Label section" contains the text "EXCLUDE"
    And I expect that element "File uploaded category value section" contains the text "Zipcode"
    And I expect that element "File uploaded display value section" contains the text "newMAPResult.csv"
    And I expect that element "File upload display section close button" does exist


  ## Remove uploaded file by clicking on the X button present in the file and re-upload same valid file
  Scenario:
# Create new Targeting with Zipcode
    When I click on "Create Targeting Icon"
    And I mousehover on element "Targeting__moreIcon"
    And I mousehover on element "Targeting__controlsCover"
    And I click on "Targeting__editIcon"
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-Zipcode"
    And I click on "Include_Exclude dropdown"
    And I click on "Include_Exclude Value-Exclude"

   # Select a file
    When I select file "Zip_CSV.csv" of type "csv" for the element "Browse link"
    And I click on "Add Targeting button"
  #  Then I expect that element "Targeting file uploaded message" contains the text "Validating file..."
    And I expect that element "Targeting file uploaded message" contains the text "File uploaded successfully"
    And I expect that element "File uploaded category Label section" contains the text "EXCLUDE"
    And I expect that element "File uploaded category value section" contains the text "Zipcode"
    And I expect that element "File uploaded display value section" contains the text "Zip_CSV.csv"
    And I expect that element "File upload display section close button" does exist

    And I expect that element "Save" is enabled

   # Remove the file uploaded by clicking on X button on the File
    When I click on "Remove button on file"
    Then I expect that element "Save" is not enabled

   #Upload another valid file
    When I select file "Zip_CSV.csv" of type "csv" for the element "Browse link"
    And I click on "Add Targeting button"
  #  Then I expect that element "Targeting file uploaded message" contains the text "Validating file..."
    And I expect that element "Targeting file uploaded message" contains the text "File uploaded successfully"
    And I expect that element "File uploaded category Label section" contains the text "EXCLUDE"
    And I expect that element "File uploaded category value section" contains the text "Zipcode"
    And I expect that element "File uploaded display value section" contains the text "Zip_CSV.csv"
    And I expect that element "File upload display section close button" does exist


## Invalid format data file and error message
  Scenario:
 # Create new Targeting
    When I click on "Create Targeting Icon"
    And I mousehover on element "Targeting__moreIcon"
    And I mousehover on element "Targeting__controlsCover"
    And I click on "Targeting__editIcon"
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-Zipcode"
    And I click on "Include_Exclude dropdown"
    And I click on "Include_Exclude Value-Include"

    # Select a file that has special characters in the file name that we upload
    When I select file "wrongFormatZipCodes.csv" of type "csv" for the element "Browse link"
    And I click on "Add Targeting button"
    Then I expect that element "Targeting file uploaded message" contains the text "Error in zip code file"
    And I expect that element "Save" is not enabled

