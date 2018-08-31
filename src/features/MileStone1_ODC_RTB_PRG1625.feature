Feature: Validate ODC RTB Bid response update is in DRUID and RTB Util


### New User for existing Account and creative ; Validate RTB Bid response update is in Perf DRUID
#
#  Scenario Outline:
#
#    Given I log into the site "ODC" as an admin
#    And I select default account
#    And I expect to be on the "ODCDashboard" page
#    When I click on "Account Management"
#
## #Create New Account
##    And I create New Account with user defined values "<Parent Account Name>", "<Account Name>", "<Valid EmailId>", "<Domain>" and "Imagepic"
##    And I pause for 800ms for the database to update
##
##  ##Temporary steps to logout to see new account created-----##
##    And I expect to be on the "ODCLogin" page
##    Given I log into the site "ODC" as an admin
##    When I select default account
##    And I expect to be on the "ODCDashboard" page
##    And I click on "Account Management"
##    Then I expect to be on the "ODCAccountManagement" page
#  ##-----##
#   ## Create New User
##    And I create New User with user defined values "New Account Name", "<User Name>" and "<User Email Id>"
#    And I click on "New User Button"
#    Then I expect that element "Modal Window" does exist
#    And I click on "Parent dropdown"
#    And I set "<Account Name>" to "Group Account Name"
#    And I click on "<Account Name>" in the "Parent Account" drop down
#    And I set "<User Name>" to "User Name"
#    And I set "<User Email Id>" to "User Email Id"
#
#    Then I store the value from inputfield "User Email Id" as "New User Email"
#
#    When I set "<User Email Id>" to the inputfield appended with current Date_Time "User Email Id"
#    And I click on "Invite"
#    And I pause for 800ms for the database to update
#
# ##Email Invite Acceptance and provide User details
##    And I receive an email to join "New Account Name" account
##    And I click on the email link
#    Then I receive an email to join "<Account Name>" account
#    When I click on the email link
#    And I accept the alertbox
#    And I accept New User Invite and provide user defined values "<First Name>", "<Last Name>", "<Job Title>" and "<Password>"
#    And I pause for 2000ms for the database to update
#
# ## Login as Admin to set Group Permissions
#    Given I log into the site "ODC" as an admin
#    When I select default account
#    And I click on "Account Management"
#    And I pause for 800ms
#
### Login as Admin to set Group Permissions
#    And I click on "Groups Tab"
#    And I click on "New Group Button"
##    And I set stored value "New Account Name" to inputfield "Group Account Name"
#    And I set "<Account Name>" to "Group Account Name"
#    And I click on "Industry Value"
#    And I set "<Group Name>" to the inputfield appended with current Date_Time "Group Name"
#    And I store the value from inputfield "Group Name" as "New Group Name"
#    And I click on "Group Status dropdown"
#    And I click on "Status Menu-Enable"
#    And I click on "Campaign Management: Write Select Checkbox"
#    And I click on "Campaign Management: Read Select Checkbox"
#    And I set stored value "New User Email" to inputfield "User Group InputField"
#    And I click on stored value "New User Email" in the "Group Name Dropdown" drop down
#    And I click on "Add"
#    And I click on "Create Button"
#    And I wait for all "Loading Messages" to become not visible
#    And I pause for 800ms
#
# ##Login as New User that has Group Permissions set-up above as per scenario
##    And I click on "Logout"
##    And I pause for 800ms
##    And I set stored value "New User Email" to inputfield "Email"
##    And I pause for 800ms
##    And I set "<Password>" to "Password"
##    And I pause for 800ms
##    And I click on "Submit"
##    And I pause for 800ms
##   # And I click on "Public groups"
##   # And I click on "Public account"
##    And I select default account
#
#    And I log into the site "ODC" as an admin
#    And I select default account
#
#  ##Create a Campaign and validate the Expected result of Campaign create/read behavior
#    And I click on "Campaign Management"
#    And I pause for 800ms
#    And I click on "New Campaign"
#    And I pause for 800ms
#    And I set "<Valid Campaign Name>" to the inputfield appended with current Date_Time "Campaign Name"
#    And I click on "Save"
#    And I pause for 800ms
#
#   ## User has WRITE and READ Campaign Permission hence User is able to create and view Newly created campaign in the Campaign Grid
#    Then I expect that element "Existing Campaign" does exist
#    When I wait for "Account Management and Campaign Popup" to become not visible
#
#    And I click on "Campaign Name Link"
#
#  #Adding Creative and storing Vast ID
#    And I pause for 800ms
#    And I click on the "Create Creative Icon"
#    And I enter user defined values in the Creative Page "<Creative Name>", "<Video URL>", "<CTA HeaderText>" and "<CTA destinationUrl>"
#
#    And I click on "Video Duration"
#    When I set "<Video Duration>" to "Video Duration"
#
#    And I click on "Save"
#    And I mousehover on element "Creative_more_Icon"
#    And I mousehover on element "Creative__controlsCover"
#    And I click on the "Creative__previewIcon"
#    And I pause for 1000ms for video to load
#    Then I expect that element "Creative Preview Video" does exist
#
#    # Click on the Video and verify the Video Plays (by checking Play button is not existing when video plays)
#    When I click on "Creative Preview Video"
#    And I pause for 3000ms for video to show playing
#    And I mousehover on element "Creative Preview Video"
#    Then I expect that element "Video Play Button" does not exist
#
#    #Storing Vast ID
#    When I click on the "VPAID Checkbox"
#    And I store the value from inputfield "Vast Tag Inputfield" as "Initial Creative Vast Tag Url"
#    And I click on "Close"
#
#
#  # Delivery UI
#    And I click on the "delivery button"
#    And I click on the "Delivery_Campaign_Banner"
#  #  Then I expect that element "Delivery_Campaign_Banner" does equal stored value "New Campaign Name"
#
#    And I click on "Campaign Delivery Name"
#    And I click on "Campaign Pause Button"
#    And I set "<Delivery Name>" to "Campaign Delivery Name"
#    And I enter Date fields "<Start Date>", "<End date>" and select TimeZone Value
#    And I click on "Goal_Pacing Checkbox"
#
#    # Inventory Spend
#    And I click on "GP Type dropdown"
#    And I pause for 400ms
#    And I click on "Inventory Spend"
#    And I set "<Inventory Spend Value>" to "Enter the Number Field"
#    And I store the value from inputfield "Enter the Number Field" as "Value"
#    Then I expect that "Value" displayed is with comma separated value of "<Inventory Spend Value>"
#    When I click on "GP Add"
#
#    Then I expect that element "GP Values_Added Section" does exist
#    And I expect that element "GP Type" contains the text "Inventory Spend"
#    And I expect that element "GP Value" contains the text "$ 400,032"
#    And I expect that element "GP Values_Added Section Close Button" does exist
#
#    When I click on "Campaign Additional Constraints Checkbox"
#
#    # Inventory Spend
#    And I click on "AC Period dropdown"
#    And I click on "Daily"
#    And I click on "AC Type dropdown"
#    And I click on "Inventory Spend"
#    And I set "<Value>" to "AC Enter the Number Field"
#    And I click on "AC Add"
#    Then I expect that element "AC Values_Added Section" does exist
#    And I expect that element "AC Period" contains the text "Daily"
#    And I expect that element "AC Type" contains the text "Inventory Spend"
#    And I expect that element "AC Value" contains the text "$ 1,000"
#    And I expect that element "AC Values_Added Section Close Button" does exist
#
#    And I pause for 800ms
#
#    When I fill Mandatory fields "<Min Bid Value>" , "<Max Bid Value>" and select Vendor in Inventory Section
#    Then I expect that element "Delivery_Save Button" is enabled
#    And I pause for 800ms
#    When I click on "Delivery_Save Button"
#    And I pause for 400ms
#
#  #Activate Campaign
#    And I click on "Activate campaign"
#    Then I expect that element "Activate message pop-up" does exist
#    And I expect that element "Activate message pop-up" contains the text "Are you sure you want to activate this campaign?"
#    And I expect that element "Publish button in activate campaign pop-up" does exist
#    And I expect that element "Cancel Button in activate campaign pop-up" does exist
#
#    When I click on "Publish button in activate campaign pop-up"
#
#
#  #Open the stored Vast to generate Vast Tag XML and validate the duration tag has the time entered in the Creative CTA
#    Given I open the url named with stored variable "Initial Creative Vast Tag Url"
#    Then I expect that element "Vast XML Text" contains the text "This XML file does not appear to have any style information associated with it. The document tree is shown below."
#    And I expect that element "Duration Tag in VAST XML generated" contains the text "00:01:20"
#
##  #Google Vast Inspector Testing Vast Tag Url
##    Given I open the url "https://developers.google.com/interactive-media-ads/docs/sdks/html5/vastinspector"
##    And I switch to the frame "GoogleFrame"
##    And I set stored value "Initial Creative Vast Tag Url" to inputfield "Google Vast Inspector Vast Tag Inputfield"
##    And I click on "Test Ad Button"
##    And I scroll to element "Vast Inspector Video"
##    And I click on "Video Play Button" on the "YouTubeGVVideo"
##    And I expect that element "Video Play Button" is not visible
#
#    And I pause for 1000ms
#  #Get Bid Response
#    When I make a bid request with configuration "bidResponseData"
#    Then I expect a bid
#    And I pause for 800ms
#
#  #Play the XML for the Bid response in the GVI
#    Given I open the url "https://developers.google.com/interactive-media-ads/docs/sdks/html5/vastinspector"
#    And I switch to the frame "GoogleFrame"
#    When I click on "Google Vast Inspector Vast XML Radio"
#   # And I set stored value "Initial Creative Vast Tag Url" to inputfield "Google Vast Inspector Vast XML Inputfield"
#    When I set the vast url from the bid response to the inputfield "Google Vast Inspector Vast XML Inputfield"
#    And I pause for 2000ms
#    And I click on "Test Ad Button"
#    And I pause for 2000ms
#    And I scroll to element "Vast Inspector Video"
#    And I click on "Video Play Button" on the "YouTubeGVVideo"
#    And I expect that element "Video Play Button" is not visible
#    And I pause for 9000ms
#
#  #Verify the adunit in the Perf Druid
#    When I open the perf rtb site "RTBBid"
#    And I log into the site with email "<EmailId>" and password "<Password>"
#    And I pause for 10000ms
#    Then I store adID "Druid RTBBid AdUnitId Table" in RTBBid druid
#
#    Examples:
#
#   | Password| EmailId              |Value |Max Bid Value|Min Bid Value|Inventory Spend Value| Valid EmailId     | Delivery Name     | Account Namest | Parent Account Name |Valid Campaign Name |User Name  |User Email Id                |Group Name                      |First Name|Last Name|Job Title|Account Name|Password   | Creative Name     | Video URL                                   | CTA HeaderText                 | CTA destinationUrl     |Video Duration|
#   |sairam1.1|hkodey@viralgains.com |1000  |700          |500          | 400032              | qa@viralgains.com | Ha_MileStone1_DN  | Ha_ODCRTBchk   | QA_ViralGains       |AutoCampaignName-H  |QARW Perm  |viralgainstestemail@gmail.com|No Campaign RW Permission Group |Test_First|Test_Last|QA       |1           |mypassword |   Auto_QACreative | https://www.youtube.com/watch?v=Vy5jelDmhDg | Start saving for college today | https://viralgains.com |80            |
#
#


  ## New User for New Account and creative ; Validate RTB Bid response update is in RTB Util and DRUID

  Scenario Outline:

    Given I log into the site "ODC UAT" as an Ops
    And I select default account
    When I click on "Account Management"

   #Create New Account
    And I create New Account with user defined values "<Parent Account Name>", "<Account Name>", "<Valid EmailId>", "<Domain>" and "Imagepic"
     ## Create New User
    And I create a new user named "<User Name>" with email "<User Email Id>" under account named with stored variable "New Account Name"
   # And I create New User with user defined values "New Account Name", "<User Name>" and "<User Email Id>"
    And I pause for 800ms for the database to update

       ##Email Invite Acceptance and provide User details
    And I receive an email to join "New Account Name" account
    And I click on the email link
    And I accept New User Invite and provide user defined values "<First Name>", "<Last Name>", "<Job Title>" and "<Password>"
    And I pause for 2000ms for the database to update


   ## Login as Admin to set Group Permissions
    Given I log into the site "ODC UAT" as an Ops
    When I select default account
    And I click on "Account Management"

  ## Login as Admin to set Group Permissions
    And I click on "Groups Tab"
    And I click on "New Group Button"
  #    And I set stored value "New Account Name" to inputfield "Group Account Name"
    And I set stored value "New Account Name" to inputfield "Group Account Name"
    And I click on "Industry Value"
    And I set "<Group Name>" to the inputfield appended with current Date_Time "Group Name"
    And I store the value from inputfield "Group Name" as "New Group Name"
    And I click on "Group Status dropdown"
    And I click on "Status Menu-Enable"
    And I click on "Campaign Management: Write Select Checkbox"
    And I click on "Campaign Management: Read Select Checkbox"
    And I set stored value "New User Email" to inputfield "User Group InputField"
    And I click on stored value "New User Email" in the "Group Name Dropdown" drop down
    And I click on "Add"
    And I click on "Create Button"
    And I wait for all "Loading Messages" to become not visible
    And I pause for 400ms for the grid to display group created

  #  ##Login as New User that has Group Permissions set-up above as per scenario
  #    And I click on "Logout"
  #    And I pause for 800ms
  #    And I set stored value "New User Email" to inputfield "Email"
  #    And I pause for 800ms
  #    And I set "<Password>" to "Password"
  #    And I pause for 800ms
  #    And I click on "Submit"
  #    And I pause for 800ms
  #    And I click on "Public groups"
  #    And I click on "Public account"

      ## Login as Admin to set Group Permissions
    Given I log into the site "ODC UAT" as an Ops
    When I select default account


    ##Create a Campaign and validate the Expected result of Campaign create/read behavior
    And I click on "Campaign Management"
    And I click on "New Campaign"
    And I set "<Valid Campaign Name>" to the inputfield appended with current Date_Time "Campaign Name"
    And I click on "Save"
    And I pause for 400ms for the grid to display campaign created

     ## User has WRITE and READ Campaign Permission hence User is able to create and view Newly created campaign in the Campaign Grid
    Then I expect that element "Existing Campaign" does exist

    # Adding Creative and storing Vast ID
    When I click on "Campaign Name Link"
    And I create and save a new creative named "<Creative Name>" with vast url "<VAST URL>"

    And I move "Line Item 1" by x offset 300 and y offset 150
    And I move "Start Node" by x offset 300 and y offset 0
    And I move "Creative 1" by x offset 300 and y offset 300
    And I create an edge from the bottom port of "Line Item 1" and connect it to the top port of "Creative 1"

    And I open the creative
    And I click on "Video Duration"
    And I set "<Video Duration>" to "Video Duration"
    And I click on "Save"


    And I click on the "delivery button"
    And I click on the "Delivery_Campaign_Banner"
    And I click on "Campaign Delivery Name"
    And I set "<Delivery Name>" to "Campaign Delivery Name"
    And I pause for 400ms for the dropdown to appear/load
    And I enter Date fields "<Start Date>", "<End date>" and select TimeZone Value

    And I click on "Goal_Pacing Checkbox"

    # Views
    And I click on "GP Type dropdown"
    And I pause for 400ms for the dropdown to appear/load
    And I click on "Views"
    And I set "<Views Value>" to "Enter the Number Field"
    And I store the value from inputfield "Enter the Number Field" as "Value"
    Then I expect that "Value" displayed is with comma separated value of "<Views Value>"
    When I click on "GP Add"

    And I click on "Campaign Additional Constraints Checkbox"

    # Views
    And I click on "AC Period dropdown"
    And I click on "Daily"
    And I click on "AC Type dropdown"
    And I click on "Views"
    And I set "<Views Value>" to "AC Enter the Number Field"
    And I click on "AC Add"
    And I click on the "Campaign Inventory Checkbox"
      #OVERALL
    And I click on the "OVERALL"
    Then I expect that element "Inv_Overall_MinMaxSection" is visible
    When I set "<Overall Min Bid Value>" to "Campaign_Inv_Overall_MinBid"
    And I set "<Overall Max Bid Value>" to "Campaign_Inv_Overall_MaxBid"

      #VENDOR1
    And I click on the "Inv_Vendor1_AppNexus"
    And I click on the "Delivery_Campaign_Banner"
    And I pause for 400ms for modal window to load
    And I click on the "Delivery_Creative_Banner"
    And I pause for 400ms for the dropdown to appear/load
    And I enter Date fields "<Start Date>", "<End date>" and select TimeZone Value
    And I click on "Creative Goal_Pacing Checkbox"
    And I click on "Creative GP Type dropdown"
    And I pause for 400ms for the dropdown to appear/load
    And I click on "Views"
    And I set "<Views Value>" to "Creative Enter the Number Field"
    And I store the value from inputfield "Creative Enter the Number Field" as "Value"
    Then I expect that "Value" displayed is with comma separated value of "<Views Value>"

    When I click on "Creative GP Add"
    And I click on "Creative Additional Constraints Checkbox"

      # Views
    And I click on "Creative AC Period dropdown"
    And I click on "Daily"
    And I click on "Creative AC Type dropdown"
    And I click on "Views"
    And I set "<Views Value>" to "Creative AC Enter the Number Field"
    And I click on "Creative AC Add"

    And I pause for 400ms for the Inventory section to load
    And I click on the "Creative Inventory Checkbox"

    And I set "<Overall Min Bid Value>" to "Creative_Inv_Overall_MinBid"
    And I set "<Overall Max Bid Value>" to "Creative_Inv_Overall_MaxBid"

      #VENDOR1
    And I click on the "Creative Inv_Vendor1_AppNexus"

     # update Campaign, Line Item and Creative to Play status
    And I click on "Campaign Pause Button"

    And I click on "Creative Pause Button"

    And I click on "Line Item Pause button"

    And I click on "Delivery_Save Button"
    And I pause for 400ms for the database to save and modal window to close

    #Activate Campaign
    And I click on "Activate campaign"
    Then I expect that element "Activate message pop-up" does exist
    And I expect that element "Activate message pop-up" contains the text "Are you sure you want to activate this campaign?"
    And I expect that element "Publish button in activate campaign pop-up" does exist
    And I expect that element "Cancel Button in activate campaign pop-up" does exist
    When I click on "Publish button in activate campaign pop-up"

    And I mousehover on element "Creative_more_Icon"
    And I mousehover on element "Creative__controlsCover"
    And I click on the "Creative__previewIcon"
    And I pause for 1000ms for video to load
    Then I expect that element "Creative Preview Video" does exist

      # Click on the Video and verify the Video Plays (by checking Play button is not existing when video plays)
    And I pause for 2000ms for video to show playing
    When I mousehover on element "Creative Preview Video"
    Then I expect that element "Video Play Button" does not exist

      #Storing Vast ID
    When I click on the "VPAID Checkbox"
    And I store the value from inputfield "Vast Tag Inputfield" as "Initial Creative Vast Tag Url"
    And I click on "Close"


    #Open the stored Vast to generate Vast Tag XML and validate the duration tag has the time entered in the Creative CTA
    Given I open the url named with stored variable "Initial Creative Vast Tag Url"
    And I pause for 400ms for user to verify duration value on the screen
    Then I expect that element "Duration Tag in VAST XML generated" contains the text "00:01:20"
    Then I expect that element "AdUnit Id in VAST XML generated" does exist
    And I store the value from element "AdUnit Id in VAST XML generated" as "Adunit ID"

    #RTB Util
    # And I open the url "https://perfrtb.viralgains.com/rtb/util"
    And I open the url "https://qa2.viralgains.com/rtb/util"
    Then I expect that element "Adunit ID in RTB Util" does equal stored value "Adunit ID"

    #Pausing for the RTB to find the Adunit and successfully bid it (Per the current phase1 requirement)
    And I pause for 30000ms
    And I pause for 30000ms
    And I pause for 30000ms

    #Get Bid Response
    When I make a bid request with configuration "bidResponseData"
    Then I expect a bid
    #   When I make a bid request with VastId "<AdData>" and configuration "bidResponseData"
    And I pause for 800ms for Bid response

    #Play the XML for the Bid response in the GVI
    Given I open the url "https://developers.google.com/interactive-media-ads/docs/sdks/html5/vastinspector"
    And I switch to the frame "GoogleFrame"
    When I click on "Google Vast Inspector Vast XML Radio"
     # And I set stored value "Initial Creative Vast Tag Url" to inputfield "Google Vast Inspector Vast XML Inputfield"
    When I set the updated vast url from the bid response to the inputfield "Google Vast Inspector Vast XML Inputfield"
    And I pause for 1000ms for GVI to open vast URL
    And I click on "Test Ad Button"
    And I pause for 1000ms to play the video
    And I scroll to element "Vast Inspector Video"
     # And I click on "Video Play Button" on the "YouTubeGVVideo"
    And I expect that element "Video Play Button" is not visible
    And I pause for 20000ms to complete the video playing till end
