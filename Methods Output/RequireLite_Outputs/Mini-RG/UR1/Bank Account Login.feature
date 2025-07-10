Feature: Bank Account Login

  As a bank customer
  I want to log in to my bank account
  So that I can check my bank account balance

  Background:
    Given the user has a username and password
    And the user has permission to view account balance

  Scenario: Successful login with correct credentials
    Given the user enters the correct username and password
    When the user attempts to log in
    Then the user should be logged into their bank account
    And the user should view the bank balance

  Scenario: Failed login with incorrect credentials
    Given the user enters an incorrect username or password
    When the user attempts to log in
    Then the user should not be logged into their bank account

  Scenario: Account is locked after multiple failed login attempts
    Given the user has attempted to log in with incorrect credentials 3 times
    When the user attempts to log in again
    Then the user's account should be locked
    And the user should be informed of the lockout

  Scenario: User forgets their password
    Given the user has forgotten their password
    When the user attempts to reset their password
    Then the user should receive a password reset link
    And the process should securely verify the user's identity

  Scenario: Viewing balance without permission
    Given the user is logged into their bank account
    When the user attempts to view their bank balance
    Then the user should not view the account balance
    And the user does not have permission to view account balance

  Scenario: Viewing balance with permission
    Given the user is logged into their bank account
    When the user attempts to view their bank balance
    Then the user should view the account balance
    And the user has permission to view account balance

  Scenario: Concurrent login attempts from multiple devices
    Given the user is logged into their bank account from one device
    When the user logs in from the second device
    Then the user should be notified about the concurrent session
    And the original session should remain active unless explicitly logged out

  Scenario: Session timeout when viewing balance
    Given the user is logged into their bank account
    When the user attempts to view their bank balance
    Then the user should be logged out due to inactivity
    And the user should receive a notification about the session timeout
