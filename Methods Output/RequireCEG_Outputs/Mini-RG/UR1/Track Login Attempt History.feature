Feature: Track Login Attempt History

  As a user
  I want to be able to log into my account and track my login activity
  So that I can ensure the security of my account and manage access

  Background:
    Given the system records login attempts
    And each user has a maximum of three allowed failed attempts

  Scenario: Successful login with correct credentials
    Given the username and password are correct
    When the user attempts to log in
    Then the system logs a successful login attempt
    And the timestamp of the login attempt is recorded

  Scenario: Failed login attempt with incorrect credentials
    Given the username and password are incorrect
    When the user attempts to log in
    Then the system logs a failed login attempt
    And the count of failed attempts for that user is incremented

  Scenario: Account lock after multiple failed login attempts
    Given the user has made three consecutive failed login attempts
    When the user attempts to log in again with incorrect credentials
    Then the system locks the user account temporarily
    And the message 'Your account is locked due to multiple failed attempts.' is displayed
    And reject any further login attempts during the lock period.

  Scenario: Viewing account balance with correct permissions
    Given the user is successfully logged in and has permission to view the balance
    When the user requests to view their account balance
    Then the system displays the account balance

  Scenario: Viewing account balance without permission
    Given the user is successfully logged in but lacks permission to view the balance
    When the user requests to view their account balance
    Then the system displays 'Insufficient permissions to view account balance.'

  Scenario: Redirecting to login when not authenticated
    Given the user is not logged in
    When the user attempts to view their account balance
    Then the system redirects the user to the login page

  Scenario: Account lock indication
    Given the count of failed login attempts for the user exceeds three
    Then the system locks the account and displays a rejection message.

  Scenario: Login attempt history recording
    Given a user submits a login attempt
    Then the system records the login attempt in the login history.

  Scenario: Permission denied for account balance
    Given a user submits a login attempt but does not have permission to view the balance
    Then the system displays 'Insufficient permissions to view account balance.'
