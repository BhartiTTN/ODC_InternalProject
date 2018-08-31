Feature: ODC-761 DMA Targeting validation

  Background: I am on the canvas page of a new campaign
    And I have a Campaign named "AutoCampaignName" under Account "QA_ViralGains" and I am on the canvas screen


  ## verify uploading a csv file for DMA targeting type and save the target node

  Scenario Outline:
 # Create new Targeting
    When I click on "Create Targeting Icon"
    And I mousehover on element "Targeting__moreIcon"
    And I mousehover on element "Targeting__controlsCover"
    And I click on "Targeting__editIcon"
    And I clear the inputfield "Targeting Name"
    And I set "<Targeting Name>" to "Targeting Name"
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-DMA"
    And I click on "Include_Exclude dropdown"
    And I click on "Include_Exclude Value-Include"

    # Select a file and validate the Node is saved
    When I select file "DMA-US.csv" of type "csv" for the element "Browse link"
    And I click on "Add Targeting button"
   # Then I expect that element "Targeting file uploaded message" contains the text "Validating file..."
    And I expect that element "Targeting file uploaded message" contains the text "File uploaded successfully"
    And I click on "Save"
    Then I expect that element "Targeting Title" contains the text "<Targeting Name>"

    Examples:
      |Targeting Name|
      |HA_Targeting  |


 ##  verify uploading a csv file with name having single quote for DMA

  Scenario:
    # Create new Targeting with Include
    When I click on "Create Targeting Icon"
    And I mousehover on element "Targeting__moreIcon"
    And I mousehover on element "Targeting__controlsCover"
    And I click on "Targeting__editIcon"
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-DMA"
    And I click on "Include_Exclude dropdown"
    And I click on "Include_Exclude Value-Include"

    # Select a file that has single quote to upload and verify the display section columns once the file is uploaded
    When I select file "DMA'USA.csv" of type "csv" for the element "Browse link"
    And I click on "Add Targeting button"
  #  Then I expect that element "Targeting file uploaded message" contains the text "Validating file..."
    And I expect that element "Targeting file uploaded message" contains the text "File uploaded successfully"
    And I expect that element "File uploaded category Label section" contains the text "INCLUDE"
    And I expect that element "File uploaded category value section" contains the text "DMA"
    And I expect that element "File uploaded display value section" contains the text "DMA'USA.csv"
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
    And I click on "Targeting Type Value-DMA"
    And I click on "Include_Exclude dropdown"
    And I click on "Include_Exclude Value-Include"

    # Select a file that has special characters in the file name that we upload
    When I select file "DMA%^-U_S!V$.csv" of type "csv" for the element "Browse link"
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
  And I click on "Targeting Type Value-DMA"
  And I click on "Include_Exclude dropdown"
  And I click on "Include_Exclude Value-Include"

    # Select a file that has special characters in the file name that we upload
    When I select file "CSVSample_actions.txt" of type "txt" for the element "Browse link"
    And I click on "Add Targeting button"
  #  Then I expect that element "Targeting file uploaded message" contains the text "Validating file..."
    And I expect that element "Targeting file uploaded message" contains the text "Error in DMA file"


 ##  Verify file upload display section in Edit Targeting mode
  Scenario:
 # Create new Targeting
    When I click on "Create Targeting Icon"
    And I mousehover on element "Targeting__moreIcon"
    And I mousehover on element "Targeting__controlsCover"
    And I click on "Targeting__editIcon"
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-DMA"
    And I click on "Include_Exclude dropdown"
    And I click on "Include_Exclude Value-Include"

    # Select a file that has special characters in the file name that we upload
    When I select file "DMA-US.csv" of type "csv" for the element "Browse link"
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
    And I expect that element "File uploaded category value section" contains the text "DMA"
    And I expect that element "File uploaded display value section" contains the text "DMA-US.csv"
    And I expect that element "File upload display section close button" does exist
    And I expect that element "Save" is not enabled


 ##  Verify Close button functionality in the file upload section and reselect another file

  Scenario:
 # Create new Targeting with DMA
    When I click on "Create Targeting Icon"
    And I mousehover on element "Targeting__moreIcon"
    And I mousehover on element "Targeting__controlsCover"
    And I click on "Targeting__editIcon"
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-DMA"
    And I click on "Include_Exclude dropdown"
    And I click on "Include_Exclude Value-Include"

    # Select a file
    When I select file "DMA-US.csv" of type "csv" for the element "Browse link"
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
    And I expect that element "File uploaded category value section" contains the text "DMA"
    And I expect that element "File uploaded display value section" contains the text "DMA-US.csv"
    And I expect that element "File upload display section close button" does exist
    And I expect that element "Save" is not enabled

    # Remove the file uploaded by clicking on X button
    When I click on "File upload display section close button"
    # Then I expect that element "Save" is not enabled

    #Reselect the File
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-DMA"
    And I click on "Include_Exclude dropdown"
    And I click on "Include_Exclude Value-Exclude"
    Then I expect that element "Targeting file uploaded message" does not exist

    When I select file "DMA%^-U_S!V$.csv" of type "csv" for the element "Browse link"
    And I click on "Add Targeting button"
  #  Then I expect that element "Targeting file uploaded message" contains the text "Validating file..."
    And I expect that element "Targeting file uploaded message" contains the text "File uploaded successfully"
    And I expect that element "File uploaded category Label section" contains the text "EXCLUDE"
    And I expect that element "File uploaded category value section" contains the text "DMA"
    And I expect that element "File uploaded display value section" contains the text "DMA%^-U_S!V$.csv"
    And I expect that element "File upload display section close button" does exist


