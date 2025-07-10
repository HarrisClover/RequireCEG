Feature: Offer Security Tips for Account Protection

  As a bank user
  I want to receive security tips for protecting my account
  So that I can ensure the safety of my personal and financial information

  Background:
    Given the user has attempted to log into their bank account
    And they have provided their username and password

  Scenario: Successful login with account view permissions
    Given the user has successfully logged into their bank account
    When they access account information
    Then security tips should be displayed
    And the account balance should also be shown

  Scenario: Successful login without account view permissions
    Given the user has successfully logged into their bank account
    When they attempt to view their account balance
    Then security tips should be displayed
    And the account balance should not be shown

  Scenario: Unsuccessful login due to incorrect credentials
    Given the user has attempted to log into their bank account
    And the login attempt was unsuccessful due to incorrect username or password
    When they attempt to log in again
    Then a failure message indicating the problem should be displayed
    And no security tips should be shown

  Scenario: Logged in user without permissions
    Given the user has successfully logged into their bank account
    And the user is logged in but lacks the required permissions to view their account balance
    When they try to access account information
    Then security tips should be displayed
    And account information should not be visible

  Scenario: User not logged in
    Given the user has not logged into their bank account
    When they attempt to access account information
    Then no security tips should be shown
    And no account information should be displayed
