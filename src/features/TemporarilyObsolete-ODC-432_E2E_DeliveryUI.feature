Feature: ODC-432 : E2E delivery UI ; ODC-474 Toggle Play/Pause in Campaign Banner

  Background: I am on the canvas page of a new campaign
    And I have a Campaign named "AutoCampaignName" under Account "QA_ViralGains" and I am on the canvas screen

# Delivery UI - Pacing Block : Verify Adding Impression Value successfully in the display section
  # ; Re-enter same value and then Re-enter new Value;
  #Validate Add button Enable/Disable and Close button
  Scenario Outline:
    And I click on the "delivery button"
    And I click on the "Delivery_Campaign_Banner"
    And I click on "Campaign Delivery Name"
    And I set "<Delivery Name>" to "Campaign Delivery Name"
    And I enter Date fields "<Start Date>", "<End date>" and select TimeZone Value
    And I click on "Goal_Pacing Checkbox"
    And I set "<Impression Value>" to "Enter the Number Field"
    And I pause for 800ms
    And I store the value from inputfield "Enter the Number Field" as "Value"
    Then I expect that "Value" displayed is with comma separated value of "<Impression Value>"

    And I click on "GP Add"
    Then I expect that element "GP Values_Added Section" does exist
    And I expect that element "GP Type" contains the text "Impressions"
    And I expect that element "GP Value" contains the text "2,000"
    And I expect that element "GP Values_Added Section Close Button" does exist

    When I click on "GP Values_Added Section Close Button"
    And I pause for 400ms
    And I click on "GP Type dropdown"
    And I click on "Impressions"
    And I set "<Impression Value>" to "Enter the Number Field"
    And I click on "Enter the Number Field"
    And I clear the inputfield "Enter the Number Field"

    And I set "<Impression New Value>" to "Enter the Number Field"
    And I store the value from inputfield "Enter the Number Field" as "Value"
    Then I expect that "Value" displayed is with comma separated value of "<Impression New Value>"
    When I click on "GP Add"
    Then I expect that element "GP Type" contains the text "Impressions"
    And I expect that element "GP Value" contains the text "200"
    And I expect that element "GP Values_Added Section Close Button" does exist

    Examples:
      |Start Date           |End date           |Delivery Name|Impression Value|Impression New Value|
      |01/26/2018 07:50 PM  |01/28/2018 07:50 PM|Ha_D1        |2000            |200                 |

## Delivery UI - Pacing Block : Add All Types and Validate the Display section with respective Close buttons;
  #verify when Closed the type is removed
  Scenario Outline:
    And I click on the "delivery button"
    And I click on the "Delivery_Campaign_Banner"
    And I click on "Campaign Delivery Name"
    And I set "<Delivery Name>" to "Campaign Delivery Name"
    And I enter Date fields "<Start Date>", "<End date>" and select TimeZone Value
    And I click on "Goal_Pacing Checkbox"

  # Impressions
    And I click on "GP Type dropdown"
    And I click on "Impressions"
    And I set "<Impression Value>" to "Enter the Number Field"
    And I click on "GP Add"
    Then I expect that element "GP Values_Added Section" does exist
    And I expect that element "GP Type" contains the text "Impressions"
    And I expect that element "GP Value" contains the text "1,000"
    And I expect that element "GP Values_Added Section Close Button" does exist

   # Starts
    When I click on "GP Type dropdown"
    And I click on "Starts"
    And I set "<Starts Value>" to "Enter the Number Field"
    And I store the value from inputfield "Enter the Number Field" as "Value"
    Then I expect that "Value" displayed is with comma separated value of "<Starts Value>"
    When I click on "GP Add"
    Then I expect that element "GP Values_Added Section" does exist
    And I expect that element "GP Type" contains the text "Starts"
    And I expect that element "GP Value" contains the text "2,000,000"
    And I expect that element "GP Values_Added Section Close Button2" does exist

   # Clicks
    When I click on "GP Type dropdown"
    And I click on "Clicks"
    And I set "<Clicks Value>" to "Enter the Number Field"
    And I store the value from inputfield "Enter the Number Field" as "Value"
    Then I expect that "Value" displayed is with comma separated value of "<Clicks Value>"
    When I click on "GP Add"
    Then I expect that element "GP Values_Added Section" does exist
    And I expect that element "GP Type" contains the text "Clicks"
    And I expect that element "GP Value" contains the text "3,000"
    And I expect that element "GP Values_Added Section Close Button3" does exist

   # Inventory Spend
    When I click on "GP Type dropdown"
    And I click on "Inventory Spend"
    And I set "<Inventory Spend Value>" to "Enter the Number Field"
    And I store the value from inputfield "Enter the Number Field" as "Value"
    Then I expect that "Value" displayed is with comma separated value of "<Inventory Spend Value>"
    When I click on "GP Add"

    Then I expect that element "GP Values_Added Section" does exist
    And I expect that element "GP Type" contains the text "Inventory Spend"
    And I expect that element "GP Value" contains the text "$ 4,000.32"
    And I expect that element "GP Values_Added Section Close Button4" does exist

   # Advertiser Cost
    When I click on "GP Type dropdown"
    And I click on "Advertiser Cost"
    And I set "<Advertiser Cost Value>" to "Enter the Number Field"
    And I store the value from inputfield "Enter the Number Field" as "Value"
    Then I expect that "Value" displayed is with comma separated value of "<Advertiser Cost Value>"
    When I click on "GP Add"
    Then I expect that element "GP Values_Added Section" does exist
    And I expect that element "GP Type" contains the text "Advertiser Cost"
    And I expect that element "GP Value" contains the text "$ 150,000"
    And I expect that element "GP Values_Added Section Close Button5" does exist

   # Clicked on Close button for each Type Value entered above to verify the close action
    When I click on "GP Values_Added Section Close Button"
    Then I expect that element "GP Type" not contains the text "Impressions"
    When I click on "GP Values_Added Section Close Button"
    Then I expect that element "GP Type" not contains the text "Starts"
    When I click on "GP Values_Added Section Close Button"
    Then I expect that element "GP Type" not contains the text "Clicks"
    When I click on "GP Values_Added Section Close Button"
    Then I expect that element "GP Type" not contains the text "Inventory Spend"
    When I click on "GP Values_Added Section Close Button"
    Then I expect that element "GP Values_Added Section" does not exist

    Examples:
      |Start Date           |End date           |Delivery Name|Impression Value|Starts Value|Clicks Value|Inventory Spend Value |Advertiser Cost Value |
      |01/26/2018 07:50 PM  |01/28/2018 07:50 PM|Ha_D1        |1000            |2000000     |3000        |4000.32             |150000                |

