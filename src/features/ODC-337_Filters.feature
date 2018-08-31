Feature: ODC-337 Filters

#TO DO: Filters Drop down Items Verification before and after some filters applied
#TO Do: Remove the 2nd filter when 3 filters applied
#TO DO: Filter immediate child account of a parent account


# Users Tab

#Filter the Users Tab with First Name , Last Name, Email
  Scenario Outline:
    Given I am on the "users" tab of the "account management" page using the account "QA_ViralGains"
    When I select Filter Criteria "<Criteria>"
    And I enter Filter Criteria Parameter "<Parameter>"
    And I click on "Apply Button"
    Then I expect that element "Filter Result" contains the text "<Criteria>: <Parameter>"
    And I expect that the Grid element "<Column>" does contain the text "<Parameter>"

    Examples:

      |Criteria    |Parameter  |Column           |
      |First Name  |First      |First Name Column|
      |Last Name   |Last       |Last Name Column |
      |Email       |@gmail.com |Email Column     |



#Filter the Users Tab with Account Name
  Scenario Outline:
    Given I am on the "users" tab of the "account management" page using the account "QA_ViralGains"
    When I select Filter Criteria "<Criteria>"
    And I select Filter Criteria Parameter "<Parameter>"
    And I click on "Apply Button"
    Then I expect that element "Filter Result" contains the text "<Criteria>: <Parameter>"
    And I expect that the Grid element "Account Name Column" does contain the text "<Parameter>"

    Examples:

      |Criteria    |Parameter     |
      |Account     |QA_ViralGains |


# Cancel Button in filtered results
  Scenario Outline:
    Given I am on the "users" tab of the "account management" page using the account "QA_ViralGains"
    When I select Filter Criteria "<Criteria>"
    And I select Filter Criteria Parameter "<Parameter>"
    And I click on "Apply Button"
    Then I expect that element "Filter Result" contains the text "<Criteria>: <Parameter>"
    When I click on "Filter Cancel button"
    Then I expect that element "Filter Result" does not exist

    Examples:

      |Criteria   |Parameter       |
      |Status     |DECLINED        |


#Filter the Users Tab with all Status(es)
  Scenario Outline:
    Given I am on the "users" tab of the "account management" page using the account "QA_ViralGains"
    When I select Filter Criteria "<Criteria>"
    And I select Filter Criteria Parameter "<Parameter>"
    And I click on "Apply Button"
    Then I expect that element "Filter Result" contains the text "<Criteria>: <Parameter>"
    And I expect that the Grid element "<Column>" does contain the text "<Parameter>"

     Examples:

      |Criteria   |Parameter       |Column       |
      |Status     |DECLINED        |Status Column|
      |Status     |ENABLED         |Status Column|
#      |Status     |INVITED         |Status Column|
#      |Status     |DISABLED        |Status Column|


#Filter the Users Tab with Multiple criteria First Name and Email
  Scenario Outline:
    Given I am on the "users" tab of the "account management" page using the account "QA_ViralGains"
    When I select Filter Criteria "<Criteria1>"
    And I enter Filter Criteria Parameter "<Parameter1>"
    And I click on "Apply Button"
    And I select Filter Criteria "<Criteria2>"
    And I enter Filter Criteria Parameter "<Parameter2>"
    And I click on "Apply Button"
    Then I expect that element "Filter Result" contains the text "<Criteria1>: <Parameter1>"
    And I expect that element "Filter Result" contains the text "<Criteria2>: <Parameter2>"
    And I expect that the Grid element "<Column1>" does contain the text "<Parameter1>"
    And I expect that the Grid element "<Column2>" does contain the text "<Parameter2>"

    Examples:

      |Criteria1    |Parameter1   |Criteria2  | Parameter2  |Column1          |Column2     |
      |First Name   |First        |Email      | @gmail.com  |First Name Column|Email Column|


