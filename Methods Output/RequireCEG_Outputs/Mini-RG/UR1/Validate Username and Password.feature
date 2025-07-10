Feature: Validate Username and Password

  As a user
  I want to log into my bank account
  So that I can manage my finances securely

  Background:
    Given the user has a valid username and password
    And the system is operational

  Scenario: Scenario 1: Invalid Username
    Given the user enters an invalid username
    When the user attempts to log in
    Then the system displays 'Invalid username'

  Scenario: Scenario 2: Incorrect Password
    Given the user enters a valid username
    And an incorrect password
    When the user attempts to log in
    Then the system displays 'Incorrect password'

  Scenario: Scenario 3: Successful Login with Permission
    Given the user enters a valid username
    And the correct password
    When the user logs in
    Then the user is logged into their account
    And the system retrieves and displays the bank account balance

  Scenario: Scenario 4: Successful Login without Permission
    Given the user enters a valid username
    And the correct password
    And does not have the necessary permissions
    When the user logs in
    Then the user is logged into their account
    And the system displays 'You do not have permission to view your account balance'

  Scenario: Scenario 5: Logging with Secure Processing
    Given the user has successfully logged in with the correct credentials
    When the system processes sensitive information
    Then all sensitive information is processed securely