## Delivery UI - Pacing Block : Add All Types and Validate the Display section with Same value
  Scenario Outline:
    And I click on the "delivery button"
    And I click on the "Delivery_Campaign_Banner"
    And I click on "Campaign Delivery Name"
    And I set "<Delivery Name>" to "Campaign Delivery Name"
    And I enter Date fields "<Start Date>", "<End date>" and select TimeZone Value
    And I click on "Goal_Pacing Checkbox"

    # Impressions
    And I click on "GP Type dropdown"
    And I click on "Impressions"
    And I set "<Value>" to "Enter the Number Field"
    And I click on "GP Add"
    Then I expect that element "GP Values_Added Section" does exist
    And I expect that element "GP Type" contains the text "Impressions"
    And I expect that element "GP Value" contains the text "1,234"
    And I expect that element "GP Values_Added Section Close Button" does exist

     # Starts
    When I click on "GP Type dropdown"
    And I click on "Starts"
    And I set "<Value>" to "Enter the Number Field"
    And I click on "GP Add"
    Then I expect that element "GP Values_Added Section" does exist
    And I expect that element "GP Type" contains the text "Starts"
    And I expect that element "GP Value" contains the text "1,234"
    And I expect that element "GP Values_Added Section Close Button2" does exist

     # Clicks
    When I click on "GP Type dropdown"
    And I click on "Clicks"
    And I set "<Value>" to "Enter the Number Field"
    And I click on "GP Add"
    Then I expect that element "GP Values_Added Section" does exist
    And I expect that element "GP Type" contains the text "Clicks"
    And I expect that element "GP Value" contains the text "1,234"
    And I expect that element "GP Values_Added Section Close Button3" does exist

     # Inventory Spend
    When I click on "GP Type dropdown"
    And I click on "Inventory Spend"
    And I set "<Value>" to "Enter the Number Field"
    And I click on "GP Add"
    Then I expect that element "GP Values_Added Section" does exist
    And I expect that element "GP Type" contains the text "Inventory Spend"
    And I expect that element "GP Value" contains the text "$ 1,234"
    And I expect that element "GP Values_Added Section Close Button4" does exist

     # Advertiser Cost
    When I click on "GP Type dropdown"
    And I click on "Advertiser Cost"
    And I set "<Value>" to "Enter the Number Field"
    And I click on "GP Add"
    Then I expect that element "GP Values_Added Section" does exist
    And I expect that element "GP Type" contains the text "Advertiser Cost"
    And I expect that element "GP Value" contains the text "$ 1,234"
    And I expect that element "GP Values_Added Section Close Button5" does exist

    Examples:
      |Start Date           |End date           |Delivery Name|Value     |
      |01/26/2018 07:50 PM  |01/28/2018 07:50 PM|Ha_D1        |1234      |


## Delivery UI - Pacing Block : Negative values entry and Validation
  Scenario Outline:
    And I click on the "delivery button"
    And I click on the "Delivery_Campaign_Banner"
    And I click on "Campaign Delivery Name"
    And I set "<Delivery Name>" to "Campaign Delivery Name"
    And I enter Date fields "<Start Date>", "<End date>" and select TimeZone Value
    And I click on "Goal_Pacing Checkbox"
    And I click on "GP Type dropdown"
    And I click on "Impressions"
    And I set "<Value>" to "Enter the Number Field"
    And I click on "GP Add"

    Then I expect that element "GP Values_Added Section" does exist
    And I expect that element "GP Type" contains the text "Impressions"
    And I expect that element "GP Value" contains the text "1,000"
    And I expect that element "GP Values_Added Section Close Button" does exist

    Examples:
      |Start Date           |End date           |Delivery Name|Value   |
      |01/26/2018 07:50 PM  |01/28/2018 07:50 PM|Ha_D1        |-1000   |


##Pacing

# Delivery UI - Goal & Pacing Block: Select "No Pacing" ,"GP Even_Pacing" and "GP Quick_Pacing"
  # Default selection is "GP Even_Pacing"

  Scenario:
    And I click on the "delivery button"
    And I click on the "Delivery_Campaign_Banner"
    Then I expect that element "GP Radio Buttons Section" does exist

    When I click on "GP Radio Buttons Section"
    And I pause for 400ms
    Then I expect that element "GP Even_Pacing Option" is selected
    And I pause for 400ms
    When I click on "GP No_Pacing"
    And I click on "GP Even_Pacing"
    And I click on "GP Quick_Pacing"
    # Need to check the requirements for the next steps on Pacing

## Additional Constraints: Verify the Constraint Value Impression for Daily that is added in the AC Section; Click on Close Button for each Type

  Scenario Outline:
    And I click on the "delivery button"
    And I click on the "Delivery_Campaign_Banner"
    Then I expect that element "Campaign Additional Constraints Checkbox" does exist

    # Impressions
    When I click on "Campaign Additional Constraints Checkbox"
    And I click on "AC Period dropdown"
    And I click on "Daily"
    And I click on "AC Type dropdown"
    And I click on "Impressions"
    And I set "<Impression Value>" to "AC Enter the Number Field"
    And I store the value from inputfield "AC Enter the Number Field" as "Value"
    Then I expect that "Value" displayed is with comma separated value of "<Impression Value>"
    When I click on "AC Add"
    Then I expect that element "AC Values_Added Section" does exist
    And I expect that element "AC Period" contains the text "Daily"
    And I expect that element "AC Type" contains the text "Impressions"
    And I expect that element "AC Value" contains the text "1,000"
    And I expect that element "AC Values_Added Section Close Button" does exist

    # Starts
    When I click on "AC Period dropdown"
    And I click on "Daily"
    And I click on "AC Type dropdown"
    And I pause for 400ms
    And I click on "Starts"
    And I set "<Starts Value>" to "AC Enter the Number Field"
    And I store the value from inputfield "AC Enter the Number Field" as "Value"
    Then I expect that "Value" displayed is with comma separated value of "<Starts Value>"
    When I click on "AC Add"
    And I pause for 400ms
    Then I expect that element "AC Values_Added Section" does exist
    And I expect that element "AC Period" contains the text "Daily"
    And I expect that element "AC Type" contains the text "Starts"
    And I expect that element "AC Value" contains the text "2,000"
    And I expect that element "AC Values_Added Section Close Button2" does exist

    # Clicks
    When I click on "AC Period dropdown"
    And I click on "Daily"
    And I click on "AC Type dropdown"
    And I click on "Clicks"
    And I set "<Clicks Value>" to "AC Enter the Number Field"
    And I store the value from inputfield "AC Enter the Number Field" as "Value"
    Then I expect that "Value" displayed is with comma separated value of "<Clicks Value>"
    When I click on "AC Add"
    Then I expect that element "AC Values_Added Section" does exist
    And I expect that element "AC Period" contains the text "Daily"
    And I expect that element "AC Type" contains the text "Clicks"
    And I expect that element "AC Value" contains the text "3,000"
    And I expect that element "AC Values_Added Section Close Button3" does exist

    # Inventory Spend
    When I click on "AC Period dropdown"
    And I click on "Daily"
    And I click on "AC Type dropdown"
    And I click on "Inventory Spend"
    And I set "<Inventory Spend Value>" to "AC Enter the Number Field"
    And I store the value from inputfield "AC Enter the Number Field" as "Value"
    Then I expect that "Value" displayed is with comma separated value of "<Inventory Spend Value>"
    When I click on "AC Add"
    Then I expect that element "AC Values_Added Section" does exist
    And I expect that element "AC Period" contains the text "Daily"
    And I expect that element "AC Type" contains the text "Inventory Spend"
    And I expect that element "AC Value" contains the text "$ 4,000"
    And I expect that element "AC Values_Added Section Close Button4" does exist

     # Advertiser Cost
    When I click on "AC Period dropdown"
    And I click on "Daily"
    And I click on "AC Type dropdown"
    And I click on "Advertiser Cost"
    And I set "<Advertiser Cost Value>" to "AC Enter the Number Field"
    And I store the value from inputfield "AC Enter the Number Field" as "Value"
    Then I expect that "Value" displayed is with comma separated value of "<Advertiser Cost Value>"
    When I click on "AC Add"
    Then I expect that element "AC Values_Added Section" does exist
    And I expect that element "AC Period" contains the text "Daily"
    And I expect that element "AC Type" contains the text "Advertiser Cost"
    And I expect that element "AC Value" contains the text "$ 5,000"
    And I expect that element "AC Values_Added Section Close Button5" does exist

   # Clicked on Close button for each Type Value entered above to verify the close action
    When I click on "AC Values_Added Section Close Button"
    Then I expect that element "AC Type" not contains the text "Impressions"
    When I click on "AC Values_Added Section Close Button"
    Then I expect that element "AC Type" not contains the text "Starts"
    When I click on "AC Values_Added Section Close Button"
    Then I expect that element "AC Type" not contains the text "Clicks"
    When I click on "AC Values_Added Section Close Button"
    Then I expect that element "AC Type" not contains the text "Inventory Spend"
    When I click on "AC Values_Added Section Close Button"
    Then I expect that element "AC Values_Added Section" does not exist

    Examples:

      |Impression Value|Starts Value|Clicks Value|Inventory Spend Value|Advertiser Cost Value|
      |1000            |2000        |3000        |4000                 |5000                 |


