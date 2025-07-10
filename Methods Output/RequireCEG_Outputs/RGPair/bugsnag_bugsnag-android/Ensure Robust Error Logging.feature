Feature: Ensure Robust Error Logging

  As a developer
  I want to implement a comprehensive error logging system
  So that I can effectively diagnose and respond to issues in the application

  Background:
    Given the error logging system is initialized
    And the application is running on a device

  Scenario: Log Native Crash in JVM or NDK
    Given a native crash occurs in JVM or NDK code
    When the system captures the error details
    Then the error class should be logged
    And the error message should be logged
    And the severity of the error should be logged
    And relevant user information should be included

  Scenario: Log Unhandled Exception
    Given an unhandled exception occurs
    When the error information is processed
    Then detailed exception information should be logged
    And current device and application metadata should be included

  Scenario: Log Null Pointer Dereference
    Given a null pointer dereference occurs
    When the system detects the issue
    Then the error should be logged with a critical severity tag

  Scenario: Log Stack Overflow Error
    Given a stack overflow error occurs
    When the system detects this condition
    Then the error should be logged with an appropriate severity tag

  Scenario: StrictMode Violations
    Given a StrictMode violation occurs
    When the violation is detected
    Then a distinct report should be generated and logged

  Scenario: Log Application Not Responding (ANC)
    Given an ANC event occurs
    When the system records the performance impact
    Then accurate session information should be logged

  Scenario: Ignore Duplicate Errors
    Given a duplicate error is detected
    When the logging system processes the error
    Then the duplicate error should be ignored

  Scenario: Handle Unusual Strings
    Given unusual strings are identified in user data
    When the system attempts to log this data
    Then the log should be processed without interrupting the workflow

  Scenario: Integrate Custom Metadata
    Given custom metadata is provided via the plugin interface
    When the error report is generated
    Then the custom metadata should be seamlessly integrated into the report

  Scenario: Record Breadcrumbs
    Given privileged or automatic events occur
    When breadcrumbs are generated
    Then they should be systematically recorded within the error reports

  Scenario: Ensure StrictMode and Unhandled Exceptions are Related
    Given an unhandled exception occurs
    And a StrictMode violation occurs
    When the logging system processes these conditions
    Then both the exception and the StrictMode violation should be logged together.

  Scenario: Check for Actions on C1 and C2
    Given a native crash occurs in JVM or NDK code
    When the system captures the error details
    Then appropriate error logging should occur for either condition.
