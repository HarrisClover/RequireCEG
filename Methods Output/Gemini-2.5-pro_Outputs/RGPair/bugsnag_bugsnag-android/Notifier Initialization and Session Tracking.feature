Feature: Notifier Initialization and Session Tracking
  As a developer,
  I want the error reporting notifier to initialize correctly and track sessions accurately
  So that errors are associated with the correct application usage context.

  Scenario: Successful Notifier Initialization
    Given the application is configured with a valid API key
    When the application starts
    Then the error reporting notifier should initialize successfully
    And session tracking should begin automatically (if configured)

  Scenario: Session Information in Error Payload
    Given the error reporting system is initialized and session tracking is enabled
    And a session has started
    When an error occurs during the active session
    Then the error report payload should contain a valid session object
    And the session object should include a session ID and start time
    And the session object should reflect the correct count of handled and unhandled events within that session

  Scenario: Handling API Key Change During Runtime (Illustrative - Behavior might vary)
    Given the error reporting system is initialized with API key "KEY_A"
    And a session is active
    When the API key is programmatically changed to "KEY_B"
    And an error occurs *after* the key change
    Then the error report should be sent using API key "KEY_B"
    # Note: Depending on implementation, session might restart or continue with new key association.