## Additional Constraints: Verify the Constraint Value Impression for Monthly that is added in the AC Section

  Scenario Outline:
    And I click on the "delivery button"
    And I click on the "Delivery_Campaign_Banner"
    Then I expect that element "Campaign Additional Constraints Checkbox" does exist

    # Starts
    When I click on "AC Period dropdown"
    And I click on "Daily"
    And I click on "AC Type dropdown"
    And I click on "Starts"
    And I set "<Value>" to "AC Enter the Number Field"
    And I click on "AC Add"
    Then I expect that element "AC Values_Added Section" does exist
    And I expect that element "AC Period" contains the text "Daily"
    And I expect that element "AC Type" contains the text "Starts"
    And I expect that element "AC Value" contains the text "1,000"
    And I expect that element "AC Values_Added Section Close Button" does exist

    # Inventory Spend
    When I click on "AC Period dropdown"
    And I click on "Daily"
    And I click on "AC Type dropdown"
    And I click on "Inventory Spend"
    And I set "<Value>" to "AC Enter the Number Field"
    And I click on "AC Add"
    Then I expect that element "AC Values_Added Section" does exist
    And I expect that element "AC Period" contains the text "Daily"
    And I expect that element "AC Type" contains the text "Inventory Spend"
    And I expect that element "AC Value" contains the text "$ 1,000"
    And I expect that element "AC Values_Added Section Close Button2" does exist

     # Advertiser Cost
    When I click on "AC Period dropdown"
    And I click on "Daily"
    And I click on "AC Type dropdown"
    And I click on "Advertiser Cost"
    And I set "<Value>" to "AC Enter the Number Field"
    And I click on "AC Add"
    Then I expect that element "AC Values_Added Section" does exist
    And I expect that element "AC Period" contains the text "Daily"
    And I expect that element "AC Type" contains the text "Advertiser Cost"
    And I expect that element "AC Value" contains the text "$ 1,000"
    And I expect that element "AC Values_Added Section Close Button3" does exist

    Examples:
      |Value  |
      |1000   |


## E2E New Delivery (active) for 15 days: SAVE functionality verification with data entered for "Starts" in Goal & Pacing Block,
  # "Weekly" and "Clicks" in Additional Constrains section and selecting Play button in Campaign banner
  # Mandatory Inventory Section fields
  # Validate the Campaign Name Section has the Campaign Name provided during Campaign creation
  Scenario Outline:
    And I click on the "delivery button"
    And I click on the "Delivery_Campaign_Banner"
    Then I expect that element "Delivery_Campaign_Banner" does equal stored value "Newest Campaign Name"
    And I expect that element "Campaign Goal_Pacing Section" does exist
    And I expect that element "Campaign AC Section" does exist
    And I expect that element "Campaign Inventory Section" does exist
    And I expect that element "Delivery_Save Button" does exist
    And I expect that element "Delivery_Save Button" is not enabled
    And I expect that element "Delivery_Cancel Button" does exist
    And I expect that element "Message in Inventory Block" contains the text "Please select at least one inventory"
    And I expect that element "Close" does exist

    When I click on "Campaign Delivery Name"
    And I click on "Campaign Pause Button"
    And I set "<Delivery Name>" to "Campaign Delivery Name"
    And I enter Date fields "<Start Date>", "<End date>" and select TimeZone Value
    And I click on "Goal_Pacing Checkbox"
    And I click on "GP Type dropdown"
    And I pause for 400ms
    And I click on "Starts"
    And I set "<Starts Value>" to "Enter the Number Field"
    And I click on "GP Add"
    Then I expect that element "GP Type" contains the text "Starts"
    And I expect that element "GP Value" contains the text "1,000"
    And I expect that element "GP Values_Added Section Close Button" does exist

    When I click on "Campaign Additional Constraints Checkbox"
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
    And I pause for 800ms
    When I click on "Delivery_Save Button"
    And I pause for 400ms

  # Reopen the delivery UI to see the delviery ui field values entered before Saving
    And I click on the "delivery button"
    Then I expect that element "Campaign Play Button" does exist
    And I click on the "Delivery_Campaign_Banner"
   # Then I expect that element "Campaign Delivery Name" contains the text "<Delivery Name>"
   # @bug
    And I pause for 800ms
#    Then I expect that element "campaign_Goal_Pacing Checkbox" is selected  (these two checkboxes are currently pointed to labels instead of Ids)
#    And I expect that element "Campaign Additional Constraints Checkbox" is selected
    And I expect that element "GP Type" contains the text "Starts"
    And I expect that element "GP Value" contains the text "1,000"
    And I expect that element "GP Values_Added Section Close Button" does exist
    And I expect that element "AC Values_Added Section" does exist
    And I expect that element "AC Period" contains the text "Daily"
    And I expect that element "AC Type" contains the text "Clicks"
    And I expect that element "AC Value" contains the text "2,000"
    And I expect that element "AC Values_Added Section Close Button" does exist

    Examples:
      |Start Date           |End date           |Delivery Name|Starts Value|Clicks Value|Min Bid Value|Max Bid Value|
      |01/26/2018 07:50 PM  |02/15/2018 07:50 PM|Ha_D1        |1000        |2000        |500          |600          |



##  #:Validate The Min and Max difference Validation when the Difference is 0
  Scenario Outline:
    And I click on the "delivery button"
    And I click on the "Delivery_Campaign_Banner"
    And I pause for 800ms
    And I fill Mandatory fields "<Min Bid Value>" , "<Max Bid Value>" and select Vendor in Inventory Section
    And I pause for 400ms
    Then I expect "Campaign_Inv_Overall_MinBid" to be equal to "Campaign_Inv_Overall_MaxBid"

    Examples:
      |Min Bid Value|Max Bid Value|
      |500          |500          |



## Inventory : " Overall " and "AppNexus" Vendor (Vendor/Inventory 1)
  #:Validate The Min and Max difference Validation  when the Difference 200
  Scenario Outline:
    And I click on the "delivery button"
    And I click on the "Delivery_Campaign_Banner"
    And I pause for 800ms
    And I fill Mandatory fields "<Min Bid Value>" , "<Max Bid Value>" and select Vendor in Inventory Section
    And I pause for 800ms
    Then I expect "Campaign_Inv_Overall_MinBid" to be 200 less than "Campaign_Inv_Overall_MaxBid"

    Examples:
      |Min Bid Value|Max Bid Value|
      |500          |700          |

## Start/End Date & Timezone : All Validations Validation
  @Bug @ODC-565
  Scenario Outline:
    And I click on the "delivery button"
    And I click on the "Delivery_Campaign_Banner"
    And I click on "Campaign Delivery Name"
    And I set "<Delivery Name>" to "Campaign Delivery Name"

    And I click on "start date input"
    Then I expect that inputfield "start date input" contains the current date
    And I expect that element "calendar" is visible

    When I set the inputfield "start date input" to the date 2 days ago
    And I set the inputfield "end date input" to the date 5 days ago
    And I click on "delivery name"
    Then I expect that element "end date error message" contains the text "End Date must be greater than the Start Date"

    When I set "Never" to the inputfield "end date input"
    And I click on "delivery name"
    Then I expect that element "end date error message" is not visible

      #testing picker options for start date
    When I click on "start date input"
    And I click on "go to today"
    Then I expect that inputfield "start date input" contains the current date
    When I click on "clear date selection"
    Then I expect that inputfield "start date input" contains the text "Invalid date"
    When I click on the "close calendar button"
    Then I expect that element "calendar" is not visible


      #testing picker options for end date
    When I click on "end date input"
    And I click on "go to today"
    Then I expect that inputfield "end date input" contains the current date
    When I click on "clear date selection"
    Then I expect that inputfield "end date input" contains the text "Invalid date"
    When I click on the "close calendar button"
    Then I expect that element "calendar" is not visible

      #testing timepicker-picker
    When I click on "start date input"
    And I click on the "select time picker"
    Then I expect that element "timepicker hour" contains the current hour
    And I expect that element "timepicker minute" contains the current minute

    When I click on the "timepicker hour"
    And I click on "hour 7"
    Then I expect that element "timepicker hour" contains the text "07"

    When I click on the "timepicker minute"
    And I click on "minute 15"
    Then I expect that element "timepicker minute" contains the text "15"

    When I click on the "increment hour button"
    Then I expect that element "timepicker hour" contains the text "08"

    When I click on the "decrement hour button"
    Then I expect that element "timepicker hour" contains the text "07"

    When I click on the "increment minute button"
    Then I expect that element "timepicker minute" contains the text "16"

    When I click on the "decrement minute button"
    Then I expect that element "timepicker minute" contains the text "15"

    Examples:
      |Delivery Name|
      | DNQA        |



