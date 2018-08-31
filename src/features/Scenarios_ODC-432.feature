Feature: ODC-431 scenarios in Scope (if not in scope, cut here & copy the scenario to WIP_ODC-14_CM)

## Delivery UI Global scenarios :
# Max and Min values
# Save as Draft : saves already entered value
# Activate campaign is enabled/paused when this field is not entered in the page


## Budget
#  # Budget field / feature validation when entered value in Goal & Pacing Block
#     1. For Campaign: Set a budget for campaign and verify it in the same block and also in Campaign Overview Page (after page save)
#     2. Single Creative: Set a budget and verify in the same block and in Campaign Overview Page and also in Creative overview page
#     3. Multiple Creative: Set a budget and verify the total of Budget amount is present in Campaign Overview Page and individual budget details in the creative overview page for the respective creative#
#     4. Multiple Budget entries for Campaign and verify the display in the same block
#     6. Removal of added Budget details in Campaign and validate the value is removed from Campaign overview page
#         #combine with scenario 1
#     10. Verify the Creative Buget field is not updated with Campaign Budget amount entered
#     11 & 12. Edit the budget amount already entered in campaign and in creative ( remove and re-enter)
#     13. Activate Campaign throws error if budget field is not entered in any of the places ( campaign or creative)
#     14. Verify the Goal Budget spend ( cap Budget amount) then Activiate Campaign button is not enabled


## Budget field / feature validation in Additional Constraints block
## Campaign :
#    1. Daily : Enter Budget and verify the details displayed in the same block and removal of it
#    2. Weekly : Enter Budget and verify the details displayed in the same block and removal of it
#    3. Monthly : Enter Budget and verify the details displayed in the same block and removal of it
#    4. Mandatory field validation of budget amount
#    5. Add Budget along with Impression value and verify its display in the same block and removal of it
#    6. Add Budget for Daily/weekly/Monthly and after save the page ( verify pacing graphs /reports )


## Impressions
  ## All scenarios mentioned in Budget are applicable for Impressions

#  Inventory - Need supply (May need to hard code the values for supply)
#  a) Use dummy values for inventory
#  Scenario:
#
#  1.	Verify that on clicking the Inventory checkbox all the inventory sources or exchanges (checkboxes) are enable and on 2nd click inventory sources or exchanges (checkboxes) are disabled
#  2.	Verify Multiple (2-3) inventory sources or exchanges & verify min & max bid value?
#  3.	Verify All inventory sources or exchanges.
#
#  1.	Overall
#  1.	Set minimum and maximum as $0
#  2.	Set minimum and maximum as negative value
#  3.	Verify maximum accepts value greater than minimum
#  4.	Set minimum and maximum as positive (valid) value and verify ?
#  4.	Verify that unchecking (checkbox)/checking (checkbox) single the inventory sources or exchanges is disable/enabled
#  5.	Verify Individual inventory sources or exchanges.
#
#  1.	Verify set a min/max bid for each exchange for a creative - Individually (for each exchange)
#  1.	Set minimum and maximum as $0
#  2.	Set minimum and maximum as negative value
#  3.	Verify maximum accepts value greater than minimum
#  4.	Set minimum and maximum as positive (valid) value & verify min & max bid value?
#  6.	Verify push inventory settings to all creatives in a campaign and verify that is added campaign.
#  [Harini} : Adding couple of more scenarios :
#  7. Validate Min and Max fields have same value ( with diff 0.. )
#  8. Validate the difference between Min and Max is >=1 ( greater than or equal to 1) or check with product team for the difference value.
#  9. should be able to select "OverAll" or "Individually" for setting up min and max bid value.
#  10. should be able to enter min and max bid price for individual inventory selected if INDIVIDUALLY is selected.
#  11. can override the min max bid price for the inventories individually evens if OVERALL is selected.

 ## Start/End Date & Timezone
 # Single Creative Date Control
#  1. Verify that on clicking the Start & End Date, calendar pop-up should appear
#  2. Start date should be greater than End date
#  3. End date can be set to NEVER
#  4. On selecting the Start/End date the date should appear with current time as per selected timezone
#  5. On clicking Go to Today, today’s date with current time should get selected (both Start & End Date)
#  6. On clicking the Delete (clear selection) icon, field should get clear (both Start & End Date)
#  7. On clicking the Close (close the picker) icon, calendar pop-up should close (both Start & End Date)
#  8. On clicking the Select time, Hour & minute picker should appear & can be selected by incrementing or decrementing
#  9. On clicking the Select time, Hour & minute picker should appear & can be selected by selecting the Hour/Minute
 # For Campaign: Set valid start date & End date with default timezone for campaign and verify it in the same block and also in Campaign Overview Page (after page save)
 # Start & end dates are editable?
 # Mandatory field validation of start/end date & default timezone (combine with#2)
