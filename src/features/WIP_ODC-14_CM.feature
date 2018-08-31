Feature: ODC-45 Login Success

  Scenario Outline:

    Given I open the url "/"
    When I set "<ValidEmailId>" to "Email"
    And I set "<ValidPassword>" to "Password"
    And I click on "Submit"
    And I expect to be on the "ODCDashboard" page
    And I pause for 2000ms
    #^probably don't need
    And I click on "Public groups"
    And I pause for 2000ms
    #^probably don't need
    And I click on "Public account"
    And I pause for 2000ms
    #^probably don't need
    When I click on "Campaign Management"
    When I click on "New Campaign Icon"
    # Then I expect that the url is "https://odc-ui.int.kube.viralgains.com/account-management/accounts"
    # And I expect to be on the "ODCAccountManagement" page
    And I pause for Demo
    When I set "<EnterCampaignName>" to "Enter Campaign Name"
    And I click on "Campaign Submit"
    Then I expect that the url is "https://odc-ui.int.kube.viralgains.com/home/journey"
    And I pause for Demo
    Then I expect that element "Creative" does exist
    Then I expect that element "Engagement Card" does exist
    Then I expect that element "Tracking" does exist
    Then I expect that element "MediaPlan" does exist
    Then I expect that element "Targeting" does exist
    Then I expect that element "Campaign" does exist
    And I pause for Demo

    Examples:
      | ValidEmailId               |ValidPassword|EnterCampaignName|
      | qa@viralgains.com |mypassword|AutoCampaignName-H          |


  Scenario Outline:

    Given I open the url "/"
    When I set "<ValidEmailId>" to "Email"
    And I set "<ValidPassword>" to "Password"
    And I click on "Submit"
    And I expect to be on the "ODCDashboard" page
    When I click on "Campaign Management"
    When I click on "New Campaign Icon"
    And I pause for Demo
    When I set "<EnterCampaignName>" to the inputfield emailId appended with current Date_Time "Enter Campaign Name"
    And I click on "Campaign Submit"
    Then I expect that the url is "https://odc-ui.int.kube.viralgains.com/home/journey"
    And I pause for Demo
    And I click on "Campaign"
    Then I expect that element "Campaign Templates" does exist
    And I click on "New Campaign"
    And I pause for Demo


    Examples:
      | ValidEmailId               |ValidPassword|EnterCampaignName|
      | qa@viralgains.com |mypassword|AutoCampaignName-H          |


  Scenario Outline:

    Given I open the url "/"
    When I set "<ValidEmailId>" to "Email"
    And I set "<ValidPassword>" to "Password"
    And I click on "Submit"
    And I expect to be on the "ODCDashboard" page
    When I click on "Campaign Management"
    When I click on "New Campaign Icon"
   # Then I expect that the url is "https://odc-ui.int.kube.viralgains.com/account-management/accounts"
   # And I expect to be on the "ODCAccountManagement" page
    And I pause for Demo
    When I set "<EnterCampaignName>" to "Enter Campaign Name"
    And I click on "Campaign Submit"
    Then I expect that the url is "https://odc-ui.int.kube.viralgains.com/home/journey"
    And I pause for Demo
    And I click on "Campaign"
    Then I expect that element "Campaign Templates" does exist
    And I click on "Automotive"
    And I click on "Automotive_CPG"
    Then I expect that element "CPG_Awareness" does exist
    And I pause for Demo


    Examples:
      | ValidEmailId               |ValidPassword|EnterCampaignName|
      | qa@viralgains.com |mypassword|AutoCampaignName-H          |


  Scenario Outline:

    Given I open the url "/"
    When I set "<ValidEmailId>" to "Email"
    And I set "<ValidPassword>" to "Password"
    And I click on "Submit"
    And I expect to be on the "ODCDashboard" page
    When I click on "Campaign Management"
    When I click on "New Campaign Icon"
    And I pause for Demo
    When I set "<EnterCampaignName>" to "Enter Campaign Name"
    And I click on "Campaign Submit"
    Then I expect that the url is "https://odc-ui.int.kube.viralgains.com/home/journey"
    And I click on "Campaign"
    Then I expect that element "Campaign Templates" does exist
    When I click on "Automotive"
    And I pause for Demo
    And I click on "Automotive_CPG"
    And I pause for Demo
    Then I expect that element "CPG_Awareness" does exist
    And I pause for Demo
    When I drag "div[class='subCollectionItem__collectionIcon___1-O-c']" to "svg#v-2"
    And I pause for Demo
    And I pause for Demo


    Examples:
      | ValidEmailId             |ValidPassword|EnterCampaignName  |
      | qa@viralgains.com |mypassword   |AutoCampaignName-H |


## E2E Scenarios with Valid data ( Business cases ) in Phase 2 or whenever the system is ready
# Valid Budget, Impression, Dates , Pacing ... (To be added)
# Valid data for a Group of creatives by IO and verify spreading budget across creatives (devices/geo etc..)
# Validate Delivery (settings) as the method with caps > budgets, timing to campaigns and creatives
# Valiate Delivery blocks override overall settings. Test if a constraint is met on a delivery block and not on the overall
  #the campaign stop serving
# Validate the Time based and Percentage value mentioned in the Delivery block are equivalent

  ## Advance Delivery Settings/Delivery Blocks
