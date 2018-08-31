Feature: ODC-478 Delivery - Add the support to show hierarchical view for LINE ITEMS and CREATIVE

  Background: I am on the canvas page of a new campaign
    And I have a Campaign named "AutoCampaignName" under Account "QA_ViralGains" and I am on the canvas screen


  Scenario: Testing default layout, iteratively adding elements and checking delivery
    #Check that structure is 1 line item
    When I move "Line Item 1" by x offset 300 and y offset 150
    When I move "Start Node" by x offset 300 and y offset 0
    And I click on the "delivery button"
    And I expect the "Delivery Connected Elements List" to contain the ordered elements "Stored Value: Newest Campaign Name, Line Item 1"
    And I click on "Cancel"

    #Adding creative, checking structure
    And I click on the "Create Creative Icon"
    When I move "Creative 1" by x offset 300 and y offset 300

    And I create an edge from the bottom port of "Line Item 1" and connect it to the top port of "Creative 1"

    And I click on the "delivery button"
    And I expect the "Delivery Connected Elements List" to contain the ordered elements "Stored Value: Newest Campaign Name, Line Item 1, Creative 1"
    And I click on "Cancel"

  #Add another creative under line item, check delivery structure
    And I click on the "Create Creative Icon"
    When I move "Creative 2" by x offset 700 and y offset 300
    And I create an edge from the bottom port of "Line Item 1" and connect it to the top port of "Creative 2"
    And I click on the "delivery button"
    And I expect the "Delivery Connected Elements List" to contain the ordered elements "Stored Value: Newest Campaign Name, Line Item 1, Creative 1, Creative 2"
    And I click on "Cancel"


  #Add Line Item and check delivery
  And I click on the "Create Line Item Icon"
  And I move "Line Item 2" by x offset 0 and y offset 300
  And I create an edge from the bottom port of "Start Node" and connect it to the top port of "Line Item 2"
  And I click on the "delivery button"
  And I expect the "Delivery Connected Elements List" to contain the ordered elements "Stored Value: Newest Campaign Name, Line Item 1, Creative 1, Creative 2, Line Item 2"
  And I click on "Cancel"

  #Add 2 creatives to 2nd line item and check delivery
  And I click on the "Create Creative Icon"
  When I move "Creative 3" by x offset 0 and y offset 500
  And I create an edge from the bottom port of "Line Item 2" and connect it to the top port of "Creative 3"
  And I click on the "Create Creative Icon"
  When I move "Creative 4" by x offset 300 and y offset 500
  And I create an edge from the bottom port of "Line Item 2" and connect it to the top port of "Creative 4"
  And I click on the "delivery button"
  And I expect the "Delivery Connected Elements List" to contain the ordered elements "Stored Value: Newest Campaign Name, Line Item 1, Creative 1, Creative 2, Line Item 2, Creative 3, Creative 4"
    

Scenario: Testing deleting edges

  When I move "Line Item 1" by x offset 50 and y offset 50
  When I move "Start Node" by x offset 300 and y offset 0

  #Adding creatives
  And I click on the "Create Creative Icon"
  When I move "Creative 1" by x offset 300 and y offset 150
  And I create an edge from the bottom port of "Line Item 1" and connect it to the top port of "Creative 1"
  And I click on the "Create Creative Icon"
  When I move "Creative 2" by x offset 700 and y offset 300
  And I create an edge from the bottom port of "Line Item 1" and connect it to the top port of "Creative 2"

  #Adding Line Item, 2 creatives
  And I click on the "Create Line Item Icon"
  And I move "Line Item 2" by x offset 900 and y offset 0
  And I create an edge from the bottom port of "Start Node" and connect it to the top port of "Line Item 2"

  And I click on the "Create Creative Icon"
  When I move "Creative 3" by x offset 0 and y offset 500
  And I create an edge from the bottom port of "Line Item 2" and connect it to the top port of "Creative 3"
  And I click on the "Create Creative Icon"
  When I move "Creative 4" by x offset 300 and y offset 500
  And I create an edge from the bottom port of "Line Item 2" and connect it to the top port of "Creative 4"
  #######

  #Testing initial structure
  And I click on the "delivery button"
  Then I expect the "Delivery Connected Elements List" to contain the ordered elements "Stored Value: Newest Campaign Name, Line Item 1, Creative 1, Creative 2, Line Item 2, Creative 3, Creative 4"
  And I click on "Cancel"

  #Delete edge between Line Item 1, Creative 1. Check Structure
  When I delete the edge between source "Line Item 1" and target "Creative 2"
  And I click on the "delivery button"
  Then I expect the "Delivery Connected Elements List" to contain the ordered elements "Stored Value: Newest Campaign Name, Line Item 1, Creative 1, Line Item 2, Creative 3, Creative 4"
  And I expect the "Delivery Disconnected Elements List" to contain the ordered elements "Creative 2"
  And I click on "Cancel"

  #Delete edge between Start Node, Line Item 1. Check Structure. Re-add edge, check again
  When I delete the edge between source "Start Node" and target "Line Item 1"
  And I click on the "delivery button"
  Then I expect the "Delivery Connected Elements List" to contain the ordered elements "Stored Value: Newest Campaign Name, Line Item 2, Creative 3, Creative 4"
  And I expect the "Delivery Disconnected Elements List" to contain the ordered elements "Creative 1, Creative 2, Line Item 1"
  When I click on "Cancel"
  And I create an edge from the bottom port of "Start Node" and connect it to the top port of "Line Item 1"
  And I click on the "delivery button"
  Then I expect the "Delivery Connected Elements List" to contain the ordered elements "Stored Value: Newest Campaign Name, Line Item 1, Creative 1, Line Item 2, Creative 3, Creative 4"
  And I expect the "Delivery Disconnected Elements List" to contain the ordered elements "Creative 2"
  And I click on "Cancel"

  #Delete edge between Start, Line Item 2. Check Structure
  When I delete the edge between source "Start Node" and target "Line Item 2"
  And I click on the "delivery button"
  Then I expect the "Delivery Connected Elements List" to contain the ordered elements "Stored Value: Newest Campaign Name, Line Item 1, Creative 1"
  And I expect the "Delivery Disconnected Elements List" to contain the ordered elements "Creative 2, Creative 3, Creative 4, Line Item 2"
