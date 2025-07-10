Feature: End User Session After Inactivity

  As a bank customer
  I want my session to end after a period of inactivity
  So that my account security is maintained

  Background:
    Given a predefined duration for inactivity is established
    And a user is logged into the system

  Scenario: Scenario 1: Session ends due to inactivity
    Given the user has been inactive for the set duration
    When the user attempts to perform an action
    Then a message prompting the user to log in again should be displayed
    And the user is redirected to the login page

  Scenario: Scenario 2: Attempt to view account balance after session ends
    Given the user's session has ended due to inactivity
    When the user tries to access their account balance
    Then the user should be redirected to the login page
    And a message indicating the need to log in should be displayed

  Scenario: Scenario 3: User tries to access account-related information after logout
    Given the user's session has ended due to inactivity
    When the user tries to access account-related information
    Then the user should see a message indicating a need to log in with correct credentials

  Scenario: Scenario 4: Monitor user activity for security protocols
    Given the user's session has ended due to inactivity
    When user attempts any actions that require a session
    Then the system should monitor user activity to ensure security protocols are adhered to