#Filter the Users Tab with Multiple criteria Account, Last Name and Status and then remove the Last Name Criteria already applied
  Scenario Outline:
    Given I am on the "users" tab of the "account management" page using the account "QA_ViralGains"
    When I select Filter Criteria "<Criteria1>"
    And I select Filter Criteria Parameter "<Parameter1>"
    And I click on "Apply Button"
    And I select Filter Criteria "<Criteria2>"
    And I select Filter Criteria Parameter "<Parameter2>"
    And I click on "Apply Button"
    And I select Filter Criteria "<Criteria3>"
    And I enter Filter Criteria Parameter "<Parameter3>"
    And I click on "Apply Button"
    Then I expect that element "Filter Result" contains the text "<Criteria1>: <Parameter1>"
    And I expect that element "Filter Result" contains the text "<Criteria2>: <Parameter2>"
    And I expect that element "Filter Result" contains the text "<Criteria3>: <Parameter3>"
    Then I expect that the Grid element "<Column1>" does contain the text "<Parameter1>"
    And I expect that the Grid element "Account Name Column" does contain the text "<Parameter2>"
    And I expect that the Grid element "<Column3>" does contain the text "<Parameter3>"
    When I click on "Filter Cancel button for Criteria3"
    Then I expect that element "Filter Cancel button for Criteria3" does not exist
    And I expect that element "Filter Result" contains the text "<Criteria1>: <Parameter1>"
    And I expect that element "Filter Result" contains the text "<Criteria2>: <Parameter2>"


    Examples:

      |Criteria1  |Parameter1   |Criteria2  | Parameter2     |Criteria3  | Parameter3  |Column1      |Column3         |
      |Status     |ENABLED      |Account    |QA_ViralGains   |Last Name  |Test         |Status Column|Last Name Column|


#Filter the Users Tab : Verify No Rows Found Message
  Scenario Outline:
    Given I am on the "users" tab of the "account management" page using the account "QA_ViralGains"
    When I select Filter Criteria "<Criteria>"
    And I enter Filter Criteria Parameter "<Parameter>"
    And I click on "Apply Button"
    Then I expect that element "Filter Result" contains the text "<Criteria>: <Parameter>"
    Then I expect that element "No Rows Found" does exist

    Examples:

      |Criteria    |Parameter    |
      |First Name  |Junk_Ha      |




## Accounts Tab
#Filter the Accounts Tab with Enabled
  Scenario Outline:
    Given I have an enabled Account named "<Account Name>" with contact email "<Email>" dsp login "<Dsp Login>" dsp password "<Dsp Password>" under parent account "<Parent Account>"
    Given I am on the "accounts" tab of the "account management" page using the account "QA_ViralGains"

    When I select Filter Criteria "<Criteria>"
    And I select Filter Criteria Parameter "<Parameter>"
    And I click on "Apply Button"

    Then I expect that element "Filter Result" contains the text "<Criteria>: <Parameter>"
    And I expect that the Grid element "<Column>" does contain the text "<Parameter>"

    Examples:

    |Account Name |Parent Account|Dsp Login |Dsp Password|Email                        |Criteria   |Parameter  |Column       |
    |New Account  |QA_ViralGains |Login Name| password   |viralgainstestemail@gmail.com|Status     |ENABLED    |Status Column|

    #Filter the Accounts Tab with Disabled
  Scenario Outline:
    Given I have a disabled Account named "<Account Name>" with contact email "<Email>" dsp login "<Dsp Login>" dsp password "<Dsp Password>" under parent account "<Parent Account>"
    Given I am on the "accounts" tab of the "account management" page using the account "QA_ViralGains"

    When I select Filter Criteria "<Criteria>"
    And I select Filter Criteria Parameter "<Parameter>"
    And I click on "Apply Button"

    Then I expect that element "Filter Result" contains the text "<Criteria>: <Parameter>"
    And I expect that the Grid element "<Column>" does contain the text "<Parameter>"

    Examples:

      |Account Name |Parent Account|Dsp Login |Dsp Password|Email                        |Criteria   |Parameter  |Column       |
      |New Account  |QA_ViralGains |Login Name| password   |viralgainstestemail@gmail.com|Status     |DISABLED   |Status Column|