## Inventory : " Overall " and "AppNexus" Vendor (Vendor/Inventory 1)
  #:Validate The Max and Min Bid fields with Max Bid greater than Min Bid when the Max Bid value is greater/less than Min Bid

  Scenario Outline:
    And I click on the "delivery button"
    And I click on the "Delivery_Campaign_Banner"
    And I pause for 800ms
    And I fill Mandatory fields "<Min Bid Value>" , "<Max Bid Value>" and select Vendor in Inventory Section
    And I pause for 400ms
    Then I expect that element "Message in Overall Max Bid" contains the text "Max Bid must be greater than Min Bid"
    When I clear the inputfield "Campaign_Inv_Overall_MaxBid"
    And I set "<Max Bid Value Greater>" to "Campaign_Inv_Overall_MaxBid"
    And I pause for 400ms
    Then I expect that element "Message in Overall Max Bid" does not exist

    Examples:
      |Min Bid Value|Max Bid Value|Max Bid Value Greater |
      |56           |43           |100                   |



## Inventory : INDIVIDUALLY
  #:Validate The Max and Min Bid fields " Required " Validation for Inventory Supersonic (Inventory 2)
  @Bug @ODC-628
  Scenario Outline:
    And I click on the "delivery button"
    And I click on the "Delivery_Campaign_Banner"
    And I pause for 800ms

    And I click on "INDIVIDUALLY"
    And I click on "Inv_Vendor0_SuperSonic"
    And I click on "Ind_Vend0_Min"
    And I click on "Ind_Vend0_Max"
    Then I expect that element "Inv_Vend0_Min_Validation" contains the text "Required"

    When I click on "Ind_Vend0_Max"
    And I click on "Ind_section"
    Then I expect that element "Inv_Vend0_Max_Validation" contains the text "Required"

    When I click on "Ind_Vend0_Min"
    And I set "<Ind_Vend0_Min>" to "Ind_Vend0_Min"
    And I store the value from inputfield "Ind_Vend0_Min" as "Value"
    Then I expect that "Value" displayed is with comma separated value of "<Ind_Vend0_Min>"
    And I expect that element "Inv_Vend0_Min_Validation" does not exist

    When I click on "Ind_Vend0_Max"
    And I set "<Ind_Vend0_Max>" to "Ind_Vend0_Max"
    And I store the value from inputfield "Ind_Vend0_Max" as "Value"
    Then I expect that "Value" displayed is with comma separated value of "<Ind_Vend0_Max>"
    And I expect that element "Inv_Vend0_Max_Validation" does not exist

    Examples:
      |Ind_Vend0_Min |Ind_Vend0_Max|
      |5000          |6000         |


## Individually :Validate The Max and Min Bid fields " Required " Validation for ALL Inventories
#  # (Default 3 Inventories)
  @Bug @ODC-628
  Scenario Outline:
    And I click on the "delivery button"
    And I click on the "Delivery_Campaign_Banner"
    And I pause for 800ms
    And I click on "INDIVIDUALLY"

    # VENDOR 1
    And I click on "Inv_Vendor0_SuperSonic"
    And I click on "Ind_Vend0_Min"
    And I click on "Ind_Vend0_Max"
    Then I expect that element "Inv_Vend0_Min_Validation" contains the text "Required"
    When I click on "Ind_Vend0_Max"
    And I click on "Ind_section"
    Then I expect that element "Inv_Vend0_Max_Validation" contains the text "Required"

    # VENDOR 2
    When I click on "Inv_Vendor1_AppNexus"
    And I click on "Ind_Vend1_Min"
    And I click on "Ind_Vend1_Max"
    Then I expect that element "Inv_Vend1_Min_Validation" contains the text "Required"
    When I click on "Ind_Vend1_Max"
    And I click on "Ind_section"
    Then I expect that element "Inv_Vend1_Max_Validation" contains the text "Required"


    When I click on "Ind_Vend1_Min"
    And I set "<Ind_Vend1_Min>" to "Ind_Vend1_Min"
    Then I expect that element "Inv_Vend1_Min_Validation" does not exist
    When I click on "Ind_Vend1_Max"
    And I set "<Ind_Vend1_Max>" to "Ind_Vend1_Max"
    And I expect that element "Inv_Vend1_Max_Validation" does not exist

    # VENDOR 3
    When I click on "Inv_Vendor2_RMedia"
    And I click on "Ind_Vend2_Min"
    And I click on "Ind_Vend2_Max"
    Then I expect that element "Inv_Vend2_Min_Validation" contains the text "Required"
    When I click on "Ind_Vend2_Max"
    And I click on "Ind_section"
    Then I expect that element "Inv_Vend2_Max_Validation" contains the text "Required"

    # VENDOR 1
    When I click on "Ind_Vend0_Min"
    And I set "<Ind_Vend0_Min>" to "Ind_Vend0_Min"
    Then I expect that element "Inv_Vend0_Min_Validation" does not exist
    When I click on "Ind_Vend0_Max"
    And I set "<Ind_Vend0_Max>" to "Ind_Vend0_Max"
    And I expect that element "Inv_Vend0_Max_Validation" does not exist

    # VENDOR 3
    When I click on "Ind_Vend2_Min"
    And I set "<Ind_Vend2_Min>" to "Ind_Vend2_Min"
    Then I expect that element "Inv_Vend2_Min_Validation" does not exist
    When I click on "Ind_Vend2_Max"
    And I set "<Ind_Vend2_Max>" to "Ind_Vend2_Max"
    And I expect that element "Inv_Vend2_Max_Validation" does not exist

    Examples:
      |Ind_Vend0_Min |Ind_Vend0_Max|Ind_Vend1_Min|Ind_Vend1_Max |Ind_Vend2_Max|Ind_Vend2_Min|
      |500           |600          |500          |600           |800          |700          |


