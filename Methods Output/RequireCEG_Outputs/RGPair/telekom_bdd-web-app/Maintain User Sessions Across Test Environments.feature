Feature: Maintain User Sessions Across Test Environments

  As a user
  I want to maintain my active session across multiple test environments
  So that I can have a seamless experience without needing to log in repeatedly

  Background:
    Given the user has valid credentials
    And the user is logged into test environment A

  Scenario: Scenario 1: Seamless session transition between environments
    Given the user has an active session in test environment A
    When the user attempts to log into test environment B
    Then the system recognizes the active session
    And the user is granted access without needing re-authentication

  Scenario: Scenario 2: Session expiration due to inactivity
    Given the user is logged into the system and inactive for a period
    When the user attempts to perform an action after session expiration
    Then the system presents a message indicating session timeout
    And the user must log in again

  Scenario: Scenario 3: Handling application errors during session handling
    Given the user is logged in with an active session
    And an application error occurs during session handling
    When the system encounters the error
    Then the session data should be preserved
    And the user can resume their tasks efficiently

  Scenario: Scenario 4: User attempts to make a reservation while logged in
    Given the user is logged into the system with a valid session
    When the user attempts to make a reservation
    Then the system permits the user to make reservations

  Scenario: Scenario 5: User's session active during interactions
    Given the user's session is active
    When the user interacts with the application
    Then the user's session remains active throughout the interactions

  Scenario: Scenario 6: User receives a fallback mechanism upon session disruption
    Given the user is logged in with an active session
    And an application error occurs during session handling
    When the system encounters the error
    Then the session data should be preserved
    And the user can resume their tasks without disruption