# Cancel Button in filtered results
  Scenario Outline:
    Given I am on the "accounts" tab of the "account management" page using the account "QA_ViralGains"
    When I select Filter Criteria "<Criteria>"
    And I enter Filter Criteria Parameter "<Parameter>"
    And I click on "Apply Button"
    Then I expect that element "Filter Result" contains the text "<Criteria>: <Parameter>"
    When I click on "Filter Cancel button"
    Then I expect that element "Filter Result" does not exist

    Examples:

      |Criteria     |Parameter  |
      |Contact Email|@gmail.com |


#Filter the Accounts Tab with Account Name
  Scenario Outline:
    Given I am on the "accounts" tab of the "account management" page using the account "QA_ViralGains"
    When I select Filter Criteria "<Criteria>"
    And I enter Filter Criteria Parameter "<Parameter>"
    And I click on "Apply Button"
    Then I expect that element "Filter Result" contains the text "<Criteria>: <Parameter>"
    And I expect that the Grid element "<Column>" does contain the text "<Parameter>"

    Examples:

      |Criteria    |Parameter     |Column             |
      |Account Name|QA_ViralGains |Account Name Column|


#Filter the Accounts Tab with Parent Account Name
  Scenario Outline:
    Given I am on the "accounts" tab of the "account management" page using the account "QA_ViralGains"
    When I select Filter Criteria "<Criteria>"
    And I select Filter Criteria Parameter "<Parameter>"
    And I click on "Apply Button"
    Then I expect that element "Filter Result" contains the text "<Criteria>: <Parameter>"
    And I expect that the Grid element "Account Name Column" does contain the text "<Parameter>"

    Examples:

      |Criteria       |Parameter     |
      |Parent Account |QA_ViralGains |

#Filter the Accounts Tab with All Filter options
  Scenario Outline:
    Given I am on the "accounts" tab of the "account management" page using the account "QA_ViralGains"
    When I select Filter Criteria "<Criteria1>"
    And I select Filter Criteria Parameter "<Parameter1>"
    And I click on "Apply Button"
    And I select Filter Criteria "<Criteria2>"
    And I enter Filter Criteria Parameter "<Parameter2>"
    And I click on "Apply Button"
    And I select Filter Criteria "<Criteria3>"
    And I enter Filter Criteria Parameter "<Parameter3>"
    And I click on "Apply Button"
    And I select Filter Criteria "<Criteria4>"
    And I select Filter Criteria Parameter "<Parameter4>"
    And I click on "Apply Button"
    Then I expect that element "Filter Result" contains the text "<Criteria1>: <Parameter1>"
    And I expect that the Grid element "Account Name Column" does contain the text "<Parameter1>"
    And I expect that element "Filter Result" contains the text "<Criteria2>: <Parameter2>"
    And I expect that the Grid element "Account Name Column" does contain the text "<Parameter2>"
    And I expect that element "Filter Result" contains the text "<Criteria2>: <Parameter2>"
    And I expect that the Grid element "<Column2>" does contain the text "<Parameter2>"
    And I expect that element "Filter Result" contains the text "<Criteria3>: <Parameter3>"
    And I expect that the Grid element "<Column3>" does contain the text "<Parameter3>"
    And I expect that element "Filter Result" contains the text "<Criteria4>: <Parameter4>"
    And I expect that the Grid element "<Column4>" does contain the text "<Parameter4>"

    Examples:

      |Criteria1      |Parameter1     |   Criteria2     |Parameter2   |   Criteria3      |Parameter3      |   Criteria4   |Parameter4 |Column2            |Column3             |Column4      |
      |Parent Account |QA_ViralGains  |   Account Name  |1            |   Contact Email  |@viralgains.com |   Status      |ENABLED    |Account Name Column|Contact Email Column|Status Column|


