Feature: Secure Session Management
  As a Security Team,
  I want robust session management controls implemented
  So that user sessions are protected against hijacking, fixation, and unauthorized access.

  Scenario: Session Invalidation upon Logout
    Given a user is logged into the system with an active session ID
    When the user explicitly logs out of the application
    Then the user's session ID must be invalidated on the server side immediately
    And any subsequent requests using the invalidated session ID must be rejected.

  Scenario: Session Invalidation upon Inactivity Timeout
    Given a user is logged into the system with an active session
    And the system has a configured session inactivity timeout period
    When the user remains inactive for longer than the configured timeout period
    Then the user's session must be automatically invalidated by the server
    And the user must be required to re-authenticate to continue accessing protected resources.

  Scenario: Secure Session Cookie Attributes
    Given a user successfully authenticates and a session is established
    When the server sets the session cookie in the user's browser
    Then the session cookie must have the 'Secure' attribute set
    And the session cookie must have the 'HttpOnly' attribute set.