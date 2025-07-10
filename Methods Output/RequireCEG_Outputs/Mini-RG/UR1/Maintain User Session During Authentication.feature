Feature: Maintain User Session During Authentication

  As a user
  I want the system to verify my login credentials and maintain my session
  So that I can securely access my bank account and its functionalities

  Background:
    Given the user has a valid username and password
    And the user is on the login page

  Scenario: Scenario 1: Successful Login
    Given the user enters a correct username and password
    When the user submits the login form
    Then the user should be granted access
    And a session should be created for the user

  Scenario: Scenario 2: Unsuccessful Login - Incorrect Password
    Given the user enters a correct username and an incorrect password
    When the user submits the login form
    Then the user should be denied access
    And an error message should indicate unsuccessful login

  Scenario: Scenario 3: Unsuccessful Login - Incorrect Username
    Given the user enters an incorrect username and a correct password
    When the user submits the login form
    Then the user should be denied access
    And an error message should indicate unsuccessful login

  Scenario: Scenario 4: User Accessing Account Balance with Permissions
    Given the user is logged in and has the necessary permissions
    When the user requests to view the account balance
    Then the current account balance should be displayed

  Scenario: Scenario 5: User Accessing Account Balance without Permissions
    Given the user is logged in but does not have the necessary permissions
    When the user requests to view the account balance
    Then an appropriate message should inform the user of access restrictions

  Scenario: Scenario 6: Accessing Account Balance with Permission Mismatch
    Given the user is logged in with ambiguous permission status
    When the user requests to view the account balance
    Then an appropriate message should inform the user of access restrictions

  Scenario: Scenario 7: Successful Login with Session Maintained
    Given the user enters a correct username and password
    When the user submits the login form
    Then the user should be granted access
    And a session should be created for the user