#Filter the Accounts Tab with Multiple criteria Account Name, Contact Email and Status
  Scenario Outline:
    Given I have a Account named "<Account Name>" with contact email "<Email>" dsp login "<Dsp Login>" dsp password "<Dsp Password>" under parent account "<Parent Account>"
    Given I am on the "accounts" tab of the "account management" page using the account "QA_ViralGains"
    When I select Filter Criteria "<Criteria1>"
    And I enter Filter Criteria Parameter "<Account Name>"
    And I click on "Apply Button"
    And I select Filter Criteria "<Criteria2>"
    And I enter Filter Criteria Parameter "<Email>"
    And I click on "Apply Button"
    And I select Filter Criteria "<Criteria3>"
    And I select Filter Criteria Parameter "<Status>"
    And I click on "Apply Button"
    Then I expect that element "Filter Result" contains the text "<Criteria1>: <Account Name>"
    And I expect that the Grid element "Account Name Column" does contain the text "<Account Name>"
    And I expect that element "Filter Result" contains the text "<Criteria2>: <Email>"
    And I expect that the Grid element "<Column2>" does contain the text "<Email>"
    And I expect that element "Filter Result" contains the text "<Criteria3>: <Status>"
    And I expect that the Grid element "<Column3>" does contain the text "<Status>"


    Examples:

      |Parent Account|Dsp Login |Dsp Password|   Criteria1  |Account Name    |   Criteria2      |Email                        |   Criteria3   |Status  |Column2             |Column3      |
      |QA_ViralGains |Login Name| password   |Account Name  |New Account Name|   Contact Email  |viralgainstestemail@gmail.com|   Status      |ENABLED |Contact Email Column|Status Column|



#Filter the Accounts Tab with All Filter options and then remove the Status Criteria already applied
  Scenario Outline:
    Given I am on the "accounts" tab of the "account management" page using the account "QA_ViralGains"
    When I select Filter Criteria "<Criteria1>"
    And I select Filter Criteria Parameter "<Parameter1>"
    And I click on "Apply Button"
    And I select Filter Criteria "<Criteria2>"
    And I enter Filter Criteria Parameter "<Parameter2>"
    And I click on "Apply Button"
    And I select Filter Criteria "<Criteria3>"
    And I enter Filter Criteria Parameter "<Parameter3>"
    And I click on "Apply Button"
    And I select Filter Criteria "<Criteria4>"
    And I select Filter Criteria Parameter "<Parameter4>"
    And I click on "Apply Button"
    Then I expect that element "Filter Result" contains the text "<Criteria1>: <Parameter1>"
    And I expect that the Grid element "Account Name Column" does contain the text "<Parameter1>"
    And I expect that element "Filter Result" contains the text "<Criteria2>: <Parameter2>"
    And I expect that the Grid element "Account Name Column" does contain the text "<Parameter2>"
    And I expect that element "Filter Result" contains the text "<Criteria2>: <Parameter2>"
    And I expect that the Grid element "<Column2>" does contain the text "<Parameter2>"
    And I expect that element "Filter Result" contains the text "<Criteria3>: <Parameter3>"
    And I expect that the Grid element "<Column3>" does contain the text "<Parameter3>"
    And I expect that element "Filter Result" contains the text "<Criteria4>: <Parameter4>"
    And I expect that the Grid element "<Column4>" does contain the text "<Parameter4>"
    When I click on "Filter Cancel button for Criteria4"
    Then I expect that element "Filter Cancel button for Criteria4" does not exist
    And I expect that element "Filter Result" contains the text "<Criteria1>: <Parameter1>"
    And I expect that element "Filter Result" contains the text "<Criteria2>: <Parameter2>"
    And I expect that element "Filter Result" contains the text "<Criteria3>: <Parameter3>"

    Examples:

      |Criteria1      |Parameter1     |   Criteria2     |Parameter2   |   Criteria3      |Parameter3      |   Criteria4   |Parameter4 |Column2            |Column3             |Column4      |
      |Parent Account |QA_ViralGains  |   Account Name  |1            |   Contact Email  |@viralgains.com |   Status      |ENABLED    |Account Name Column|Contact Email Column|Status Column|


