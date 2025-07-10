Feature: Deny Access for Unauthorized Users

  As a user
  I want to log into the system securely
  So that I can access my account features safely

  Background:
    Given a user has the login credentials
    And the user is attempting to log in

  Scenario: Scenario 1: Invalid login credentials
    Given the username is incorrect
    And the password is incorrect
    When the user attempts to log in
    Then the message 'Access Denied: Invalid username or password' should be displayed
    And access to the system should be denied

  Scenario: Scenario 2: Correct credentials but no permission
    Given the username and password are correct
    And the user's access level does not include permission to view the account balance
    When the user logs in
    Then the system should log the user in
    And the message 'Login successful, but you do not have permission to view the account balance.' should be displayed

  Scenario: Scenario 3: Successful login with permissions
    Given the username and password are correct
    And the user has permission to view the account balance
    When the user logs in successfully
    Then the system should allow the user to log in
    And the account balance should be displayed

  Scenario: Scenario 4: Access Denied due to invalid credentials
    Given the username is valid
    And the password is valid
    When the username and password do not match the records in the system
    Then the message 'Access Denied: Invalid username or password' should be displayed
    And access to the system should be denied
