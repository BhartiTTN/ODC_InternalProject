Feature: ODC-521 and ODC-506

  Background: Login into the site
    Given I log into the site "ODC" as an admin
    And I select default account
    When I click on "Campaign Management"

#TODO 1. Mouse hover on the existing link to see the link-tools and perform link-remove
#TODO 2. Retain the updated/ newly connected port
## ODC-506 Update a Connection between Start Node and Line Item
  Scenario Outline:
    When I create a campaign "<Valid Campaign Name>" and click on the campaign link to navigate to Creative Page
    Then I expect to be on the "ODC-Creative" page
    And I expect that element "Creative Graph" does exist
    And I expect that element "Start Node Title in Graph" contains the text "Campaign Start"
    And I expect that the css attribute "font-size" of element "Start Node_Campaign Name" is "14px"
    And I expect that the css attribute "font-family" of element "Start Node_Campaign Name" is "helveticaneue"
    And I expect that element "Line_Item" contains the text "Line Item 1"
    When I move "Line Item 1" by x offset 150 and y offset 100
    And I click on "Create Line Item Icon"
    And I move "Line Item 1" by x offset 0 and y offset 100
    And I mousehover on element "Start Node joint-port"
    And I click on "Start Node joint-port"
    Then I expect that element "Joint Link" does exist
    And I create an edge from the bottom port of "Start Node" and connect it to the top port of "Line Item 2"
    And I pause for 400ms

    #Testing that the connection is saved
    # TODO: Update with a more comprehensive test when ODC-529 is completed
    And I click on "Back"
    And I click on "Campaign Name Link"
    Then I expect that element "connection" does exist 2 times

    Examples:
      | Valid Campaign Name |
      | Ha_CampaignName     |

## ODC-521 Remove the link between Start and Line Item an validate Auto Save functionality

  Scenario Outline:
    When I create a campaign "<Valid Campaign Name>" and click on the campaign link to navigate to Creative Page

    Then I expect to be on the "ODC-Creative" page
    And I expect that element "Line_Item" contains the text "Line Item 1"
    And I expect that element "Start Node Title in Graph" contains the text "Campaign Start"
    And I expect that element "Joint Link" does exist


    When I delete the edge between source "Start Node" and target "Line Item 1"


      # Navigate to Dashboard page and Select the same Campaign to see the AUTO SAVE functionality is working
    And I click on "Back"
    And I click on "Campaign Management"
    And I click on "Campaign Name Link"
    Then I expect to be on the "ODC-Creative" page

    And I expect that element "Line_Item" contains the text "Line Item 1"
    And I expect that element "Start Node Title in Graph" contains the text "Campaign Start"
    And I expect that element "Joint Link" does not exist

    Examples:
      | Valid Campaign Name |
      | Ha_CampaignName     |

