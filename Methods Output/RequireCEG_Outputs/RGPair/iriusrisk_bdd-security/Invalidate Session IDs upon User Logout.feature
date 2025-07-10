Feature: Invalidate Session IDs upon User Logout

  As a user
  I want to ensure my session is terminated securely upon logout
  So that my personal information and account security are maintained

  Background:
    Given a user is logged into the system
    And the user initiates the logout action

  Scenario: Scenario 1: Successful Logout
    Given the user has an active session
    When the user clicks the logout button
    Then the system invalidates the user's current session ID
    And the user receives a confirmation message stating 'You have successfully logged out.'

  Scenario: Scenario 2: Session Cookie Invalidated
    Given the user has logged out
    When the session cookie is inspected
    Then the session cookie associated with the session ID should be invalidated
    And the flags 'secure' and 'httpOnly' are set to mitigate risks

  Scenario: Scenario 3: Inactivity Logout
    Given the user is logged in but inactive for 15 minutes
    When the system automatically checks user activity
    Then the session ID should be invalidated due to inactivity
    And the user receives a message stating 'Your session has expired due to inactivity. Please log in again.'

  Scenario: Scenario 4: Access Denial after Logout
    Given the user's session has been invalidated
    When the user attempts to access a secure page
    Then the system should trigger an access denial response
    And the user receives a message stating 'Access denied. Session invalidated. Please log in to continue.'

  Scenario: Scenario 5: Session Invalidation Logging on Logout Action Confirmation Without Valid Session ID at Logout Action Initiation Check Before Request Processing
    Given the user is logged into the system and initiates logout without a valid session
    When the system processes the logout request
    Then the system logs the logout action despite the invalid session
    And the user receives a message stating 'You have successfully logged out.'

  Scenario Outline: Scenario Outline: User Logout Scenario
    Given the user has session status <session-status>
    And the user initiates a logout action
    When the system processes the logout request
    Then the session should be <session-outcome>
    Examples:
      | session-status | session-outcome |
      | active | successfully invalidated |
      | inactive | already invalidated |
      | logged out | already invalidated |

