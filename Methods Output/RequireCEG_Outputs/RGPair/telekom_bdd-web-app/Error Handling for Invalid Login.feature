Feature: Error Handling for Invalid Login

  As a user
  I want to log into the system
  So that I can access my dashboard securely

  Background:
    Given that the login form is displayed
    And the username and password fields are empty

  Scenario: Scenario 1: Attempting to log in with empty fields
    Given the username field is empty
    And the password field is empty
    When the user attempts to log in
    Then the error message should be 'Username or password cannot be empty.'

  Scenario: Scenario 2: Attempting to log in with invalid username
    Given the username 'invalidUser' does not exist
    And the password is 'somePassword'
    When the user attempts to log in
    Then the error message should be 'Username does not exist. Please register.'

  Scenario: Scenario 3: Attempting to log in with correct username but invalid password
    Given the username 'existingUser' exists
    And the password is incorrect
    When the user attempts to log in with the wrong password
    Then the error message should be 'Invalid password. Please try again.'

  Scenario: Scenario 4: Successfully logging in with valid credentials
    Given the username 'validUser' exists
    And the password is correct
    When the user attempts to log in
    Then the user should be redirected to their dashboard

  Scenario: Scenario 5: Attempting to log in with locked account
    Given the account for username 'lockedUser' is locked
    When the user attempts to log in
    Then the error message should be 'Your account is locked. Please contact support.'

  Scenario: Scenario 6: Attempting to log in after three failed attempts
    Given the user has attempted to log in three times unsuccessfully
    When the user attempts to log in again
    Then the error message should be 'Too many failed attempts. Please wait 30 minutes before trying again.'

  Scenario Outline: Scenario Outline: Too many failed login attempts
    Given the user has attempted to log in <attempts> times unsuccessfully
    When the user attempts to log in again
    Then the error message should be 'Too many failed attempts. Please wait 30 minutes before trying again.'
    Examples:
      | attempts |
      | 3 |
      | 4 |
      | 5 |

