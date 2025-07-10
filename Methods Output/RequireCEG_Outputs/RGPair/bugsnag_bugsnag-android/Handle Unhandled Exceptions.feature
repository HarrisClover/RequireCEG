Feature: Handle Unhandled Exceptions

  As a system administrator
  I want to capture and log unhandled exceptions effectively
  So that I can analyze and address critical issues in the system

  Background:
    Given the system is monitoring for unhandled exceptions
    And the logging service is operational

  Scenario: Scenario 1: Log JVM Exception
    Given an unhandled exception occurs within the JVM
    When the exception is caught
    Then the type of error is logged with its class and message
    And the severity level is marked as 'critical'

  Scenario: Scenario 2: Log Null Pointer Exception
    Given a null pointer dereference exception occurs
    When the exception is logged
    Then the information is logged with a severity level marked as 'critical'
    And additional metadata regarding the device and app state is included

  Scenario: Scenario 3: Log NDK Exception
    Given an unhandled exception arises in NDK code
    When the stack trace is logged
    Then the error is classified as unhandled

  Scenario: Scenario 4: Detect Stack Overflow
    Given a stack overflow exception occurs
    When the event is detected
    Then it is registered as a high-severity error

  Scenario: Scenario 5: Handle StrictMode Violation
    Given a violation attributed to StrictMode is encountered
    When the issue is logged
    Then the violation is categorized accurately

  Scenario: Scenario 6: Suppress Duplicate Error Reports
    Given the error reporting system is active
    When duplicate error reports are detected
    Then they are suppressed to prevent redundancy

  Scenario: Scenario 7: Log Application Not Responding (ANR)
    Given an Application Not Responding situation occurs
    When the event is logged
    Then all relevant breadcrumbs of the event are captured

  Scenario: Scenario 8: Initialize Bugsnag Notifier
    Given the Bugsnag notifier is initialized after changing the API key
    When errors are reported
    Then session tracking is seamless
    And the session information in the error payload is correct

  Scenario Outline: Scenario Outline: Log with Unusual Strings
    Given unusual strings are present in user data
    When an error is reported
    Then the error reporting functionality remains intact
    Examples:
      | user_data | error_type | outcome |
      | valid_data | JVM Exception | logged successfully |
      | unusual_data_string | NDK Exception | logged without issues |


  Scenario: Scenario 9: Validate Error Handling with Bugsnag
    Given the Bugsnag notifier is initialized
    When the code encounters a null pointer dereference
    Then the logging reflects both the error type and severity correctly
