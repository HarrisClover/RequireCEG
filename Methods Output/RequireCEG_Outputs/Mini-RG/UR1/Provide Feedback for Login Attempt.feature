Feature: Provide Feedback for Login Attempt

  As a user
  I want to receive feedback on my login attempts
  So that I can know whether my credentials are correct

  Background:
    Given a registered username and password
    And the user is on the login page

  Scenario: Scenario 1: Successful Login
    Given a user provides the correct username and password
    When the user attempts to log in
    Then the user should be granted access to the system
    And the system should display the account balance if the user has permission

  Scenario: Scenario 2: Incorrect Username
    Given the user provides an incorrect username
    When the user attempts to log in
    Then the system should display a message indicating that the username is incorrect

  Scenario: Scenario 3: Incorrect Password
    Given the user provides a correct username but an incorrect password
    When the user attempts to log in
    Then the system should display a message indicating that the password is incorrect

  Scenario: Scenario 4: No Permission to View Account Balance
    Given the user logs in with correct credentials but lacks permission
    When the user attempts to view the account balance
    Then the system should display a message stating that they do not have permission to access the account balance

  Scenario: Scenario 5: Missing Permission for Account Balance
    Given the user successfully logs in
    When the user attempts to view the account balance without the appropriate permissions
    Then the system should display a message stating that the user does not have permission to access the account balance

  Scenario: Scenario 6: Nonexistent Username
    Given a user provides a username that does not exist in the registered users list
    When the user attempts to log in
    Then the system should display a message indicating that the username is incorrect

  Scenario: Scenario 7: Non-matching Password
    Given a user provides a username that exists in the registered users list, but provides a password that does not match
    When the user attempts to log in
    Then the system should display a message indicating that the password is incorrect
