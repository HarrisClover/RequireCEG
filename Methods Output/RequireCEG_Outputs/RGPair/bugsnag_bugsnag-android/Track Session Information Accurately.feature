Feature: Track Session Information Accurately

  As a developer or system administrator
  I want to track session details including user identification, device metadata, and error logs
  So that I can maintain app performance and improve debugging processes

  Background:
    Given the Bugsnag notifier is initialized with a valid API key
    And the session tracking begins

  Scenario: Scenario 1: Capture Session Details
    Given a user logs into the system
    And the system captures user identification details
    When the session continues
    Then user ID and email are stored
    And device metadata is captured

  Scenario: Scenario 2: Log Native Crash Events
    Given a native crash occurs
    When the system processes the error payload
    Then the error class, message, severity, and line number are logged
    And the logged user and device data remain persistent after the session ends

  Scenario: Scenario 3: Handle Unhandled Exceptions
    Given an unhandled exception occurs
    When the system logs the incident
    Then the exception is tagged as 'unhandled'
    And the unhandled exception is logged and tagged accordingly

  Scenario: Scenario 4: Record Application Not Responding Events
    Given an Application Not Responding (ANR) event is detected
    When the system identifies the environment (JVM or CXX)
    Then the event is logged with its impact on app performance

  Scenario: Scenario 5: Log Handled Exceptions
    Given a handled exception occurs
    When the system processes the error
    Then the handled exception is logged and tagged accordingly

  Scenario Outline: Scenario Outline: Validate User Data Logging
    Given the system receives user data containing unusual strings <user-data>
    And the logging functionality is operational
    When the user data is processed
    Then the logging operates without disruption
    And inappropriate or sensitive information is filtered out of the logs
    Examples:
      | user-data | expected-result |
      | normal_string | logged correctly |
      | sensitive_data | filtered out |
      | malicious_script | filtered out |

