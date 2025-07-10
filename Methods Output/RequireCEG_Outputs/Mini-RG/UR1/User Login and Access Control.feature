Feature: User Login and Access Control

  As a user of the banking system
  I want to have my login credentials validated and access controlled
  So that I can securely access my bank account information

  Background:
    Given the system is able to validate user credentials
    And the user has a valid username and password in the database

  Scenario: Successful login with valid credentials and sufficient permissions
    Given the user enters valid login credentials
    And the user has the required permissions
    When the user logs into the system
    Then the user should be granted access to view their bank account balance
    And the user should see their bank account balance displayed

  Scenario: Failed login with invalid credentials
    Given the user enters invalid login credentials
    When the user attempts to log into the system
    Then the system should display an error message saying 'Login attempt failed: Invalid username or password.'

  Scenario: Failed access due to insufficient permissions
    Given the user enters valid login credentials
    And the user does not have the required permissions
    When the user logs into the system
    Then the system should display an error message saying 'Access denied: You do not have permission to view your account balance.'

  Scenario: Access denied due to invalid username or password
    Given the user enters a username that does not match any record in the database
    And the user enters a password that does not match
    When the user attempts to log into the system
    Then the system should display an error message saying 'Login attempt failed: Invalid username or password.'

  Scenario: Access denied due to lack of permission despite valid credentials
    Given the user enters valid login credentials
    And the user does not have permissions to view their bank account balance
    When the user logs into the system
    Then the system should display an error message saying 'Access denied: You do not have permission to view your account balance.'
