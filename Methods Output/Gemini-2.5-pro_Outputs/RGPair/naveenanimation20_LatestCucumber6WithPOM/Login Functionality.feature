Feature: Login Functionality
  As a registered user
  I want to log into the application
  So that I can access my account details

  Scenario: Verify Login Page Elements
    Given I am on the Login page
    Then the page title should be "Login - My Store"
    And the "Forgot your password?" link should be visible

  Scenario: Successful Login with Valid Credentials
    Given I am on the Login page
    When I enter the username "dec2020secondbatch@gmail.com"
    And I enter the password "Selenium@12345"
    And I click the Login button
    Then I should be redirected to the Accounts page
    And the Accounts page title should be "My account - My Store"