## Groups Tab

#Filter the Groups Tab with Enabled status
  Scenario Outline:
    Given I have an enabled Group named "<Group Name>" under Account "<Account Name>" with stored user emails "" and permissions ""
    And I am on the "groups" tab of the "account management" page using the account "QA_ViralGains"
    When I select Filter Criteria "<Criteria>"
    And I select Filter Criteria Parameter "<Parameter>"
    And I click on "Apply Button"
    Then I expect that element "Filter Result" contains the text "<Criteria>: <Parameter>"
    And I expect that the Grid element "<Column>" does contain the text "<Parameter>"

    Examples:

      |Account Name |Group Name|Criteria   |Parameter  |Column       |
      |QA_ViralGains|New Group |Status     |ENABLED    |Status Column|

    #Filter the Groups Tab with Disabled Status
  Scenario Outline:
    Given I have a disabled Group named "<Group Name>" under Account "<Account Name>" with stored user emails "" and permissions ""
    And I am on the "groups" tab of the "account management" page using the account "QA_ViralGains"
    When I select Filter Criteria "<Criteria>"
    And I select Filter Criteria Parameter "<Parameter>"
    And I click on "Apply Button"
    Then I expect that element "Filter Result" contains the text "<Criteria>: <Parameter>"
    And I expect that the Grid element "<Column>" does contain the text "<Parameter>"

    Examples:

      |Account Name |Group Name|Criteria   |Parameter  |Column       |
      |QA_ViralGains|New Group |Status     |DISABLED   |Status Column|


#Cancel Button in filtered results
  Scenario Outline:
    Given I am on the "groups" tab of the "account management" page using the account "QA_ViralGains"
    When I select Filter Criteria "<Criteria>"
    And I select Filter Criteria Parameter "<Parameter>"
    And I click on "Apply Button"
    Then I expect that element "Filter Result" contains the text "<Criteria>: <Parameter>"
    When I click on "Filter Cancel button"
    Then I expect that element "Filter Result" does not exist

    Examples:

      |Criteria   |Parameter       |
      |Status     |DISABLED        |


#Filter the Groups Tab with Account Name
  Scenario Outline:
    Given I am on the "groups" tab of the "account management" page using the account "QA_ViralGains"
    When I select Filter Criteria "<Criteria>"
    And I select Filter Criteria Parameter "<Parameter>"
    And I click on "Apply Button"
    Then I expect that element "Filter Result" contains the text "<Criteria>: <Parameter>"
    And I expect that the Grid element "Account Name Column" does contain the text "<Parameter>"

    Examples:

      |Criteria    |Parameter     |
      |Account     |QA_ViralGains |



#Filter the Groups Tab with Groups Name
  Scenario Outline:
    Given I am on the "groups" tab of the "account management" page using the account "QA_ViralGains"
    When I select Filter Criteria "<Criteria>"
    And I enter Filter Criteria Parameter "<Parameter>"
    And I click on "Apply Button"
    Then I expect that element "Filter Result" contains the text "<Criteria>: <Parameter>"
    And I expect that the Grid element "<Column>" does contain the text "<Parameter>"

    Examples:

      |Criteria       |Parameter    |Column           |
      |Group Name     |QA_ViralGains|Group Name Column|



