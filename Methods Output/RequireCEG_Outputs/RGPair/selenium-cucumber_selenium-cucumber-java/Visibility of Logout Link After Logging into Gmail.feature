Feature: Visibility of Logout Link After Logging into Gmail

  As a Gmail user
  I want to log in and out of my account seamlessly
  So that I can manage my email securely and easily

  Background:
    Given that a user has valid Gmail credentials
    And that the user is on the Gmail login screen

  Scenario: Scenario 1: User logs in successfully
    Given that the user enters valid credentials
    When the user clicks the login button
    Then the logout link should be displayed on the homepage
    And the user should be logged into the system

  Scenario: Scenario 2: User logs out successfully
    Given that the user is logged into Gmail
    When the user clicks the logout link
    Then the user should be logged out
    And the username input field should be visible again on the login screen

  Scenario: Scenario 3: User tries to access Gmail when not logged in
    Given that the user is not logged in
    When the user tries to access the Gmail homepage
    Then the user should be redirected to the login screen

  Scenario: Scenario 4: User re-enters valid credentials after logging out
    Given that the user has logged out of Gmail
    When the user enters valid credentials again
    Then the logout link should be displayed on the homepage
    And the user should be logged into the system again
