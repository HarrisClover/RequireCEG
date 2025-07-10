Feature: Initialize Bugsnag Notifier

  As a system administrator
  I want to initialize the Bugsnag notifier for session tracking
  So that I can accurately report errors and monitor application performance

  Background:
    Given the application is launched
    And the Bugsnag notifier is configured with the correct API key

  Scenario: Scenario 1: Successful Bugsnag Initialization
    Given the API key is set
    When the Bugsnag notifier is initialized
    Then data collection for native crashes and unhandled exceptions is enabled
    And essential payload details are captured accurately

  Scenario: Scenario 2: Updating API Key
    Given the API key is modified
    When the application updates the Bugsnag configuration
    Then the new API key is reflected in the system
    And the Bugsnag configuration must be updated accordingly

  Scenario: Scenario 3: Handling Unhandled Exceptions
    Given an unhandled exception occurs
    When the system logs the error
    Then device and application metadata are captured for debugging

  Scenario: Scenario 4: Detecting Native Crashes
    Given a native crash is detected
    When the system logs the crash
    Then error details are correctly captured in the Bugsnag report
    And the appropriate action is taken for debugging

  Scenario: Scenario 5: Reporting Duplicate Errors
    Given duplicate error reports are identified
    When the system processes the errors
    Then duplicate error reports are suppressed
    And only unique error reports are logged

  Scenario Outline: Scenario Outline: Reporting Errors
    Given the system must report <error-type>
    And the payload includes <payload-detail>
    When an error occurs
    Then the error is logged with <logging-detail>
    Examples:
      | error-type | payload-detail | logging-detail |
      | null pointer dereferencing | error class, message, severity | captured error report |
      | stack overflow | error class, message, severity | captured error report |
      | ANR condition | device and app metadata | ANR report logged |

