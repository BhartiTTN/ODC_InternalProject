Feature: ODC-764_Radius

  Background: I am editing a targeting node of a new campaign
    Given I have a Campaign named "AutoCampaignName" under Account "QA_ViralGains"
    And that Campaign has a Targeting Node named "Targeting 1"
    And That "Targeting" node is updated to be named "Targeting 1", and have x position "300" and y position "300"
    And I am on the canvas screen for the newly created campaign

    And I mousehover on element "Targeting__moreIcon"
    And I mousehover on element "Targeting__controlsCover"
    And I click on "Targeting__editIcon"


  Scenario Outline: Verify two different Radius values entered in create and edit Targeting node window
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-Radius"
    And I click on "Include_Exclude dropdown"
    And I click on "Include_Exclude Value-Exclude"

   # Select a Radius
    And I set "<Radius Address>" to "Radius Address"
    And I set "<Radius Miles>" to "Radius Miles"
    And I click on "Add Targeting button"

    Then I expect that element "File uploaded category Label section" contains the text "EXCLUDE"
    And I expect that element "File uploaded category value section" contains the text "Radius"
    And I expect that element "File uploaded display value section" contains the text "<Radius Miles> mi around <Radius Address>"
    And I expect that element "File upload display section close button" does exist
    And I expect that element "Save" is enabled

   # Remove the Radius address by clicking on X button
    When I click on "Remove button on file"
    Then I expect that element "Save" is not enabled

   #Upload another Radius
    And I set "<Another Address>" to "Radius Address"
    And I set "<Radius without comma>" to "Radius Miles"
    And I click on "Add Targeting button"

    Then I expect that element "File uploaded category Label section" contains the text "EXCLUDE"
    And I expect that element "File uploaded category value section" contains the text "Radius"
    And I expect that element "File uploaded display value section" contains the text "<Another Radius Miles> mi around <Another Address>"
    And I expect that element "File upload display section close button" does exist
    And I click on "Save"

    #reopen the Targeting node
    When I mousehover on element "Targeting__moreIcon"
    And I mousehover on element "Targeting__controlsCover"
    And I click on "Targeting__editIcon"

    # Verify the Site List URL uploaded display section
    Then I expect that element "File uploaded category Label section" contains the text "EXCLUDE"
    And I expect that element "File uploaded category value section" contains the text "Radius"
    And I expect that element "File uploaded display value section" contains the text "<Another Radius Miles> mi around <Another Address>"
    And I expect that element "File upload display section close button" does exist
    And I expect that element "Save" is not enabled

    Examples:
    |Radius Miles |Radius Address   |Another Address |Another Radius Miles| Radius without comma|
    |1            |APT 412          |1047,Southern   |2,344               | 2344                |

  Scenario Outline: Verify comma separated miles value enter/display

    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-Radius"
    And I click on "Include_Exclude dropdown"
    And I click on "Include_Exclude Value-Include"

    # Select a Radius
    And I set "<Radius Address>" to "Radius Address"
    And I set "<Radius Miles>" to "Radius Miles"

    # Check the comma separated value
    And I store the value from inputfield "Radius Miles" as "Value"
    Then I expect that "Value" displayed is with comma separated value of "<Radius Miles>"
    And I click on "Add Targeting button"

    Then I expect that element "File uploaded category Label section" contains the text "INCLUDE"
    And I expect that element "File uploaded category value section" contains the text "Radius"
    And I expect that element "File uploaded display value section" contains the text "1,000 mi around <Radius Address>"
    And I expect that element "File upload display section close button" does exist

    And I click on "Save"


    Examples:
      |Radius Miles    |Radius Address   |
      |1000            |APT 412          |


  Scenario Outline: Verify same Radius value in Include and Exclude

    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-Radius"
    And I click on "Include_Exclude dropdown"
    And I click on "Include_Exclude Value-Exclude"

 # Select a Radius
    And I set "<Radius Address>" to "Radius Address"
    And I set "<Radius Miles>" to "Radius Miles"
    And I click on "Add Targeting button"

    Then I expect that element "File uploaded category Label section" contains the text "EXCLUDE"
    And I expect that element "File uploaded category value section" contains the text "Radius"
    And I expect that element "File uploaded display value section" contains the text "<Radius Miles> mi around <Radius Address>"
    And I expect that element "File upload display section close button" does exist
    And I expect that element "Save" is enabled


 #Enter another Radius
    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-Radius"
    And I click on "Include_Exclude dropdown"
    And I click on "Include_Exclude Value-Include"

    And I set "<Radius Address>" to "Radius Address"
    And I set "<Radius Miles>" to "Radius Miles"
    And I click on "Add Targeting button"

    Then I expect that element "File uploaded category Label section" contains the text "INCLUDE"
    And I expect that element "File uploaded category value section" contains the text "Radius"
    And I expect that element "File uploaded display value section" contains the text "<Radius Miles> mi around <Radius Address>"
    And I expect that element "File upload display section close button" does exist
    And I expect that element "Save" is enabled

    And I click on "Save"


    Examples:
      |Radius Miles |Radius Address   |
      |1            |APT 412          |



  Scenario Outline: Verify Required fields validation

    And I click on "Targeting Type Dropdown"
    And I click on "Targeting Type Value-Radius"
    And I click on "Include_Exclude dropdown"
    And I click on "Include_Exclude Value-Exclude"

  # Select a Radius
    And I click on "Radius Address"
    And I click on "Radius Miles"
    Then I expect that element "Field Error Message" contains the text "Required"
    And I set "<Radius Address>" to "Radius Address"
    And I click on "Radius Miles"
    And I click on "Radius Address"
    Then I expect that element "Dropdown Field Error" contains the text "Required"
    And I set "<Radius Miles>" to "Radius Miles"
    And I click on "Add Targeting button"

    Then I expect that element "File uploaded category Label section" contains the text "EXCLUDE"
    And I expect that element "File uploaded category value section" contains the text "Radius"
    And I expect that element "File uploaded display value section" contains the text "<Radius Miles> mi around <Radius Address>"
    And I expect that element "File upload display section close button" does exist
    And I expect that element "Save" is enabled

    And I click on "Save"


    Examples:
      |Radius Miles  |Radius Address                                                                                       |
      |12            |fdfgdgdfgdfgdf er dgfgdfg d gdfgfdgdf dfgdfgdfgf dfgfdgdfdf43ertretre ertretertretre hfdgfdhfghfg dg |
