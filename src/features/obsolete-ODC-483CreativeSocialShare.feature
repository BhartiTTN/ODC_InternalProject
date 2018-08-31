Feature: ODC-483: Testing Social Share icons in Creatives

  Background: I open the Social Share section of a creative
    Given I have a Campaign named "Ha_CampaignName123" under Account "QA_ViralGains"
    And that Campaign has a Creative Node named "Creative 1" with vast tag url "https://rtr.innovid.com/r1.5b06dff09f4739.45624862;cb="
    And That "Creative" node is updated to be named "Creative 1", and have x position "300" and y position "300"
    And I am on the canvas screen for the newly created campaign
    And I open the creative
    And I click on the "Social Share Checkbox"

  Scenario: Test social share icons are selected by default. Test icon is default style
    Then I expect that checkbox "Facebook Checkbox" is checked
    And I expect that checkbox "Twitter Checkbox" is checked
    And I expect that checkbox "Email Checkbox" is checked
    And I expect that checkbox "SMS Checkbox" is checked
    And I expect that checkbox "Copy And Paste Share Url Checkbox" is checked
    And I expect that checkbox "Pinterest Checkbox" is checked
    And I expect that checkbox "LinkedIn Checkbox" is checked


  Scenario: Uncheck half of the social share icons. Test that its saved
    When I click on the "Facebook Icon"
    And I click on the "Twitter Icon"
    And I click on the "Email Icon"
    And I click on "Save"

    And I open the creative

    And I expect that checkbox "Facebook Checkbox" is not checked
    And I expect that checkbox "Twitter Checkbox" is not checked
    And I expect that checkbox "Email Checkbox" is not checked
    And I expect that checkbox "SMS Checkbox" is checked
    And I expect that checkbox "Copy And Paste Share Url Checkbox" is checked
    And I expect that checkbox "Pinterest Checkbox" is checked
    And I expect that checkbox "LinkedIn Checkbox" is checked





  Scenario Outline: Test max length of header, description
    When I set "<Max Header Value>" to "Social Share Header Input"
    And I set "<Max Description Value>" to "Social Share Description Input"
    Then I expect that element "Social Share Header Counter" contains the text "40/40"
    And I expect that element "Social Share Description Counter" contains the text "110/110"

    #Save and Reopen the Creative
    When I click on "Save"
    And I open the creative

    #Test Values are saved
    Then I expect that inputfield "Social Share Header Input" contains the text "<Max Header Value>"
    And I expect that inputfield "Social Share Description Input" contains the text "<Max Description Value>"
    And I expect that element "Social Share Header Counter" contains the text "40/40"
    And I expect that element "Social Share Description Counter" contains the text "110/110"

  Examples:
  |Max Header Value                        | Max Description Value                                                                                        |
  |1234567890123456789012345678901234567890|12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890|

  Scenario Outline: Test going over max length of header, description.
    When I set "<Error Header Value>" to "Social Share Header Input"
    And  I set "<Error Description Value>" to "Social Share Description Input"
    Then I expect that element "Social Share Header Counter" contains the text "40/40"
    And I expect that element "Social Share Description Counter" contains the text "110/110"

    And I expect that inputfield "Social Share Header Input" matches the text "<Max Header Value>"
    And I expect that inputfield "Social Share Description Input" matches the text "<Max Description Value>"


    Examples:
      |Max Header Value                        | Max Description Value                                                                                        |Error Header Value                       | Error Description Value                                                                                       |
      |1234567890123456789012345678901234567890|12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890|12345678901234567890123456789012345678901|123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901|


  Scenario: Uploading Thumbnail
    When I select file "Image.jpg" of type "jpg" for the element "Social Share Thumbnail Upload"
    And I click on "Save"
    And I open the creative
    Then I expect that element "Social Share Thumbnail Preview" is visible

  Scenario: Testing Share View Page
    When I set "Browser Label Test" to "Social Share Browser Label"
    And I click on "Save"
    And I open the creative
    Then I expect that inputfield "Social Share Browser Label" contains the text "Browser Label Test"


  Scenario Outline: Saving All Fields
    #Set Options
    When I click on the "Facebook Icon"
    #Set Message
    And I set "<Header Value>" to "Social Share Header Input"
    And I set "<Description Value>" to "Social Share Description Input"
    #Set Thumbnail
    And I select file "Image.jpg" of type "jpg" for the element "Social Share Thumbnail Upload"
    #Set Share View
    When I set "<Browser Label Value>" to "Social Share Browser Label"

    # Save And Reopen
    And I click on "Save"
    And I open the creative

    Then I expect that checkbox "Facebook Checkbox" is not checked
    And I expect that inputfield "Social Share Header Input" matches the text "<Header Value>"
    And I expect that inputfield "Social Share Description Input" matches the text "<Description Value>"
    Then I expect that element "Social Share Thumbnail Preview" is visible
    Then I expect that inputfield "Social Share Browser Label" contains the text "<Browser Label Value>"


    Examples:
    |Header Value| Description Value| Browser Label Value|
    |header ex   | description ex   | browser ex         |

