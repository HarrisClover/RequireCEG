Feature: Consistent Behavior Regardless of Session States

  As a user
  I want to log in and manage my reservations effectively
  So that I can have a seamless experience without unexpected behavior

  Background:
    Given the user is on the login page
    And the user has valid credentials

  Scenario: Successful login with valid credentials
    Given the user enters a valid username and password
    When the user submits the login form
    Then the system grants access
    And the user is redirected to the reservations page

  Scenario: Unsuccessful login with invalid credentials
    Given the user is on the login page
    When the user enters a username that does not exist in the system or a password that does not match the username
    Then the system displays an error message indicating that the login attempt was unsuccessful

  Scenario: Making a reservation during unavailable times
    Given the user is logged in
    When the user attempts to make a reservation during unavailable times
    Then the system shows an error message informing the user that no reservations can be made at that time

  Scenario: JavaScript disabled notification
    Given the user has JavaScript disabled in their browser
    When the user accesses the application
    Then the system prompts a notification to enable JavaScript

  Scenario Outline: Session integrity and data consistency
    Given the user is logged in and has a reservation history
    And the system is in <session-state>
    When the user navigates to different pages
    Then the system maintains the user's login state and reservation history
    Examples:
      | session-state | outcome |
      | active | user's state is maintained and history is intact |
      | inactive | user is prompted to log in again |


  Scenario: Session integrity verification across environments
    Given the user is logged in and has valid credentials
    When the user accesses the application across different test environments
    Then the system maintains session integrity across different test environments
