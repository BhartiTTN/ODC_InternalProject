Feature: ODC-49 and ODC-13 AccountManagement_Account_Users_Create_Edit_validateLists Validation

  Background: I am on the canvas page of a new campaign
    And I have a Campaign named "AutoCampaignName" under Account "QA_ViralGains" and I am on the canvas screen


  Scenario: Verify AccountList (Table) Column headers and data for the 2 Line Items created for a campaign and sort
    Then I expect that element "Create Line Item Icon" is visible
    When I click on "Create Line Item Icon"
    Then I expect that element "Line Item 2" does exist

    # Navigate to Campaign Management Page and click on LineItems Tab to verify the Line Item Grid Column headers
    When I click on "Back"
    Then I expect to be on the "ODC-Campaign_Dashboard" page
    And I click on "LineItem Tab"
    And I expect that table element "List Element" contains element with text "Lineitem Name"
    And I expect that table element "List Element" contains element with text "Campaign Name"
    And I expect that table element "List Element" contains element with text "Pacing"
    And I expect that table element "List Element" contains element with text "Budget"

    #Select the first checkbox
    When I click on "Select Checkbox"
    Then I expect that element "Delete Button" does exist
    And I expect that element "Cancel Button" does exist

    # Validate the First Line Item Name
    And I expect that element "LineItem List" contains the text "Line Item 2"

    # Validate the Second Line Item Name
    And I click on "2nd Select Checkbox"
    Then I expect that element "LineItem List" contains the text "Line Item 1"


    # Unselect all checkboxes and Verify the Ascending Order of Name
#    When I click on "Select Checkbox"
#    And I click on "2nd Select Checkbox"
#    And I pause for 800ms
#    Then I click on "Lineitem Name to Sort"
#    And I pause for 2000ms
#    Then I expect that "Name Column Elements" is sorted Ascending
#    And I pause for 1000ms
#    Then I expect that element "Ascending" does exist


  Scenario Outline: Verify the edited Line Item name in the canvsas grid is present in the ListItems Grid & also verify the campaign name associated with new lineitem added

    When I move "Start Node" by x offset 300 and y offset 0
    Then I expect that element "Create Line Item Icon" is visible
    When I mousehover on element "LineItem More Icon"
    And I mousehover on element "LineItem controlscover"

    # Create new LineItem
    And I click on "LineItem editIcon"
    Then I expect that element "Modal Window" does exist

    # Verify the LineItem elements displayed and Edit LineItem name and provide all mandatory fields to save delivery UI
    Then I expect that element "Delivery_Campaign_Banner" does equal stored value "Newest Campaign Name"
    And I expect that element "LineItem_WhenNoCampaignExpanded_Goal_Pacing Section" does exist
    And I expect that element "LineItem_WhenNoCampaignExpanded_AC Section" does exist
    And I expect that element "LineItem_WhenNoCampaignExpanded_Inventory Section" does exist
    And I expect that element "Delivery_Save Button" does exist
    And I expect that element "Delivery_Save Button" is not enabled
    And I expect that element "Delivery_Cancel Button" does exist
    And I expect that element "Message in Inventory Block" contains the text "Please select at least one inventory"
    And I expect that element "Close" does exist

    When I click on "LineItem_WhenNoCampaignExpanded_Delivery Name"
    And I click on "Line Item Pause button"
    And I set "<Delivery Name>" to "LineItem_WhenNoCampaignExpanded_Delivery Name"
    And I enter Date fields "<Start Date>", "<End date>" and select TimeZone Value
    And I click on "LineItem_WhenNoCampaignExpanded_Checkbox"
    And I click on "LineItem_WhenNoCampaignExpanded_GP Type dropdown"
    And I pause for 400ms
    And I click on "Starts"
    And I set "<Starts Value>" to "Enter the Number Field"
    And I click on "GP Add"
    Then I expect that element "GP Type" contains the text "Starts"
    And I expect that element "GP Value" contains the text "1,000"
    And I expect that element "GP Values_Added Section Close Button" does exist

    When I click on "LineItem_WhenNoCampaignExpanded_Additional Constraints Checkbox"
    And I click on "AC Period dropdown"
    And I click on "Daily"
    And I click on "AC Type dropdown"
    And I click on "Clicks"
    And I set "<Clicks Value>" to "AC Enter the Number Field"
    And I click on "AC Add"
    Then I expect that element "AC Values_Added Section" does exist
    And I expect that element "AC Period" contains the text "Daily"
    And I expect that element "AC Type" contains the text "Clicks"
    And I expect that element "AC Value" contains the text "2,000"
    And I expect that element "AC Values_Added Section Close Button" does exist

    And I pause for 800ms
    When I fill Mandatory fields "<Min Bid Value>" , "<Max Bid Value>" and select Vendor in Inventory Section
    Then I expect that element "Delivery_Save Button" is enabled
    And I pause for 400ms

    And I click on "Delivery_Save Button"
    And I pause for 400ms for the database to save and modal window to close

    #Navigate to Campaign management dashboard page
    When I click on "Back"
    Then I expect to be on the "ODC-Campaign_Dashboard" page
    And I click on "LineItem Tab"

    #Select the first checkbox as the newly added line item appears first in the grid
    And I click on "Select Checkbox"
    And I expect that table element "List Element" contains element with text "Lineitem Name"
    Then I expect that element "LineItem List" contains the text "Line Item 1"
    # should be "<Delivery Name>" instead of LineItem1 ^^ reopened the story

  #TODO Not implemented yet, ODC-722
#    And I click on "Grid Edit Icon"
#    Then I expect that element "Creative Graph" does exist

    #Verify the campaign name displayed for newly added line item
    And I expect that table element "List Element" contains element with text "Campaign Name"
    Then I expect that element "Campaign in the LineItem List" does equal stored value "Newest Campaign Name"


  Examples:
  |Start Date           |End date           |Delivery Name|Starts Value|Clicks Value|Min Bid Value|Max Bid Value|
  |01/26/2018 07:50 PM  |02/15/2018 07:50 PM|Ha_D1        |1000        |2000        |500          |600          |