#Filter the Groups Tab with All Filter options
  Scenario Outline:
    Given I am on the "groups" tab of the "account management" page using the account "QA_ViralGains"
    When I select Filter Criteria "<Criteria1>"
    And I select Filter Criteria Parameter "<Parameter1>"
    And I click on "Apply Button"
    And I select Filter Criteria "<Criteria2>"
    And I enter Filter Criteria Parameter "<Parameter2>"
    And I click on "Apply Button"
    And I select Filter Criteria "<Criteria3>"
    And I select Filter Criteria Parameter "<Parameter3>"
    And I click on "Apply Button"
    Then I expect that element "Filter Result" contains the text "<Criteria1>: <Parameter1>"
    And I expect that the Grid element "Account Name Column" does contain the text "<Parameter1>"
    And I expect that element "Filter Result" contains the text "<Criteria2>: <Parameter2>"
    And I expect that the Grid element "<Column2>" does contain the text "<Parameter2>"
    And I expect that element "Filter Result" contains the text "<Criteria3>: <Parameter3>"
    And I expect that the Grid element "<Column3>" does contain the text "<Parameter3>"

    Examples:

      |Criteria1   |Parameter1     |   Criteria2   |Parameter2      |   Criteria3   |Parameter3 |Column2          |Column3      |
      |Account     |QA_ViralGains  |   Group Name  |QA_ViralGains   |   Status      |ENABLED    |Group Name Column|Status Column|


#Filter the Groups Tab with Multiple criteria Group Name and Status
  Scenario Outline:
    Given I am on the "groups" tab of the "account management" page using the account "QA_ViralGains"
    When I select Filter Criteria "<Criteria1>"
    And I enter Filter Criteria Parameter "<Parameter1>"
    And I click on "Apply Button"
    And I select Filter Criteria "<Criteria2>"
    And I select Filter Criteria Parameter "<Parameter2>"
    And I click on "Apply Button"
    Then I expect that element "Filter Result" contains the text "<Criteria1>: <Parameter1>"
    And I expect that the Grid element "<Column1>" does contain the text "<Parameter1>"
    And I expect that element "Filter Result" contains the text "<Criteria2>: <Parameter2>"
    And I expect that the Grid element "<Column2>" does contain the text "<Parameter2>"

    Examples:

      |Criteria1   |Parameter1      |   Criteria2   |Parameter2 |Column1          |Column2      |
      |Group Name  |QA_ViralGains   |   Status      |ENABLED    |Group Name Column|Status Column|


#Filter the Groups Tab with All Filter options and then remove the Account Criteria already applied
  Scenario Outline:
    Given I have a Group named "<groupName>" under Account "QA_ViralGains" with user emails "qa@viralgains.com" and permissions "ACCOUNT_READ"
    And I am on the "groups" tab of the "account management" page using the account "QA_ViralGains"
    When I select Filter Criteria "<Criteria1>"
    And I select Filter Criteria Parameter "<Parameter1>"
    And I click on "Apply Button"
    And I select Filter Criteria "<Criteria2>"
    And I enter Filter Criteria Parameter "<groupName>"
    And I click on "Apply Button"
    And I select Filter Criteria "<Criteria3>"
    And I select Filter Criteria Parameter "<Parameter3>"
    And I click on "Apply Button"
    Then I expect that element "Filter Result" contains the text "<Criteria1>: <Parameter1>"
    And I expect that the Grid element "<Column1>" does contain the text "<Parameter1>"
    And I expect that element "Filter Result" contains the text "<Criteria2>: <groupName>"
    And I expect that the Grid element "<Column2>" does contain the text "<groupName>"
    And I expect that element "Filter Result" contains the text "<Criteria3>: <Parameter3>"
    And I expect that the Grid element "Account Name Column" does contain the text "<Parameter3>"
    When I click on "Filter Cancel button for Criteria3"
    Then I expect that element "Filter Cancel button for Criteria3" does not exist
    And I expect that element "Filter Result" contains the text "<Criteria1>: <Parameter1>"
    And I expect that element "Filter Result" contains the text "<Criteria2>: <groupName>"


    Examples:

      |Criteria1  |Parameter1  |   Criteria2   |groupName      |  Criteria3   |Parameter3     |Column1      |Column2          |
      |Status     |ENABLED     |   Group Name  |QA_ViralGains  |  Account     |QA_ViralGains  |Status Column|Group Name Column|


## Campaigns Overview Page

