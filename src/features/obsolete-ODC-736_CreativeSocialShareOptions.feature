Feature: ODC-736

  Background: I open the Social Share section of a creative
    Given I have a Campaign named "Ha_CampaignName123" under Account "QA_ViralGains"
    And that Campaign has a Creative Node named "Creative 1" with vast tag url "https://rtr.innovid.com/r1.5b06dff09f4739.45624862;cb="
    And That "Creative" node is updated to be named "Creative 1", and have x position "300" and y position "300"
    And I am on the canvas screen for the newly created campaign
    And I open the creative
    And I click on the "Social Share Checkbox"


  Scenario: Test default style and colors
    And I expect that element "Facebook Icon" does not have the class "Square Style"
    And I expect that element "Facebook Icon" does not have the class "Circle Style"

    #Test default colors
    And I expect that element "Facebook Icon" does not have the class "backgroundColor"
    And I expect that element "Twitter Icon" does not have the class "backgroundColor"
    And I expect that element "Email Icon" does not have the class "backgroundColor"
    And I expect that element "SMS Icon" does not have the class "backgroundColor"
    And I expect that element "Copy And Paste Share Url Icon" does not have the class "backgroundColor"
    And I expect that element "Pinterest Icon" does not have the class "backgroundColor"
    And I expect that element "LinkedIn Icon" does not have the class "backgroundColor"

    And I expect that the color of element "Facebook Symbol" is "Facebook blue"
    And I expect that the color of element "Twitter Symbol" is "Twitter blue"
    And I expect that the color of element "Email Symbol" is "Email pink"
    And I expect that the color of element "SMS Symbol" is "SMS green"
    And I expect that the color of element "Copy And Paste Share Url Symbol" is "Share url green"
    And I expect that the color of element "Pinterest Symbol" is "Pinterest red"
    And I expect that the color of element "LinkedIn Symbol" is "LinkedIn blue"


  Scenario: Testing square icons
    When I click on "Social Share Options Dropdown"
    And I click on "Squares" in the drop down
    Then I expect that element "Facebook Icon" has the class "Square Style"

    #Test default colors
    And I expect that the background color of element "Facebook Icon" is "Grey"
    And I expect that the background color of element "Twitter Icon" is "Grey"
    And I expect that the background color of element "Email Icon" is "Grey"
    And I expect that the background color of element "SMS Icon" is "Grey"
    And I expect that the background color of element "Copy And Paste Share Url Icon" is "Grey"
    And I expect that the background color of element "Pinterest Icon" is "Grey"
    And I expect that the background color of element "LinkedIn Icon" is "Grey"

    When I open the "Background" color picker and set it to the color "green"
    And I open the "Symbol" color picker and set it to the color "green"
    Then I expect that the css attribute "backgroundColor" of element "Facebook Icon" is "rgba(0,255,0,1)"
    And I expect that the css attribute "color" of element "Facebook Symbol" is "rgba(0,255,0,1)"


  Scenario: Testing circle icons
    When I click on "Social Share Options Dropdown"
    And I click on "Circles" in the drop down
    Then I expect that element "Facebook Icon" has the class "Circle Style"

    #Test default colors
    And I expect that the background color of element "Facebook Icon" is "Grey"
    And I expect that the background color of element "Twitter Icon" is "Grey"
    And I expect that the background color of element "Email Icon" is "Grey"
    And I expect that the background color of element "SMS Icon" is "Grey"
    And I expect that the background color of element "Copy And Paste Share Url Icon" is "Grey"
    And I expect that the background color of element "Pinterest Icon" is "Grey"
    And I expect that the background color of element "LinkedIn Icon" is "Grey"

    When I open the "Background" color picker and set it to the color "green"
    And I open the "Symbol" color picker and set it to the color "green"
    Then I expect that the css attribute "backgroundColor" of element "Facebook Icon" is "rgba(0,255,0,1)"
    And I expect that the css attribute "color" of element "Facebook Symbol" is "rgba(0,255,0,1)"
