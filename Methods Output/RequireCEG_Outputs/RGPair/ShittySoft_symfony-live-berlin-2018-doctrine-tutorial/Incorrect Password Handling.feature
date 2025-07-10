Feature: Incorrect Password Handling

  As a registered user
  I want to log in to the system securely
  So that I can access my dashboard and manage my account

  Background:
    Given a user attempts to log in with their email and password
    And the system stores valid credentials for registered users

  Scenario: Scenario 1: Correct Password Entry
    Given the user enters a valid email
    And the user enters the correct password
    When the user submits the login form
    Then the user should be granted access
    And the user should be redirected to their dashboard

  Scenario: Scenario 2: Incorrect Password Entry
    Given the user enters a valid email
    When the user enters an incorrect password
    Then the user should be denied access
    And the system should display a message indicating that the password is incorrect

  Scenario: Scenario 3: Non-Registered Email
    Given the user enters an email that is not registered in the system
    When the user submits the login form
    Then the user should be denied access
    And the system should display a message indicating that the email is not registered

  Scenario: Scenario 4: Account Lockout After Consecutive Failed Attempts
    Given the user enters a valid email and tries to log in
    And the user has made 4 consecutive incorrect password attempts
    When the user enters the incorrect password one more time
    Then the user should be denied access
    And the system should display a message indicating that the account is locked for 30 minutes

  Scenario: Scenario 5: Account Lockout After Maximum Attempts
    Given the user enters a valid email and tries to log in
    And the user has made 5 consecutive incorrect password attempts
    When the user enters the incorrect password one more time
    Then the user should be denied access
    And the system should display a message indicating that the account is locked for 1 hour