#Filter the Campaigns Overview Page with all Status(es)
  Scenario Outline:
    Given I am on the "campaigns" tab of the "campaigns" page using the account "QA_ViralGains"
    And I select Filter Criteria "<Criteria>"
    And I select Filter Criteria Parameter "<Parameter>"
    And I click on "Apply Button"
    Then I expect that element "Filter Result" contains the text "<Criteria>: <Parameter>"
    And I expect that the Grid element "<Column>" does contain the text "<Parameter>"

    Examples:

      |Criteria   |Parameter  |Column       |
      |Status     |STAGED     |Status Column|
 #     |Status     |LIVE       |Status Column|
 #     |Status     |PAUSED     |Status Column|
   #   |Status     |COMPLETED  |Status Column|


#Cancel Button in filtered results
  Scenario Outline:
    Given I am on the "campaigns" tab of the "campaigns" page using the account "QA_ViralGains"
    And I select Filter Criteria "<Criteria>"
    And I select Filter Criteria Parameter "<Parameter>"
    And I click on "Apply Button"
    Then I expect that element "Filter Result" contains the text "<Criteria>: <Parameter>"
    When I click on "Filter Cancel button"
    Then I expect that element "Filter Result" does not exist

    Examples:

      |Criteria   |Parameter     |
      |Status     |STAGED        |


#Filter the Campaigns Overview Page with Campaign Name
  Scenario Outline:
    Given I have a Campaign named "<campaignName>" under Account "QA_ViralGains"
    And I am on the "campaigns" tab of the "campaigns" page using the account "QA_ViralGains"
    When I select Filter Criteria "<Criteria>"
    And I enter Filter Criteria Parameter "<campaignName>"
    And I click on "Apply Button"
    Then I expect that element "Filter Result" contains the text "<Criteria>: <campaignName>"
    And I expect that the Grid element "Campaign Name Column" does contain the text "<campaignName>"

    Examples:

      |Criteria     |campaignName  |
      |Campaign     |QA            |



#Filter the Campaigns Overview Page with All Filter options
  Scenario Outline:
    Given I have a Campaign named "<campaignName>" under Account "QA_ViralGains"
    And I am on the "campaigns" tab of the "campaigns" page using the account "QA_ViralGains"
    When I select Filter Criteria "<Criteria1>"
    And I select Filter Criteria Parameter "<Parameter1>"
    And I click on "Apply Button"
    And I select Filter Criteria "<Criteria2>"
    And I enter Filter Criteria Parameter "<campaignName>"
    And I click on "Apply Button"
    And I select Filter Criteria "<Criteria3>"
    And I enter Filter Criteria Parameter "<Parameter3>"
    And I click on "Apply Button"
    And I select Filter Criteria "<Criteria4>"
    And I select Filter Criteria Parameter "<Parameter4>"
    And I click on "Apply Button"
    Then I expect that element "Filter Result" contains the text "<Criteria1>: <Parameter1>"
    And I expect that element "Filter Result" contains the text "<Criteria2>: <campaignName>"
    And I expect that the Grid element "Campaign Name Column" does contain the text "<campaignName>"
    And I expect that element "Filter Result" contains the text "<Criteria3>: <Parameter3>"
    And I expect that element "Filter Result" contains the text "<Criteria4>: <Parameter4>"
    And I expect that the Grid element "<Column4>" does contain the text "<Parameter4>"


    Examples:

      |Criteria1   |Parameter1     |  Criteria2    |campaignName              |  Criteria3   |Parameter3                |  Criteria4   |Parameter4 |Column4      |
      |Account     |QA_ViralGains  |  Campaign     |QA_ViralGainsCampaign     |  Creative    |QA_ViralGainsCreative     |  Status      |STAGED     |Status Column|


