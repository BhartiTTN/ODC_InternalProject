Feature: ODC-216 Create Campaign

  Background: Log into the site and go to Campaign Management
    Given I am on the "campaigns" tab of the "campaigns" page using the account "QA_ViralGains"

# New Campaign Creation with unique Campaign name (Campaign name appended with 'current date and time @undefined' )
  Scenario Outline:
    When I click on "New Campaign"
    Then I expect that element "Campaign Create Label" does exist
    When I set "<Valid Campaign Name>" to the inputfield appended with current Date_Time "Campaign Name"
    And I store the value from inputfield "Campaign Name" as "New Campaign Name"
    And I click on "Save"
    Then I expect that element "Existing Campaign" does exist
    And I click on "Select Checkbox"
    Then I expect that element "Delete Button" does exist
    And I expect that element "Cancel Button" does exist

     ##cleanup steps in Campaign GRID
    And I click on "Select Checkbox"
    And I delete the Campaign named with stored variable "New Campaign Name"

    Examples:
      | Valid Campaign Name |
      | AutoCampaignName-H  |


# New Campaign Creation verify "Required" Validation Message for Campaign Name field
  Scenario Outline:
    And I click on "New Campaign"
    Then I expect that element "Campaign Create Label" does exist
    When I set "<Blank>" to "Campaign Name"
    And I click on "Account Management and Campaign Popup Title"
    Then I expect that element "Field Error Message" contains the text "Required"


    Examples:
      | Blank |
      |       |


# Duplicate Campaign Validation Message
  Scenario Outline:
    And I click on "New Campaign"
    Then I expect that element "Campaign Create Label" does exist
    When I set "<Duplicate Campaign Name>" to "Campaign Name"
   # And I click on "Save"
   # Then I expect that element "Field Error Message" contains the text "Duplicate Name" (Phase 2)

    Examples:
      | Duplicate Campaign Name           |
      | AutoCampaignName-H+1332@undefined |


# Delete the Campaign created immediately after creation (Top Row Campaign should be deleted)
  Scenario Outline:
    And I click on "New Campaign"
    Then I expect that element "Campaign Create Label" does exist
    When I set "<Valid Campaign Name>" to the inputfield appended with current Date_Time "Campaign Name"
    And I click on "Save"
    And I pause for 800ms
    Then I expect that element "Existing Campaign" does exist
    When I click on "Select Checkbox"
    And I pause for 300ms for the grid to load
    When I click on "2nd Select Checkbox"
    Then I click on "Delete Button"
    Then I expect that element "Delete Confirmation Popup" does exist
    Then I expect that element "Delete Button in Delete Confirmation Pop-Up" does exist
    And I expect that element "Cancel Button in Delete Confirmation Pop-Up" does exist
    And I expect that element "Delete Confirmation Message" contains the text "Are you sure you want to delete all selected campaigns (2)?"
    And I click on "Cancel Button in Delete Confirmation Pop-Up"
    Then I expect that element "#Selected Rows" does exist
    And I pause for 800ms
    Then I click on "Delete Button"
    Then I expect that element "Delete Confirmation Popup" does exist
    Then I expect that element "Delete Button in Delete Confirmation Pop-Up" does exist
    And I expect that element "Cancel Button in Delete Confirmation Pop-Up" does exist
    And I expect that element "Delete Confirmation Message" contains the text "Are you sure you want to delete all selected campaigns (2)?"
    And I pause for 800ms
    And I click on "Delete Button in Delete Confirmation Pop-Up"


    Examples:
      | Valid Campaign Name |
      | AutoCampaignName-H  |


## (OBSOLETE:ODC-460) Campaign Name > 51 characters validation
#  Scenario Outline:
#    And I click on "New Campaign"
#    Then I expect that element "Campaign Create Label" does exist
#    When I set "<51characters Campaign Name>" to "Campaign Name"
#    And I click on "Account Management and Campaign Popup Title"
#    Then I expect that element "Field Error Message" contains the text "Campaign name must be less than 50 characters"
#
#
#    Examples:
#      |51characters Campaign Name                         |
#      |AutoCampaignName-AutoCampaignNam-AutoCampaignName51|


# Campaign Name = 50 characters ; Max length is 50
  Scenario Outline:
    And I click on "New Campaign"
    Then I expect that element "Campaign Create Label" does exist
    When I set "<50characters Campaign Name>" to the inputfield appended with current Date_Time "Campaign Name"
    And I store the value from inputfield "Campaign Name" as "New Campaign Name"
    And I click on "Save"
    Then I expect that element "Existing Campaign" does exist

   ##cleanup steps in Campaign GRID
    And I delete the Campaign named with stored variable "New Campaign Name"

    Examples:
      | 50characters Campaign Name     |
      | AutoCampaignNam-AutoCampaignNa |



