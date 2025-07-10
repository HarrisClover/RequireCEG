Feature: Log Out Functionality to Display Username Input Field Again

  As a user of the Homerunner platform
  I want to log out and see the username input field for re-login
  So that I can easily log back in whenever I want

  Background:
    Given the user is currently logged into the Homerunner platform
    And the user is on the dashboard page

  Scenario: Scenario 1: User logs out
    Given the user clicks the logout link
    When the logout process is initiated
    Then the logout link should be hidden
    And the username input field should be displayed for re-login

  Scenario: Scenario 2: User logs in successfully
    Given the user is on the Gmail login page
    When the user enters valid credentials and clicks the login button
    Then the system should authenticate the user
    And the logout link should appear after a brief loading delay

  Scenario: Scenario 3: User logs out and back in
    Given the user clicks the logout link while logged in
    When the user attempts to log back in using the same credentials
    Then the system should validate the credentials
    And the logout link should be displayed once more

  Scenario: Scenario 4: User clicks logout link again after login
    Given the user is logged back into the Homerunner platform
    When the user clicks the logout link again
    Then the logout link should be hidden
    And the username input field should be displayed for re-login

  Scenario: Scenario 5: User attempts to log back in with invalid credentials
    Given the user is currently logged out
    When the user enters invalid credentials
    Then the system should not authenticate the user
    And the username input field should remain displayed

  Scenario Outline: Scenario Outline: User Logging and Logging Out
    Given the user is in state <login-state>
    When the user <action>
    Then the system should <expected-outcome>
    Examples:
      | login-state | action | expected-outcome |
      | logged in | clicks the logout link | hide the logout link and show the username input field |
      | not logged in | enters valid credentials and clicks login | authenticate the user and show the logout link |
      | logged out | clicks the logout link | hide the logout link and show the username input field |