## Remove uploaded file by clicking on the X button present in the file and re-upload new valid file
  Scenario:
# Create new Targeting with DMA
    When I click on "Create Targeting Icon"
    And I mousehover on element "Targeting__moreIcon"
    And I mousehover on element "Targeting__controlsCover"
    And I click on "Targeting__editIcon"
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-DMA"
    And I click on "Include_Exclude dropdown"
    And I click on "Include_Exclude Value-Exclude"

   # Select a file
    When I select file "DMA-US.csv" of type "csv" for the element "Browse link"
    And I click on "Add Targeting button"
  #  Then I expect that element "Targeting file uploaded message" contains the text "Validating file..."
    And I expect that element "Targeting file uploaded message" contains the text "File uploaded successfully"
    And I expect that element "File uploaded category Label section" contains the text "EXCLUDE"
    And I expect that element "File uploaded category value section" contains the text "DMA"
    And I expect that element "File uploaded display value section" contains the text "DMA-US.csv"
    And I expect that element "File upload display section close button" does exist

    And I expect that element "Save" is enabled

   # Remove the file uploaded by clicking on X button on the File
    When I click on "Remove button on file"
    Then I expect that element "Save" is not enabled

   #Upload another valid file
    When I select file "DMA-USA.csv" of type "csv" for the element "Browse link"
    And I click on "Add Targeting button"
  #  Then I expect that element "Targeting file uploaded message" contains the text "Validating file..."
    And I expect that element "Targeting file uploaded message" contains the text "File uploaded successfully"
    And I expect that element "File uploaded category Label section" contains the text "EXCLUDE"
    And I expect that element "File uploaded category value section" contains the text "DMA"
    And I expect that element "File uploaded display value section" contains the text "DMA-USA.csv"
    And I expect that element "File upload display section close button" does exist


  ## Remove uploaded file by clicking on the X button present in the file and re-upload same valid file
  Scenario:
# Create new Targeting with DMA
    When I click on "Create Targeting Icon"
    And I mousehover on element "Targeting__moreIcon"
    And I mousehover on element "Targeting__controlsCover"
    And I click on "Targeting__editIcon"
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-DMA"
    And I click on "Include_Exclude dropdown"
    And I click on "Include_Exclude Value-Exclude"

   # Select a file
    When I select file "DMA-US.csv" of type "csv" for the element "Browse link"
    And I click on "Add Targeting button"
  #  Then I expect that element "Targeting file uploaded message" contains the text "Validating file..."
    And I expect that element "Targeting file uploaded message" contains the text "File uploaded successfully"
    And I expect that element "File uploaded category Label section" contains the text "EXCLUDE"
    And I expect that element "File uploaded category value section" contains the text "DMA"
    And I expect that element "File uploaded display value section" contains the text "DMA-US.csv"
    And I expect that element "File upload display section close button" does exist

    And I expect that element "Save" is enabled

   # Remove the file uploaded by clicking on X button on the File
    When I click on "Remove button on file"
    Then I expect that element "Save" is not enabled

   #Upload another valid file
    When I select file "DMA-USA.csv" of type "csv" for the element "Browse link"
    And I click on "Add Targeting button"
    And I expect that element "Targeting file uploaded message" contains the text "File uploaded successfully"
    And I expect that element "File uploaded category Label section" contains the text "EXCLUDE"
    And I expect that element "File uploaded category value section" contains the text "DMA"
    And I expect that element "File uploaded display value section" contains the text "DMA-USA.csv"
    And I expect that element "File upload display section close button" does exist


## Invalid format data file and error message
  Scenario:
 # Create new Targeting
    When I click on "Create Targeting Icon"
    And I mousehover on element "Targeting__moreIcon"
    And I mousehover on element "Targeting__controlsCover"
    And I click on "Targeting__editIcon"
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-DMA"
    And I click on "Include_Exclude dropdown"
    And I click on "Include_Exclude Value-Include"

    # Select a file that has special characters in the file name that we upload
    When I select file "wrongFormatZipCodes.csv" of type "csv" for the element "Browse link"
    And I click on "Add Targeting button"
    Then I expect that element "Targeting file uploaded message" contains the text "Error in DMA file"
    And I expect that element "Save" is not enabled

