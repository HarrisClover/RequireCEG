Feature: User Login and Redirect

  As a user
  I want to log into my account
  So that I can access my account details and options

  Background:
    Given the username is 'dec2020secondbatch@gmail.com'
    And the password is 'Selenium@12345'

  Scenario: Scenario 1: Successful Login Redirects to Accounts Page
    Given the correct username and password are entered
    When the user attempts to log in
    Then the system validates the credentials
    And the user is redirected to the Accounts page
    And the page title displays 'My account - My Store'

  Scenario: Scenario 2: Unsuccessful Login Shows Error Message
    Given an incorrect username or password is entered
    When the user attempts to log in
    Then the system displays an error message
    And the message states 'Login failed. Please check your credentials and try again.'

  Scenario: Scenario 3: Login Failure with Incorrect Credentials Shows Specific Message and Title Validation Failure on Error Page
    Given the username is incorrect
    And the password is incorrect
    When the user attempts to log in
    Then the system displays an error message
    And the message states 'Login failed. Please check your credentials and try again.'

  Scenario: Scenario 4: Account Navigation Displays Correct Sections
    Given the user is on the Accounts page
    When the user views the account sections
    Then the user should see the following sections: 'ORDER HISTORY AND DETAILS', 'MY CREDIT SLIPS', 'MY ADDRESSES', 'MY PERSONAL INFORMATION', 'MY WISH LISTS', and 'Home'