#
#    #Verify the adunit in Druid
#    When I open the perf rtb site "RTBWin"
#    And I log into the site with email "<EmailId>" and password "<Password>"
#    And I pause for 800ms to login to perf and verify the adunit
#    Then I verify Adunit ID and store the count from "Druid RTBWin AdUnitId Table" in RTB druid as "Initial Count"
#
#    #Play it for 1 more time to match the count (TODO write new step method for all steps below)
#    When I make a bid request with configuration "bidResponseData"
#    Then I expect a bid
#
#    Given I open the url "https://developers.google.com/interactive-media-ads/docs/sdks/html5/vastinspector"
#    And I switch to the frame "GoogleFrame"
#    When I click on "Google Vast Inspector Vast XML Radio"
#    # And I set stored value "Initial Creative Vast Tag Url" to inputfield "Google Vast Inspector Vast XML Inputfield"
#    And I set the updated vast url from the bid response to the inputfield "Google Vast Inspector Vast XML Inputfield"
#    And I pause for 1000ms for GVI to open vast URL
#    And I click on "Test Ad Button"
#    And I pause for 1000ms to play the video
#    And I scroll to element "Vast Inspector Video"
#    Then I expect that element "Video Play Button" is not visible
#    And I pause for 20000ms to complete the video palying till end
#
#    #Open Druid Page
#    When I open the perf rtb site "RTBWin"
#    Then I verify Adunit ID and store the count from "Druid RTBWin AdUnitId Table" in RTB druid as "Updated Count"
#    And I expect "Updated Count" to be 1 more than "Initial Count"
#
#    #Play it for 1 more time
#    When I make a bid request with configuration "bidResponseData"
#    Then I expect a bid
#
#    Given I open the url "https://developers.google.com/interactive-media-ads/docs/sdks/html5/vastinspector"
#    When I switch to the frame "GoogleFrame"
#    And I click on "Google Vast Inspector Vast XML Radio"
#    And I set the updated vast url from the bid response to the inputfield "Google Vast Inspector Vast XML Inputfield"
#    And I pause for 1000ms to play the video
#    And I click on "Test Ad Button"
#    And I pause for 2000ms to play the video
#    And I scroll to element "Vast Inspector Video"
#    And I expect that element "Video Play Button" is not visible
#    And I pause for 20000ms to complete the video palying till end
#
    #Open Druid Page
    And I open the perf rtb site "RTBWin"
    Then I verify Adunit ID and store the count from "Druid RTBWin AdUnitId Table" in RTB druid as "Updated Count of views"
    And I expect "Updated Count of views" to be 2 more than "Initial Count"
    And I expect "Updated Count of views" to be equal to "Value"


    Examples:
      | Start Date           |End date            |Views Value | Domain          | Password| EmailId               | Overall Max Bid Value|Overall Min Bid Value|Inventory Spend Value| Valid EmailId            | Delivery Name     | Account Namest | Parent Account Name      |Valid Campaign Name       |User Name               |User Email Id                |Group Name                              |First Name  |Last Name|Job Title|Account Name            |Password   | Creative Name     | VAST URL                                               |Video Duration|
      |04/29/2018 05:50 PM   |05/30/2018 07:50 PM |3           | https://ebay.in |sairam1.1|hkodey@viralgains.com  |50                    |10                   | 400032              | eng+adops@viralgains.com | Ha_MileStone1_DN  | Ha_ODCRTBchk   |  AdOps                   |MileStone1CampaignName-H  |MileStone1 UserPerm     |viralgainstestemail@gmail.com|MileStone1 Campaign RW Permission Group |Test_First  |Test_Last|QA       |MileStoneAc-H           |mypassword |   Auto_QACreative | https://rtr.innovid.com/r1.5b06dff09f4739.45624862;cb= |80            |

     # for qa envi| qatest.org |sairam1.1|hkodey@viralgains.com |1000  |700          |500          | 400032              | eng+adops@viralgains.com | Ha_MileStone1_DN  | Ha_ODCRTBchk   | QA_ViralGains       |AutoCampaignName-H  |QARW Perm  |viralgainstestemail@gmail.com|No Campaign RW Permission Group |Test_First|Test_Last|QA       |1           |mypassword |   Auto_QACreative | https://www.youtube.com/watch?v=Vy5jelDmhDg | Start saving for college today | https://viralgains.com |80            |
