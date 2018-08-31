Feature: ODC-815 CreativeGroup - Edit/Delete UI

  Background: I am on the Canvas page of a new campaign
    And I have a Campaign named "<QA_ViralGainsCampaign>" under Account "QA_ViralGains" and I am on the canvas screen


# Verify the Creative Group node creation and its default position
  Scenario:
    And I click on "Canvas Toggle Button"
    Then I expect that element "Create Creative Group Icon" is visible
    When I click on "Create Creative Group Icon"

    #testing New Creative Group are placed in default position
    Then I expect that the css attribute "transform" of element "Creative Group 2" is "matrix(1, 0, 0, 1, 100, 30)"

    #Testing Creative Group Incremented
    And I expect that element "Creative Group 2" does exist
    And I expect that element "Creative Group 3" does not exist
    When I click on "Create Creative Group Icon"
    Then I expect that element "Creative Group 3" does exist



# Delete and then Line Item for a campaign in the Creative UI and validate Delete confirmation message
  Scenario:
    And I move "Start Node" by x offset 200 and y offset 110

    Then I expect that element "Create Line Item Icon" is visible
    When I mousehover on element "LineItem More Icon"

#    Delete the Targeting node from Canvas UI
    And I mousehover on element "LineItem controlscover"
    And I click on "LineItem deleteIcon"

    Then I expect that element "Delete Confirmation Popup" does exist
    And I expect that element "Delete Confirmation Popup" contains the text "Are you sure you want to delete this Element and all the data entered within?"
    And I expect that element "Delete Button in Delete pop-up" does exist
    And I expect that element "Cancel Button in Delete pop-up" does exist

 #  Delete Line Item
    When I click on "Delete Button in Delete pop-up"
    Then I expect that element "Line Item 1" does not exist

# # Create new Line Item (currently DELETE is not deleting permanently in DB , hence Targeting Already Exists Error is pop-in up
    #when below lines are executed (#TODO Phase 2)
#    When I click on "Create Targeting Icon"
#    And I mousehover on element "Line Item__moreIcon"
#    And I mousehover on element "LineItem controlscover"
#    And I click on "Line Item__editIcon"
#    And I clear the inputfield "Line Item Name"
#    When I set "<Line Item Name>" to the inputfield appended with current Date_Time "Line Item Name"
#    And I pause for 800ms
#    And I click on "Save"
#    Then I expect that element "Targeting Title" contains the text "<Line Item Name>"


# Verify the doubleClick on the Line Item Icon
  Scenario:
    And I move "Start Node" by x offset 200 and y offset 110
    # Line Item 1 - doubleClick option verification
    And I click on "Create Line Item Icon"

    #Testing New Line Item is placed in default position
    Then I expect that the css attribute "transform" of element "Line Item 2" is "matrix(1, 0, 0, 1, 100, 30)"



# ODC-490 Add a new targeting and Edit Targeting Name with current Date and Time and validate its display
  Scenario:
    When I move "Start Node" by x offset 300 and y offset 0
    Then I expect that element "Create Line Item Icon" is visible
    When I mousehover on element "LineItem More Icon"
    And I mousehover on element "LineItem controlscover"

 # Create new LineItem
    And I click on "LineItem editIcon"
    Then I expect that element "Modal Window" does exist
 # ^^ Verify the Line Item in the Delivery UI is opened