## Individually Inventory :Validate the Min Bid fields "Required" and Max Bid Field "Should be greater than 0" Initially
  # Validating Max Bid Field as "Should be greater than 0" when "0" is entered both under Min & Max Bid fields
  # Later Add Value to MAX bid field to get rid off "Should be greater than 0" Validation
  # Then Add value to Min bid to get rid off "Required" validation (ALL 3 DEFAULT Vendors)
  @Bug @ODC-628
  Scenario Outline:
    And I click on the "delivery button"
    And I click on the "Delivery_Campaign_Banner"
    And I pause for 800ms
    And I click on "INDIVIDUALLY"

    # VENDOR 1
    And I click on "Inv_Vendor0_SuperSonic"
    And I click on "Ind_Vend0_Min"
    And I click on "Ind_Vend0_Max"
    Then I expect that element "Inv_Vend0_Min_Validation" contains the text "Required"
    When I click on "Ind_Vend0_Max"
    And I set "<Ind_Vend0_Max>" to "Ind_Vend0_Max"
    And I click on "Ind_section"
    Then I expect that element "Inv_Vend0_Max_Validation" contains the text "Should be greater than 0"

    # VENDOR 2
    When I click on "Inv_Vendor1_AppNexus"
    And I click on "Ind_Vend1_Min"
    And I click on "Ind_Vend1_Max"
    Then I expect that element "Inv_Vend1_Min_Validation" contains the text "Required"
    When I click on "Ind_Vend1_Max"
    And I set "<Ind_Vend1_Max>" to "Ind_Vend1_Max"
    And I click on "Ind_section"
    Then I expect that element "Inv_Vend1_Max_Validation" contains the text "Should be greater than 0"

    # VENDOR 3
    When I click on "Inv_Vendor2_RMedia"
    And I click on "Ind_Vend2_Min"
    And I click on "Ind_Vend2_Max"
    Then I expect that element "Inv_Vend2_Min_Validation" contains the text "Required"
    When I click on "Ind_Vend2_Max"
    And I set "<Ind_Vend2_Max>" to "Ind_Vend2_Max"
    And I click on "Ind_section"
    Then I expect that element "Inv_Vend2_Max_Validation" contains the text "Should be greater than 0"

    # VENDOR 1
    When I click on "Ind_Vend0_Max"
    And I set "<Ind_Vend0_Greater than 0>" to "Ind_Vend0_Max"
    And I expect that element "Inv_Vend0_Max_Validation" does not exist
    And I expect that element "Inv_Vend0_Min_Validation" does exist

    # VENDOR 2
    When I click on "Ind_Vend1_Max"
    And I set "<Ind_Vend1_Greater than 0>" to "Ind_Vend1_Max"
    And I expect that element "Inv_Vend1_Max_Validation" does not exist
    And I expect that element "Inv_Vend1_Min_Validation" does exist

   # VENDOR 3
    When I click on "Ind_Vend2_Max"
    And I set "<Ind_Vend2_Greater than 0>" to "Ind_Vend2_Max"
    And I expect that element "Inv_Vend2_Max_Validation" does not exist
    And I expect that element "Inv_Vend2_Min_Validation" does exist

     # VENDOR 1
    When I set "<Ind_Vend0_Min>" to "Ind_Vend0_Min"
    Then I expect that element "Inv_Vend0_Min_Validation" does not exist

     # VENDOR 2
    When I set "<Ind_Vend1_Min>" to "Ind_Vend1_Min"
    Then I expect that element "Inv_Vend1_Min_Validation" does not exist

     # VENDOR 3
    When I set "<Ind_Vend2_Min>" to "Ind_Vend2_Min"
    Then I expect that element "Inv_Vend2_Min_Validation" does not exist

    Examples:
      |Ind_Vend0_Greater than 0|Ind_Vend0_Max|Ind_Vend1_Greater than 0|Ind_Vend1_Max |Ind_Vend2_Max|Ind_Vend2_Greater than 0|Ind_Vend0_Min|Ind_Vend1_Min|Ind_Vend2_Min|
      |8                       |0            |9                       |0             |0            |6                       |0            |0           |0             |
      |8                       |0            |9                       |0             |0            |6                       |1            |1           |1             |



## Individually Inventory :Validate the Max field validation "Max Bid must be greater than Min Bid" and Enter value to Min Bid field
  # such that the error is no more existing.. (2 Vendors with 2 sets of Test Data)

  Scenario Outline:
    And I click on the "delivery button"
    And I click on the "Delivery_Campaign_Banner"
    And I pause for 800ms
    And I click on "INDIVIDUALLY"

    # VENDOR 1
    When I click on "Inv_Vendor1_AppNexus"
    When I click on "Ind_Vend1_Min"
    And I set "<Ind_Vend1_Min>" to "Ind_Vend1_Min"
    When I click on "Ind_Vend1_Max"
    And I set "<Ind_Vend1_Max>" to "Ind_Vend1_Max"
    And I click on "Ind_section"
    Then I expect that element "Inv_Vend1_Max_Validation" contains the text "Max Bid must be greater than Min Bid"

     # VENDOR 2
    When I click on "Inv_Vendor2_RMedia"
    When I click on "Ind_Vend2_Min"
    And I set "<Ind_Vend2_Min>" to "Ind_Vend2_Min"
    When I click on "Ind_Vend2_Max"
    And I set "<Ind_Vend2_Max>" to "Ind_Vend2_Max"
    And I click on "Ind_section"
    Then I expect that element "Inv_Vend2_Max_Validation" contains the text "Max Bid must be greater than Min Bid"


    # VENDOR 1
    When I click on "Ind_Vend1_Max"
    And I set "<Ind_Vend1_Max_Greater_Min>" to "Ind_Vend1_Max"
    And I expect that element "Inv_Vend1_Max_Validation" does not exist

    # VENDOR 2
    When I click on "Ind_Vend2_Max"
    And I set "<Ind_Vend2_Max_Greater_Min>" to "Ind_Vend2_Max"
    And I expect that element "Inv_Vend2_Max_Validation" does not exist

    Examples:
      |Ind_Vend1_Min|Ind_Vend1_Max |Ind_Vend2_Max|Ind_Vend2_Min|Ind_Vend1_Max_Greater_Min|Ind_Vend2_Max_Greater_Min|
      |500          |400           |400          |700          |800                      |800                      |
      |56           |43            |43           |56           |100                      |100                      |

## Delivery UI - Inventory Block - Overall: Validate the default message when no Vendor(s) is selected
  #Validation of Blank values entry for Overall & One Vendor under Min & Max bid fields
  #then re-enter correct values & validate that warning messages don't exist

  Scenario Outline:
    And I click on the "delivery button"
    And I click on the "Delivery_Campaign_Banner"
    And I pause for 800ms
    And I click on the "Campaign Inventory Checkbox"

    #OVERALL
    And I click on the "OVERALL"
    Then I expect that element "Inv_Overall_MinMaxSection" is visible
    And I expect that element "Message in Inventory Block" contains the text "Please select at least one inventory"


    When I click on "Campaign_Inv_Overall_MinBid"
    And I click on "Campaign_Inv_Overall_MaxBid"
    Then I expect that element "Message in Overall Min Bid" contains the text "Required"

    And I click on "Campaign_Inv_Overall_MaxBid"
    And I click on "Campaign_Inv_Overall_MinBid"
    Then I expect that element "Message in Overall Max Bid" contains the text "Required"

    When I set "<Re-enter Overall Min Bid Value>" to "Campaign_Inv_Overall_MinBid"
    Then I expect that element "Message in Overall Min Bid" is not visible

    When I set "<Re-enter Overall Max Bid Value>" to "Campaign_Inv_Overall_MaxBid"
    Then I expect that element "Message in Overall Max Bid" is not visible

    #Vendor1
    When I click on the "Inv_Vendor1_AppNexus"
    And I click on "Ind_Vend1_Min"
    And I click on "Ind_Vend1_Max"
    And I click on the "OVERALL"
    # Add a Then Step to verify the Save works with Overall Min and Max (Future To-DO)

    Examples:

      | Re-enter Overall Min Bid Value | Re-enter Overall Max Bid Value |
      | 200                            | 400                            |


## Delivery UI - Inventory Block - Overall: Validation of Negative values entry for overall & one Vendor under Min & Max bid fields
  Scenario Outline:
    And I click on the "delivery button"
    And I click on the "Delivery_Campaign_Banner"
    And I pause for 800ms
    And I click on the "Campaign Inventory Checkbox"

    #OVERALL
    And I click on the "OVERALL"
    Then I expect that element "Inv_Overall_MinMaxSection" is visible
    When I set "<Overall Min Bid Value>" to "Campaign_Inv_Overall_MinBid"
    And I set "<Overall Max Bid Value>" to "Campaign_Inv_Overall_MaxBid"

    #VENDOR1
    And I click on the "Inv_Vendor1_AppNexus"
    Then I expect that element "Inv_Vendor1_AppNexus_MinMaxSection" is visible
    When I set "<Vendor1 Min Bid Value>" to "Ind_Vend1_Min"
    And I set "<Vendor1 Max Bid Value>" to "Ind_Vend1_Max"
    # Verify this scenario with Save button (Add Budget steps to this scenario)

    Examples:

      |Overall Min Bid Value |Overall Max Bid Value|Vendor1 Min Bid Value |Vendor1 Max Bid Value |
      |-100                  |-200                 |-100                  |-200                  |


