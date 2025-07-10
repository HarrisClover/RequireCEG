Feature: Include Application Metadata

  As a developer
  I want to capture detailed information about native crashes
  So that I can effectively troubleshoot and improve application performance

  Background:
    Given the application is running on a user device
    And the Bugsnag notifier is initialized

  Scenario: Capture native crash details
    Given an unhandled exception occurs in the code
    Then the error report is generated with error class and message
    And the report includes user ID, device ID, and app version

  Scenario: Log context-sensitive payload for critical errors
    Given a null pointer dereferencing or stack overflow event occurs
    Then the system logs relevant variables and stack traces

  Scenario: Handle ANR exception reports
    Given the application experiences an ANR due to code execution delays
    Then a report is triggered with performance metrics and timestamps

  Scenario: Ensure uniqueness of error reports
    Given an error instance with <error-class>
    And the error message contains <error-message>
    When the error is recorded in the system
    Then only unique error instances are stored

  Scenario: Filter out user data from error context
    Given an error report includes user data or unusual strings
    Then the system ensures that sensitive information is not exposed

  Scenario: Verify error reporting with additional metadata
    Given unhandled exceptions occur in either JVM or NDK code
    Then successful error reports include additional metadata for unhandled exceptions

  Scenario: Check for uniqueness of error instances
    Given an error instance is processed
    When a new error with the same properties is generated
    Then the system prevents duplicate error entries

  Scenario: Confirm filtered error context
    Given user data is included in the error context
    Then the error report does not expose any sensitive information
