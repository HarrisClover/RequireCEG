Feature: User Authentication

  As a user
  I want to log into my account at My Store
  So that I can access my account details and make purchases

  Background:
    Given the Login page is titled 'Login - My Store'
    And I can see a 'Forgot your password?' link

  Scenario: Scenario 1: Successful Login with Valid Credentials
    Given I enter the username 'dec2020secondbatch@gmail.com'
    And I enter the password 'Selenium@12345'
    When I submit the login form
    Then I should be redirected to the Accounts page
    And the title of the page should be 'My account - My Store.'

  Scenario: Scenario 2: Unsuccessful Login with Invalid Credentials
    Given I enter the username 'wronguser@gmail.com'
    And I enter the password 'WRONGPASSWORD'
    When I submit the login form
    Then I should remain on the Login page
    And I should see an error message stating 'Invalid credentials, please try again.'

  Scenario: Scenario 3: Password Reset Link Visibility
    Given I am on the Login page
    When I look for the 'Forgot your password?' link
    Then the 'Forgot your password?' link should be displayed

  Scenario: Scenario 4: Error Message Displayed for Invalid Credentials
    Given I enter an incorrect username and password
    When I submit the login form
    Then an error message 'Invalid credentials, please try again.' should be displayed on the Login page

  Scenario: Scenario 5: Successful Login Validates Credentials
    Given I have entered valid credentials
    When I submit the login form
    Then the system validates the credentials
    And the user is redirected to the Accounts page titled 'My account - My Store.'