## Delivery UI - Inventory Block - Overall: Validation of 0 values entry for All three Vendor under Min & Max bid fields
  # later re-enter correct values & validate that warning messages don't exists
  Scenario Outline:
    And I click on the "delivery button"
    And I click on the "Delivery_Campaign_Banner"
    And I pause for 800ms
    And I click on the "Campaign Inventory Checkbox"
    And I click on the "OVERALL"

    #Vendor1
    And I click on the "Inv_Vendor0_SuperSonic"
    Then I expect that element "Inv_Vendor0_SuperSonic_MinMaxSection" is visible
    When I set "<Vendor0 Min Bid Value>" to "Ind_Vend0_Min"
    And I set "<Vendor0 Max Bid Value>" to "Ind_Vend0_Max"
    And I click on the "Inv_Vendor1_AppNexus"
    Then I expect that element "Inv_Vendor1_AppNexus_MinMaxSection" is visible
    And I expect that element "Inv_Vend0_Max_Validation" contains the text "Should be greater than 0"

    #Vendor2
    When I set "<Vendor1 Min Bid Value>" to "Ind_Vend1_Min"
    And I set "<Vendor1 Max Bid Value>" to "Ind_Vend1_Max"
    And I click on the "Inv_Vendor2_RMedia"
    Then I expect that element "Inv_Vendor2_RMedia_MinMaxSection" is visible
    And I expect that element "Inv_Vend1_Max_Validation" contains the text "Should be greater than 0"

    #Vendor3
    When I set "<Vendor2 Min Bid Value>" to "Ind_Vend2_Min"
    And I set "<Vendor2 Max Bid Value>" to "Ind_Vend2_Max"
    And I click on the "OVERALL"
    Then I expect that element "Inv_Vend2_Max_Validation" contains the text "Should be greater than 0"

    #Vendor1
    And I pause for 800ms for loading
    When I clear the inputfield "Ind_Vend0_Max"
    And I set "<Re-enter Vendor0 Max Bid Value>" to "Ind_Vend0_Max"
    Then I expect that element "Inv_Vend0_Max_Validation" is not visible

    #Vendor2
    When I clear the inputfield "Ind_Vend1_Max"
    And I set "<Re-enter Vendor1 Max Bid Value>" to "Ind_Vend1_Max"
    Then I expect that element "Inv_Vend1_Max_Validation" is not visible

    #Vendor3
    When I clear the inputfield "Ind_Vend2_Max"
    And I set "<Re-enter Vendor2 Max Bid Value>" to "Ind_Vend2_Max"
    Then I expect that element "Inv_Vend2_Max_Validation" is not visible

    Examples:
      |Vendor0 Min Bid Value |Vendor0 Max Bid Value |Vendor1 Min Bid Value |Vendor1 Max Bid Value |Vendor2 Min Bid Value |Vendor2 Max Bid Value | Re-enter Vendor0 Max Bid Value | Re-enter Vendor1 Max Bid Value | Re-enter Vendor2 Max Bid Value |
      |0                     |0                     |0                     |0                     |0                     |0                     | 200                       | 200                       | 200                       |

@run
## Delivery UI - Inventory Block - Overall: Validation of Warning message when Max Bid value is less than Min Bid value for Overall & One Vendor
  # then re-enter correct values to verify the warning messages don't exists
  Scenario Outline:
    And I click on the "delivery button"
    And I click on the "Delivery_Campaign_Banner"
    And I pause for 800ms
    And I click on the "Campaign Inventory Checkbox"

    #OVERALL
    And I click on the "OVERALL"
    Then I expect that element "Inv_Overall_MinMaxSection" is visible
    When I set "<Overall Min Bid Value>" to "Campaign_Inv_Overall_MinBid"
    And I set "<Overall Max Bid Value>" to "Campaign_Inv_Overall_MaxBid"
    And I click on "Campaign_Inv_Overall_MinBid"
    And I expect that element "Message in Overall Max Bid" contains the text "Max Bid must be greater than Min Bid"

    And I click on the "Inv_Vendor1_AppNexus"

    #Vendor1
    When I set "<Vendor1 Min Bid Value>" to "Ind_Vend1_Min"
    And I set "<Vendor1 Max Bid Value>" to "Ind_Vend1_Max"
    And I click on the "Inv_Vendor2_RMedia"
    Then I expect that element "Inv_Vend1_Max_Validation" contains the text "Max Bid must be greater than Min Bid"

    #OVERALL
    When I clear the inputfield "Campaign_Inv_Overall_MaxBid"
    And I set "<Re-enter Overall Max Bid Value>" to "Campaign_Inv_Overall_MaxBid"
    Then I expect that element "Message in Overall Max Bid" is not visible

    #Vendor1
    When I clear the inputfield "Ind_Vend1_Max"
    And I set "<Re-enter Vendor1 Max Bid Value>" to "Ind_Vend1_Max"
    Then I expect that element "Inv_Vend1_Max_Validation" is not visible

    Examples:
      |Overall Min Bid Value |Overall Max Bid Value|Vendor1 Min Bid Value |Vendor1 Max Bid Value | Re-enter Overall Max Bid Value | Re-enter Vendor1 Max Bid Value |
      |700                   |500                  |700                   |500                   | 900                       | 900                       |



## Delivery UI - Inventory Block - Overall: Validation of Warning message when Max Bid value is less than Min Bid value for All three Vendor under Min & Max bid fields then re-entering correct values & validating that warning messages don't exists
  Scenario Outline:
    And I click on the "delivery button"
    And I click on the "Delivery_Campaign_Banner"
    And I pause for 800ms
    And I click on the "Campaign Inventory Checkbox"
    And I click on the "OVERALL"

    #Vendor1
    And I click on the "Inv_Vendor0_SuperSonic"
    Then I expect that element "Inv_Vendor0_SuperSonic_MinMaxSection" is visible
    When I set "<Vendor0 Min Bid Value>" to "Ind_Vend0_Min"
    And I set "<Vendor0 Max Bid Value>" to "Ind_Vend0_Max"
    And I click on the "Inv_Vendor1_AppNexus"
    Then I expect that element "Inv_Vendor1_AppNexus_MinMaxSection" is visible
    And I expect that element "Inv_Vend0_Max_Validation" contains the text "Max Bid must be greater than Min Bid"

    #Vendor2
    When I set "<Vendor1 Min Bid Value>" to "Ind_Vend1_Min"
    And I set "<Vendor1 Max Bid Value>" to "Ind_Vend1_Max"
    And I click on the "Inv_Vendor2_RMedia"
    Then I expect that element "Inv_Vendor2_RMedia_MinMaxSection" is visible
    And I expect that element "Inv_Vend1_Max_Validation" contains the text "Max Bid must be greater than Min Bid"

    #Vendor3
    When I set "<Vendor2 Min Bid Value>" to "Ind_Vend2_Min"
    And I set "<Vendor2 Max Bid Value>" to "Ind_Vend2_Max"
    And I click on the "OVERALL"
    Then I expect that element "Inv_Vend2_Max_Validation" contains the text "Max Bid must be greater than Min Bid"

    #Vendor1
    When I clear the inputfield "Ind_Vend0_Max"
    And I set "<Re-enter Vendor0 Max Bid Value>" to "Ind_Vend0_Max"
    Then I expect that element "Inv_Vend0_Max_Validation" is not visible

    #Vendor2
    When I clear the inputfield "Ind_Vend1_Max"
    And I set "<Re-enter Vendor1 Max Bid Value>" to "Ind_Vend1_Max"
    Then I expect that element "Inv_Vend1_Max_Validation" is not visible

    #Vendor3
    When I clear the inputfield "Ind_Vend2_Max"
    And I set "<Re-enter Vendor2 Max Bid Value>" to "Ind_Vend2_Max"
    Then I expect that element "Inv_Vend2_Max_Validation" is not visible

    Examples:
      |Vendor0 Min Bid Value |Vendor0 Max Bid Value |Vendor1 Min Bid Value |Vendor1 Max Bid Value |Vendor2 Min Bid Value |Vendor2 Max Bid Value | Re-enter Vendor0 Max Bid Value | Re-enter Vendor1 Max Bid Value | Re-enter Vendor2 Max Bid Value |
      |700                   |500                   |700                   |500                   |700                   |500                   | 900                            | 900                            | 900                            |

