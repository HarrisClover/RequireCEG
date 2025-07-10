Feature: User Logout Functionality

  As a logged-in user
  I want to be able to log out securely
  So that I can ensure my account remains safe and I can log back in when needed

  Background:
    Given the user is logged into the system
    And the user is on their account dashboard

  Scenario: Scenario 1: Successful Logout
    Given the user clicks the logout button
    And the system prompts the user to confirm the logout action
    When the user confirms the logout
    Then the user's session is invalidated
    And the user is redirected to the home page with a successful logout message

  Scenario: Scenario 2: Attempt to access features post-logout
    Given the user is logged out
    When the user attempts to access a feature that requires authentication
    Then the system detects the invalid session
    And the user is prompted to log in again to continue

  Scenario: Scenario 3: Logout action confirmation
    Given the user is currently logged in
    And the user initiates a logout
    When the logout action is confirmed by the user
    Then the user's session is invalidated
    And the user is redirected to the home page with a message indicating successful logout

  Scenario: Scenario 4: Inaccessibility of features after logout
    Given the user has logged out
    When the user attempts to access any feature that requires authentication
    Then the system denies access to the features
    And the user is prompted to log in again