# 1. Validate disable/enable a delivery setting
# 2. Able to add in Delivery(settings) - budgets and timing to campaigns and creatives.
# 3. Able to set Delivery block settings to a campaign level and validate in campaign overview page ( date and budget etc..)
# 4. Able to set Delivery settings to multiple creatives in different line items and validate in creative overview page( date and budget etc..)
# 5. Able to set Delivery settings to multiple creatives in single line items and validate in creative overview page( date and budget etc..)
# 6. Click on Add button should add new delivery block - default blank values
# 7. Validate in the Delivery blocks to accept minimum of a day and maximum of the lifetime (any other options..?)
# 8. Validate user is able to enter Delivery blocks information with percentage or time based
# 9. User must be able to define overall settings in addition to delivery blocks (check while writing scripts)
# 10. User must be able to add multiple delivery blocks with all values and save it
# 11. Can enter Delivery blocks with minimum of a day and maximum of the lifetime.
# 12. Can enter Delivery blocks with percentage or time based
# 13. User must be able to define overall settings in addition to delivery blocks (need to add while scripting)


 ### Creative

 # Single Creative/Campaign: Verify Timezone dropdown list
 # Single Creative: Status is active/pause/future as per the selected date with different timezone selected (UTC, EST, CST, PST, MST, CET) under creative overview page & also in Campaign Overview Page
 # Selecting the valid Start & End date with timezone should appear under Creative overview page & also in Campaign Overview Page
 # Multiple Creative: Set different date/time and verify that first date & last date from all creatives are present in Campaign Overview Page and individual date/time details under the creative overview page.
 # Change in dates for single creative should get updated under creative overview page for that creative and under campaign overview page if applicable
 # Change in dates for multiple creative should get updated under creative overview page for each creative and under campaign overview page if applicable
 # Verify the Single Creative dates are reflected for creative in Goal & Pacing block and under creative overview page & campaign overview page.
 # Verify the Multiple Creative dates are reflected for creative in Goal & Pacing block and under creative overview page for each cre
#  # If different creative have different timezones the what will appear under Campaign Overview page?


## Line Items
# 1. Line Items Banner values ( Name, Creative#, Edit , Pause Icon)
# 2. Validate number of Creatives count and the count displayed in the Line Items' banner
# 3. Edit Line item Name
# 4. All Global scenarios mentioned above
# 5. Able to expand and collapse to hide/show only
# 6. Line Item1 with Mutliple Creatives
# 7. Mutliple Line Items with Single/Multiple Creatives at each Line Item level
# 8. Validate System assigned numeric order id for all line items
# 9. Validate the Numeric order is changed as per user
# 10. Validate Pause ( no values entered should be cleared)  and unpause action
# 11. Validate the Delete is disabled if delivery settings are active (campaign is active)
# 12. Delete Confirmation message validation "Are you sure you want to delete this delivery setting?"
# 13. validate Line items are able to be moved to reorder (Drag and drop)

## Creatives Banner/header
# 1. Creatives Banner values ( Name, Creative#, Edit , Play Icon..?)
# 2. Validate number of Creatives count and the count displayed in the Creative's banner
# 3. Edit Creatives Name
# 4. All Global scenarios mentioned above
# 5. Able to expand and collapse to hide/show only
# 6. Validate Pause and unpause action
# 7. Validate the Delete is disabled if delivery settings are active (campaign is active)
# 8. Delete Confirmation message validation "Are you sure you want to delete this delivery setting?"
# 9. validate Line items are able to be moved to reorder (Drag and drop)

## Delivery UI Delivery Setting  fields
#  1. Validate and Enter valid data in the fields Start Date, End Date, Timezone and Delivery Setting Name and Save the page
#  2. Verify Activate button when No value is entered in any of the 3 fields in the Page
#  3. All Global scenarios mentioned above
#  4. Campaign Name Banner values ( Camapaign Name, Line Items#, Edit , Pause Icon) and able to expand and collapse to hide/show only
#  5. Validate the Campaign Name is the same that user naviagted from Campaign overview page or in the page breadcumbs
#  6. Edit fields (Start Date, End Date, Timezone and Delivery Setting Name)
       #Try to reuse scenario 1
#  7. Validate the Line Items# and Count matching with the Campaign Name's Header section/Breadcrumb Line Items count
#  8. Validate Pause and unpause action
#  9. Validate the Delete is disabled if delivery settings are active (campaign is active)
# 10. Delete Confirmation message validation "Are you sure you want to delete this delivery setting?"
# 11. validate Line items are able to be moved to reorder (Drag and drop)



## Single Creative :
#    1. All above scenarios and validate the details


## Multiple Creatives :
#    1. All above scenarios and validate the details
#    2. Enter Budget in the main campaign and when multiple creatives are created ,
#       the budget amount is distributed across all creatives (need to check how at later point of time)


## Budget combined with Pacing and Delivery blocks:
#  1. Verify even split of budget across creatives in a campaign (need to check how at later point of time)
#  2. Verify split budget differently for segments of time within a campaign.
#       1. Add a new delivery block and set the budget for a specific time period
#       2. Add multiple delivery blocks and set the budget for a specific time period with other fields
#       3. Verify the removal of budget field added
#       4. Verify the activate / save button throws error to enter budget amount when delivery field is added without budget amount
## All Global scenarios mentioned above


  #     5. Multiple Budget entries for Creatives and verify the display in the same block
  #     7. Removal of added Budget details in One Creative and validate the value is removed from Campaign & Creative overview page
#         #combine with scenario 2
#     8. Removal of added Budget details in One Creative when multiple creative present and validate the value is deducted from
#         #from Campaign & Creative overview page
#     9. Verify the Campaign Budget field is not updated with Creatives Budget amount entered