# Edit the Campaign Name for the newly created Campaign , clear the Campaign name and then re-enter the Campaign Name
  Scenario Outline:
    And I click on "New Campaign"
    Then I expect that element "Campaign Create Label" does exist
    When I set "<Valid Campaign Name>" to the inputfield appended with current Date_Time "Campaign Name"
    And I click on "Save"
    Then I expect that element "Existing Campaign" does exist
    And I click on "Select Checkbox"
    And I click on "Grid Edit Icon"
    Then I expect that element "Modal Window" does exist
    And I clear the inputfield "Campaign Name"
    When I set "<Campaign Name>" to the inputfield appended with current Date_Time "Campaign Name"
    And I store the value from inputfield "Campaign Name" as "New Campaign Name"
    And I click on "Save"
    And I pause for 800ms
    #Then I click on "Close"

     ##cleanup steps in Campaign GRID
    And I delete the Campaign named with stored variable "New Campaign Name"

    Examples:
      | Campaign Name  | Valid Campaign Name |
      | Harini_Auto_CN | AutoCampaignName    |


# Duplicate Campaign Name validation while editing newly created Campaign and Close the Modal window + Delete the new campaign
  Scenario Outline:
    And I click on "New Campaign"
    Then I expect that element "Campaign Create Label" does exist
    When I set "<Valid Campaign Name>" to the inputfield appended with current Date_Time "Campaign Name"
    And I click on "Save"
    Then I expect that element "Existing Campaign" does exist
    And I pause for 500ms
    And I click on "Select Checkbox"
    And I click on "Grid Edit Icon"
    Then I expect that element "Modal Window" does exist
    And I clear the inputfield "Campaign Name"
   # When I set "<Duplicate Campaign Name>" to "Campaign Name" (Phase 2)
    When I set "<Valid Campaign Name>" to the inputfield appended with current Date_Time "Campaign Name"
   # And I click on "Save"
   # Then I expect that element "Field Error Message" contains the text "Duplicate Name" (Phase 2)
    When I click on "Close"
   # Then I expect that element "Existing Campaign" does exist
    When I click on "Campaign Management"
    And I click on "Select Checkbox"
    Then I click on "Delete Button"
    And I expect that element "Delete Confirmation Popup" does exist
    And I click on "Delete Button in Delete Confirmation Pop-Up"
    And I expect to be on the "ODCDashboard" page



    Examples:
      | Duplicate Campaign Name | Valid Campaign Name |
      | Harini_Auto_CN          | Harini_Auto_CN1     |



# Sorting "Ascending" for Campaign Name column
  @Bug @ODC-610
  Scenario:
    Then I click on "Grid Campaign Name"
    Then I expect that "Name Column Elements" is sorted Ascending
    Then I expect that element "Ascending" does exist


# Sorting "Descending" of the Entire List Items for Campaign Name column
  Scenario:
    Then I click on "Grid Campaign Name"
    Then I click on "Grid Campaign Name"
    Then I expect that "Name Column Elements" is sorted Descending
    Then I expect that element "Descending" does exist


# ODC-658 Close Campaign Pop-up clicking somewhere on the page insead of cancel button in the pop-up

#  Scenario Outline:
#    And I click on "New Campaign"
#    Then I expect that element "Campaign Create Label" does exist
#    When I set "<Valid Campaign Name>" to the inputfield appended with current Date_Time "Campaign Name"
#    And I click on "Outside the pop-up"
#    Then I expect to be on the "ODCDashboard" page
#
#    Examples:
#      |Valid Campaign Name    |
#      |AutoCampaignName-H     |


 # ODC-569

  # Verify to create a campaign with the same name of a previously deleted campaign
  Scenario Outline:
    When I click on "New Campaign"
    Then I expect that element "Campaign Create Label" does exist
    When I set "<50characters Campaign Name>" to the inputfield appended with current Date_Time "Campaign Name"
    And I store the value from inputfield "Campaign Name" as "New Campaign Name"
    And I click on "Save"
    Then I expect that element "Existing Campaign" does exist

   ##Cleanup steps in Campaign GRID
    When I delete the Campaign named with stored variable "New Campaign Name"

   ##Create another campaign with the previously deleted Campaign Name
    When I click on "New Campaign"
    Then I expect that element "Campaign Create Label" does exist
    When I set stored value "New Campaign Name" to inputfield "Campaign Name"
    And I click on "Save"
    Then I expect that element "Existing Campaign" does exist

    ##Cleanup steps in Campaign GRID
    When I delete the Campaign named with stored variable "New Campaign Name"

    Examples:
      | 50characters Campaign Name     |
      | SameCampaignNamofdelCampaignNa |