#Delivery UI - Inventory Block - Overall: Validation of Eight decimal value entry for overall &
   #All three Vendor under Min & Max bid fields
  Scenario Outline:
    And I click on the "delivery button"
    And I click on the "Delivery_Campaign_Banner"
    And I pause for 800ms
    And I click on the "Campaign Inventory Checkbox"

    #OVERALL
    And I click on the "OVERALL"
    Then I expect that element "Inv_Overall_MinMaxSection" is visible
    And I expect that element "Message in Inventory Block" contains the text "Please select at least one inventory"
    When I set "<Overall Min Bid Value>" to "Campaign_Inv_Overall_MinBid"
    And I store the value from inputfield "Campaign_Inv_Overall_MinBid" as "Campaign_Inv_Overall_MinBid_Value"
    And I set "<Overall Max Bid Value>" to "Campaign_Inv_Overall_MaxBid"
    And I store the value from inputfield "Campaign_Inv_Overall_MaxBid" as "Campaign_Inv_Overall_MaxBid_Value"
    Then I expect "Campaign_Inv_Overall_MinBid_Value" to be 100 less than "Campaign_Inv_Overall_MaxBid_Value"

    #Vendor1
    When I click on the "Inv_Vendor0_SuperSonic"
    Then I expect that element "Inv_Vendor0_SuperSonic_MinMaxSection" is visible
    When I set "<Vendor0 Min Bid Value>" to "Ind_Vend0_Min"
    And I store the value from inputfield "Ind_Vend0_Min" as "Ind_Vend0_Min_Value"
    And I set "<Vendor0 Max Bid Value>" to "Ind_Vend0_Max"
    And I store the value from inputfield "Ind_Vend0_Max" as "Ind_Vend0_Max_Value"
    Then I expect "Ind_Vend0_Min_Value" to be 200 less than "Ind_Vend0_Max_Value"

    #Vendor2
    When I click on the "Inv_Vendor1_AppNexus"
    Then I expect that element "Inv_Vendor1_AppNexus_MinMaxSection" is visible
    When I set "<Vendor1 Min Bid Value>" to "Ind_Vend1_Min"
    And I store the value from inputfield "Ind_Vend1_Min" as "Ind_Vend1_Min_Value"
    And I set "<Vendor1 Max Bid Value>" to "Ind_Vend1_Max"
    And I store the value from inputfield "Ind_Vend1_Max" as "Ind_Vend1_Max_Value"
    Then I expect "Ind_Vend1_Min_Value" to be 200 less than "Ind_Vend1_Max_Value"

    #Vendor3
    When I click on the "Inv_Vendor2_RMedia"
    Then I expect that element "Inv_Vendor2_RMedia_MinMaxSection" is visible
    When I set "<Vendor2 Min Bid Value>" to "Ind_Vend2_Min"
    And I store the value from inputfield "Ind_Vend2_Min" as "Ind_Vend2_Min_Value"
    And I set "<Vendor2 Max Bid Value>" to "Ind_Vend2_Max"
    And I store the value from inputfield "Ind_Vend2_Max" as "Ind_Vend2_Max_Value"
    Then I expect "Ind_Vend2_Min_Value" to be 200 less than "Ind_Vend2_Max_Value"

    Examples:
      |Overall Min Bid Value |Overall Max Bid Value| Vendor0 Min Bid Value | Vendor0 Max Bid Value |Vendor1 Min Bid Value | Vendor1 Max Bid Value |Vendor2 Min Bid Value | Vendor2 Max Bid Value |
      |500.123456789         |600.123456789        | 500.123456789         | 700.123456789         |500.123456789         | 700.123456789         |500.123456789         | 700.123456789         |


#Delivery UI - Inventory Block - Overall: Min & Max bid fields difference validation for Overall &
   #One Vendor with Valid values entry
  Scenario Outline:
    And I click on the "delivery button"
    And I click on the "Delivery_Campaign_Banner"
    And I pause for 800ms
    And I click on the "Campaign Inventory Checkbox"

    #OVERALL
    And I click on the "OVERALL"
    Then I expect that element "Inv_Overall_MinMaxSection" is visible
    And I expect that element "Message in Inventory Block" contains the text "Please select at least one inventory"
    When I set "<Overall Min Bid Value>" to "Campaign_Inv_Overall_MinBid"
    And I store the value from inputfield "Campaign_Inv_Overall_MinBid" as "Campaign_Inv_Overall_MinBid_Value"
    And I store the value from inputfield "Campaign_Inv_Overall_MinBid" as "Value"
   # Then I expect that "Value" displayed is with comma separated value of "<Overall Min Bid Value>"

    When I set "<Overall Max Bid Value>" to "Campaign_Inv_Overall_MaxBid"
    And I store the value from inputfield "Campaign_Inv_Overall_MaxBid" as "Campaign_Inv_Overall_MaxBid_Value"
    And I store the value from inputfield "Campaign_Inv_Overall_MaxBid" as "Value"
   # Then I expect that "Value" displayed is with comma separated value of "<Overall Max Bid Value>"
    And I expect "Campaign_Inv_Overall_MinBid_Value" to be 1000 less than "Campaign_Inv_Overall_MaxBid_Value"

    #Vendor1
    When I click on the "Inv_Vendor0_SuperSonic"
    Then I expect that element "Inv_Vendor0_SuperSonic_MinMaxSection" is visible
    When I set "<Vendor0 Min Bid Value>" to "Ind_Vend0_Min"
    And I store the value from inputfield "Ind_Vend0_Min" as "Ind_Vend0_Min_Value"
    And I store the value from inputfield "Ind_Vend0_Min" as "Value"
  #  Then I expect that "Value" displayed is with comma separated value of "<Vendor0 Min Bid Value>"

    When I set "<Vendor0 Max Bid Value>" to "Ind_Vend0_Max"
    And I store the value from inputfield "Ind_Vend0_Max" as "Ind_Vend0_Max_Value"
    And I store the value from inputfield "Ind_Vend0_Max" as "Value"
 #   Then I expect that "Value" displayed is with comma separated value of "<Vendor0 Max Bid Value>"
    And I expect "Ind_Vend0_Min_Value" to be 2000 less than "Ind_Vend0_Max_Value"

    Examples:
      |Overall Min Bid Value |Overall Max Bid Value| Vendor0 Min Bid Value | Vendor0 Max Bid Value |
      |5000                   |6000                | 5000                  | 7000                  |



