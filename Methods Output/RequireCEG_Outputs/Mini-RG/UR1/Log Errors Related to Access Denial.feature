Feature: Log Errors Related to Access Denial

  As a user
  I want to log in and access my account securely
  So that I can manage my finances without unauthorized access

  Background:
    Given the system is online

  Scenario: Scenario 1: Successful Login and Access to Account Balance
    Given the user has valid login credentials
    When the user enters a valid username and password
    Then the user should be granted access to their account
    And the current account balance should be displayed

  Scenario: Scenario 2: Invalid Login Credentials
    Given the user enters an incorrect username or password
    When the user attempts to log in
    Then an error message should be displayed stating 'Invalid username or password'
    And the event should be logged as an access denial error due to incorrect credentials

  Scenario: Scenario 3: Insufficient Permissions to View Account Balance
    Given the user enters valid credentials but lacks permission to view the account balance
    When the user attempts to view the account balance
    Then an error message should be displayed stating 'Access to account balance is denied'
    And the event should be logged as an access denial due to insufficient permissions

  Scenario: Scenario 4: Attempt Login Without Providing Username
    Given the user has not entered a username
    When the user attempts to log in
    Then an error message should be displayed stating 'Invalid username or password'
    And the event should be logged as an access denial error due to incorrect credentials

  Scenario: Scenario 5: Attempt Login Without Providing Password
    Given the user has not entered a password
    When the user attempts to log in
    Then an error message should be displayed stating 'Invalid username or password'
    And the event should be logged as an access denial error due to incorrect credentials

  Scenario Outline: Scenario Outline: Test Login Attempts
    Given the user enters a username '<username>' and password '<password>'
    When the user attempts to log in
    Then the result should be '<result>'
    And if the result is 'Access Denied', an error should be logged stating '<error reason>'
    Examples:
      | username | password | result | error reason |
      | validUser | validPass | Access Granted |  |
      | invalidUser | anyPass | Access Denied | Invalid username or password |
      | validUser | invalidPass | Access Denied | Invalid username or password |
      | noPermissionUser | validPass | Access Denied | Access to account balance is denied |
      | validUser |  | Access Denied | Invalid username or password |
      |  | validPass | Access Denied | Invalid username or password |

