Feature: Bank Account Login and Balance Viewing
  As a bank customer,
  I want to log into my bank account and check my balance,
  So that I can manage my finances securely.

  Background:
    Given the user is on the bank login page

  Scenario: Successful login with valid credentials
    Given a registered user with a valid username and password
    When the user enters the correct username and password
    Then the user should be logged into the bank account

  Scenario: Failed login with invalid credentials
    Given a user with an unregistered username or incorrect password
    When the user enters invalid credentials
    Then the user should not be logged into the bank account
    And an error message indicating invalid credentials should be displayed

  Scenario: Viewing account balance with permission
    Given the user is logged into the bank account
    And the user has permission to view the account balance
    When the user navigates to the account overview page
    Then the bank account balance should be displayed

  Scenario: Attempting to view account balance without permission
    Given the user is logged into the bank account
    And the user does not have permission to view the account balance
    When the user navigates to the account overview page
    Then the bank account balance should not be displayed
    And an appropriate access restriction message should be shown