#Filter the Campaigns Overview Page with Multiple criteria Campaign Name and Status
  Scenario Outline:
    Given I have a Campaign named "<campaignName>" under Account "QA_ViralGains"
    And I am on the "campaigns" tab of the "campaigns" page using the account "QA_ViralGains"
    When I select Filter Criteria "<Criteria1>"
    And I enter Filter Criteria Parameter "<campaignName>"
    And I click on "Apply Button"
    And I select Filter Criteria "<Criteria2>"
    And I select Filter Criteria Parameter "<status>"
    And I click on "Apply Button"
    Then I expect that element "Filter Result" contains the text "<Criteria1>: <campaignName>"
    And I expect that the Grid element "Campaign Name Column" does contain the text "<campaignName>"
    And I expect that element "Filter Result" contains the text "<Criteria2>: <status>"
    And I expect that the Grid element "<Column2>" does contain the text "<status>"


    Examples:

      | Criteria1   |  campaignName              |  Criteria2   |status     |Column2      |
      | Campaign    |  QA_ViralGainsCampaign     |  Status      |STAGED     |Status Column|




#Filter the Campaigns Overview Page with All Filter options and then remove the Status Criteria already applied
  Scenario Outline:
    Given I have a Campaign named "<campaignName>" under Account "QA_ViralGains"
    And I am on the "campaigns" tab of the "campaigns" page using the account "QA_ViralGains"
    When I select Filter Criteria "<Criteria1>"
    And I select Filter Criteria Parameter "<Parameter1>"
    And I click on "Apply Button"
    And I select Filter Criteria "<Criteria2>"
    And I enter Filter Criteria Parameter "<campaignName>"
    And I click on "Apply Button"
    And I select Filter Criteria "<Criteria3>"
    And I enter Filter Criteria Parameter "<Parameter3>"
    And I click on "Apply Button"
    And I select Filter Criteria "<Criteria4>"
    And I select Filter Criteria Parameter "<Parameter4>"
    And I click on "Apply Button"
    Then I expect that element "Filter Result" contains the text "<Criteria1>: <Parameter1>"
    And I expect that element "Filter Result" contains the text "<Criteria2>: <campaignName>"
    And I expect that the Grid element "Campaign Name Column" does contain the text "<campaignName>"
    And I expect that element "Filter Result" contains the text "<Criteria3>: <Parameter3>"
    And I expect that element "Filter Result" contains the text "<Criteria4>: <Parameter4>"
    And I expect that the Grid element "<Column4>" does contain the text "<Parameter4>"
    When I click on "Filter Cancel button for Criteria4"
    Then I expect that element "Filter Result" contains the text "<Criteria1>: <Parameter1>"
    And I expect that element "Filter Result" contains the text "<Criteria2>: <campaignName>"
    And I expect that element "Filter Result" contains the text "<Criteria3>: <Parameter3>"


    Examples:

      |Criteria1   |Parameter1   |  Criteria2    |campaignName              |  Criteria3   |Parameter3                |  Criteria4   |Parameter4 |Column4      |
      |Account     |QA_ViralGains|  Campaign     |QA_ViralGainsCampaign     |  Creative    |QA_ViralGainsCreative     |  Status      |STAGED     |Status Column|


#Filter the Campaigns Overview Page with Account Name and displays campaigns exists (or does't exists) under that Account

  Scenario Outline:

    Given I have a Campaign named "<Campaign Name1>" under Account "QA_ViralGains"
    And I am on the "campaigns" tab of the "campaigns" page using the account "QA_ViralGains"
    When I select Filter Criteria "<Criteria1>"
    And I select Filter Criteria Parameter "<Parameter1>"
    And I click on "Apply Button"
    Then I expect that the Grid element "Campaign Name Column" does contain the text "<Campaign Name1>"
    When I click on "New Campaign"
    And I set "<Campaign Name2>" to the inputfield appended with current Date_Time "Campaign Name"
    And I click on "Save"
    And I click on "Filter Cancel button"
    Then I expect that the Grid element "Campaign Name Column" does contain the text "<Campaign Name2>"

    Examples:

      |Criteria1   |Parameter1             | Campaign Name1            | Campaign Name2        |
      |Account     |QA_Viralgains          | Only Campaign             | Filter Test Campaign  |
