Feature: Admin Login UI Test
  As a Developer in Test
  I want to Verify the UI elements Color, Padding , Margin , Width and FONT: Family and Size

    Scenario: Open Base URL
    Given I open the url "https://qa2.viralgains.com/vg/"
    Then  I expect that the url is "https://qa2.viralgains.com/vg/"
    Then I expect to be on the "Login" page

    # Email/Username field's > STAR Visibility and Color

    Then I expect that element "label[for='email'] span.star" contains the text "*"
    Then I expect that the css attribute "color" from element "label[for='email'] span.star" is "rgba(255,0,0,1)"

    # Email/Username field

    Then I expect that the css attribute "color" from element "label[for='email']" is "rgba(135,135,135,1)"
    Then I expect that the css attribute "font-family" from element "label[for='email']" is "gotham light"
    Then I expect that the css attribute "font-size" from element "label[for='email'] span.star" is "14px"
    Then I expect that the css attribute "width" from element "label[for='email']" is "394px"
    Then I expect that the css attribute "line-height" from element "label[for='email']" is "20px"
    Then I expect that the css attribute "margin-left" from element "label[for='email']" is "0px"
    Then I expect that the css attribute "margin-right" from element "label[for='email']" is "0px"
    Then I expect that the css attribute "margin-top" from element "label[for='email']" is "3px"
      And I pause for 25000ms
    # Submit button > Padding and Color

    Then I expect that the css attribute "color" from element "Input[type='submit']" is "rgba(255,255,255,1)"
    Then I expect that the css attribute "padding-bottom" from element "Input[type='submit']" is "10px"
    Then I expect that the css attribute "padding-left" from element "Input[type='submit']" is "12px"
    Then I expect that the css attribute "padding-right" from element "Input[type='submit']" is "12px"
    Then I expect that the css attribute "padding-top" from element "Input[type='submit']" is "10px"
