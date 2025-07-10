Feature: Hide Account Balance for Unauthorized Users

  As a user
  I want to log into my bank account and access my balance based on my permissions
  So that I can manage my finances securely

  Background:
    Given a user exists with a username and password
    And the user has permission settings associated with their account

  Scenario: Scenario 1: Successful Login with Permission
    Given the user enters a correct username and password
    And the user has permission to view the account balance
    When the user requests to view their bank account balance
    Then the account balance should be displayed
    And a message 'Access Granted' is shown

  Scenario: Scenario 2: Successful Login without Permission
    Given the user enters a correct username and password
    And the user does not have permission to view the account balance
    When the user requests to view their bank account balance
    Then the account balance should not be displayed
    And a message 'Access Denied: Insufficient Permissions to View Account Balance' is shown

  Scenario: Scenario 3: Failed Login due to Incorrect Username or Password
    Given the user enters an incorrect username or password
    When the user attempts to log in
    Then access should be denied
    And a message 'Access Denied: Incorrect Username or Password' is shown

  Scenario: Scenario 4: Successful Login with Missing Permission
    Given the user enters a correct username and password
    And the user lacks permission to view the account balance
    When the user attempts to view their bank account balance
    Then the account balance should not be displayed
    And a message 'Access Denied: Insufficient Permissions to View Account Balance' is shown

  Scenario Outline: Scenario Outline: Login Attempt with Permissions
    Given a user with username <username> and password <password>
    And the user has <permissions> permission levels
    When the user attempts to log in
    Then the outcome should be <outcome>
    Examples:
      | username | password | permissions | outcome |
      | user1 | password1 | view | Access Granted |
      | user2 | password2 | no view | Access Denied: Insufficient Permissions to View Account Balance |
      | wrongUser | wrongPassword | any | Access Denied: Incorrect Username or Password |

