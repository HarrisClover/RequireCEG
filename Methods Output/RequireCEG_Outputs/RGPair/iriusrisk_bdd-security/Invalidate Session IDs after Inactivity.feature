Feature: Invalidate Session IDs after Inactivity

  As a user of the application
  I want the system to automatically invalidate my session ID after a period of inactivity
  So that my account remains secure and protected from unauthorized access

  Background:
    Given the session ID is valid
    And the user is actively using the application

  Scenario: Scenario 1: Invalidate session after inactivity
    Given the user has been inactive for 15 minutes
    When the user tries to access a protected resource
    Then the system should display an error message
    And the user should be instructed to log in again

  Scenario: Scenario 2: Immediate invalidation on logout
    Given the user chooses to log out
    When the user clicks the logout button
    Then the session ID should be invalidated immediately

  Scenario: Scenario 3: Invalidate session with invalid session ID
    Given the session ID has been invalidated due to inactivity
    When the user attempts to access protected resources
    Then the system should display an error message instructing the user to log in again

  Scenario: Scenario 4: Enforce session cookie security flags
    Given the user has set security flags on their session cookies
    When the user is inactive for 15 minutes
    Then the session ID should be invalidated
    And the security settings should be upheld until invalidation
