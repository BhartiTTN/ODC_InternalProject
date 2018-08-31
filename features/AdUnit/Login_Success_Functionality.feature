    Feature: Login Success

    Scenario: Login Success

    # Script verifies User Login Success on the environment

      Given I login as an Admin user

      Then I am on the <"Dashboard"> page