#Delivery UI - Inventory Block - Overall: Min & Max bid fields Validation for Two Vendors with valid values entry
  Scenario Outline:
    And I click on the "delivery button"
    And I click on the "Delivery_Campaign_Banner"
    And I pause for 800ms
    And I click on the "Campaign Inventory Checkbox"
    And I click on the "OVERALL"

    #Vendor1
    When I click on the "Inv_Vendor1_AppNexus"
    Then I expect that element "Inv_Vendor1_AppNexus_MinMaxSection" is visible
    When I set "<Vendor1 Min Bid Value>" to "Ind_Vend1_Min"
    And I store the value from inputfield "Ind_Vend1_Min" as "Ind_Vend1_Min_Value"
    And I set "<Vendor1 Max Bid Value>" to "Ind_Vend1_Max"
    And I store the value from inputfield "Ind_Vend1_Max" as "Ind_Vend1_Max_Value"
    Then I expect "Ind_Vend1_Min_Value" to be 200 less than "Ind_Vend1_Max_Value"

    #Vendor2
    When I click on the "Inv_Vendor2_RMedia"
    Then I expect that element "Inv_Vendor2_RMedia_MinMaxSection" is visible
    When I set "<Vendor2 Min Bid Value>" to "Ind_Vend2_Min"
    And I store the value from inputfield "Ind_Vend2_Min" as "Ind_Vend2_Min_Value"
    And I set "<Vendor2 Max Bid Value>" to "Ind_Vend2_Max"
    And I store the value from inputfield "Ind_Vend2_Max" as "Ind_Vend2_Max_Value"
    Then I expect "Ind_Vend2_Min_Value" to be 200 less than "Ind_Vend2_Max_Value"

    Examples:
      |Vendor1 Min Bid Value | Vendor1 Max Bid Value |Vendor2 Min Bid Value | Vendor2 Max Bid Value |
      |500                   | 700                   |500                   | 700                   |

#Delivery UI - Inventory Block - Individually: Validation of Negative values entry for All three Vendors under Min & Max bid fields
  Scenario Outline:
    And I click on the "delivery button"
    And I click on the "Delivery_Campaign_Banner"
    And I pause for 800ms
    And I click on the "Campaign Inventory Checkbox"
    And I click on the "INDIVIDUALLY"

    #Vendor1
    And I click on the "Inv_Vendor0_SuperSonic"
    Then I expect that element "Inv_Vendor0_SuperSonic_MinMaxSection" is visible
    When I set "<Vendor0 Min Bid Value>" to "Ind_Vend0_Min"
    And I set "<Vendor0 Max Bid Value>" to "Ind_Vend0_Max"

    #Vendor2
    And I click on the "Inv_Vendor1_AppNexus"
    Then I expect that element "Inv_Vendor1_AppNexus_MinMaxSection" is visible
    When I set "<Vendor1 Min Bid Value>" to "Ind_Vend1_Min"
    And I set "<Vendor1 Max Bid Value>" to "Ind_Vend1_Max"

    #Vendor3
    And I click on the "Inv_Vendor2_RMedia"
    Then I expect that element "Inv_Vendor2_RMedia_MinMaxSection" is visible
    When I set "<Vendor2 Min Bid Value>" to "Ind_Vend2_Min"
    And I set "<Vendor2 Max Bid Value>" to "Ind_Vend2_Max"

    Examples:

      |Vendor0 Min Bid Value |Vendor0 Max Bid Value |Vendor1 Min Bid Value |Vendor1 Max Bid Value |Vendor2 Min Bid Value |Vendor2 Max Bid Value |
      |-100                  |-200                  |-100                  |-200                  |-100                  |-200                  |


#Delivery UI - Inventory Block - Individually: Validation of Eight decimal value entry for All three Vendor under Min & Max bid fields
  Scenario Outline:
    And I click on the "delivery button"
    And I click on the "Delivery_Campaign_Banner"
    And I pause for 800ms
    And I click on the "Campaign Inventory Checkbox"
    And I click on the "INDIVIDUALLY"

    #Vendor1
    And I click on the "Inv_Vendor0_SuperSonic"
    Then I expect that element "Inv_Vendor0_SuperSonic_MinMaxSection" is visible
    When I set "<Vendor0 Min Bid Value>" to "Ind_Vend0_Min"
    And I store the value from inputfield "Ind_Vend0_Min" as "Ind_Vend0_Min_Value"
    And I set "<Vendor0 Max Bid Value>" to "Ind_Vend0_Max"
    And I store the value from inputfield "Ind_Vend0_Max" as "Ind_Vend0_Max_Value"
    Then I expect "Ind_Vend0_Min_Value" to be 100 less than "Ind_Vend0_Max_Value"

    #Vendor2
    When I click on the "Inv_Vendor1_AppNexus"
    Then I expect that element "Inv_Vendor1_AppNexus_MinMaxSection" is visible
    When I set "<Vendor1 Min Bid Value>" to "Ind_Vend1_Min"
    And I store the value from inputfield "Ind_Vend1_Min" as "Ind_Vend1_Min_Value"
    And I set "<Vendor1 Max Bid Value>" to "Ind_Vend1_Max"
    And I store the value from inputfield "Ind_Vend1_Max" as "Ind_Vend1_Max_Value"
    Then I expect "Ind_Vend1_Min_Value" to be 100 less than "Ind_Vend1_Max_Value"

    #Vendor3
    When I click on the "Inv_Vendor2_RMedia"
    Then I expect that element "Inv_Vendor2_RMedia_MinMaxSection" is visible
    When I set "<Vendor2 Min Bid Value>" to "Ind_Vend2_Min"
    And I store the value from inputfield "Ind_Vend2_Min" as "Ind_Vend2_Min_Value"
    And I set "<Vendor2 Max Bid Value>" to "Ind_Vend2_Max"
    And I store the value from inputfield "Ind_Vend0_Max" as "Ind_Vend2_Max_Value"
    Then I expect "Ind_Vend2_Min_Value" to be 100 less than "Ind_Vend2_Max_Value"

    Examples:

      |Vendor0 Min Bid Value |Vendor0 Max Bid Value |Vendor1 Min Bid Value |Vendor1 Max Bid Value |Vendor2 Min Bid Value |Vendor2 Max Bid Value |
      |100.123456789         |200.123456789         |100.123456789         |200.123456789         |100.123456789         |200.123456789         |



 ## ODC-474 and ODC-634

  # Verify Toggle Play and Pause Icon functionality in the Campaign Banner and verify Save functionality
   # also, verify Activate Button message prompted

  Scenario:
    And I click on the "delivery button"

    # Verify By Default Pause button appears in the Campaign Banner and by default Save button is not enabled
    Then I expect that element "Campaign Pause Button" does exist
    And I expect that element "Delivery_Save Button" is not enabled

    # clicking on the Pause button -> Play button appears and Save button enables
    When I click on "Campaign Pause Button"
    Then I expect that element "Campaign Play Button" does exist
    And I expect that element "Campaign Pause Button" does not exist
    And I expect that element "Delivery_Save Button" is enabled

    # Verify when clicked on Play button then Pause button appears and Save button turns disabled as per default state of the delivery UI
    When I click on "Campaign Play Button"
    Then I expect that element "Campaign Pause Button" does exist
    And I expect that element "Campaign Play Button" does not exist
    And I expect that element "Delivery_Save Button" is not enabled

    # Verify the Save functionality to save the Play button
    When I click on "Campaign Pause Button"
    And I click on "Delivery_Save Button"
    Then I expect that element "Modal Window" does not exist

   # Reopen the delivery UI to see the  Play button is still displayed that is selected before Saving in above steps
    And I click on the "delivery button"
    Then I expect that element "Campaign Play Button" does exist
    And I expect that element "Delivery_Save Button" is not enabled


   # Now Toggle to Play button to ensure Save button is enabled after this change
    When I click on "Campaign Play Button"
    Then I expect that element "Campaign Pause Button" does exist
    And I expect that element "Delivery_Save Button" is enabled
    And I click on "Delivery_Save Button"

    #Activate Campaign
    And I click on "Activate campaign"
    Then I expect that element "Activate message pop-up" does exist
    And I expect that element "Activate message pop-up" contains the text "Are you sure you want to activate this campaign?"
    And I expect that element "Publish button in activate campaign pop-up" does exist
    And I expect that element "Cancel Button in activate campaign pop-up" does exist

    When I click on "Publish button in activate campaign pop-up"
    # TOBE implemented refer to ODC-634 comments ^^
