Feature: Tag Handled vs. Unhandled Exceptions

  As a system administrator
  I want to categorize exceptions based on their occurrence context
  So that I can ensure accurate logging and tracking of errors

  Background:
    Given the application is monitoring for exceptions
    And the system has been configured to differentiate between handled and unhandled exceptions

  Scenario: Handling a caught exception
    Given an exception is encountered within a try-catch block
    And the exception type is recognized
    When the exception is caught
    Then the exception should be logged as a 'Handled Exception'
    And there should be no duplicate entries in the log

  Scenario: Encountering an uncaught exception
    Given an exception is thrown but not caught
    When the application terminates due to the exception
    Then the exception should be logged as an 'Unhandled Exception'

  Scenario: Logging a Null Pointer Dereferencing error with high severity level
    Given an exception is detected indicating Null Pointer Dereferencing
    When the exception is logged
    Then the severity level of the log should be 'High'
    And the error message should contain relevant details.

  Scenario: Logging a Stack Overflow error with critical severity level
    Given an exception is detected indicating a Stack Overflow
    When the exception is logged
    Then the severity level of the log should be 'Critical'
    And the error message should contain relevant details.

  Scenario: Detecting ANR incidents in JVM or CXX environments
    Given the application is running in either JVM or CXX environments
    And the system detects an ANR incident
    When the incident is logged
    Then the incident should be categorized as 'Unhandled Exception'

  Scenario: Validating unusual user metadata
    Given user metadata contains unusual string formats
    When user metadata is validated
    Then the validation should ensure integrity of payload data

  Scenario: Reviewing the most recent exception categorization
    Given the user requests to review the most recently recorded exception categorization
    When the request is processed
    Then the user should be allowed to review the categorization

  Scenario: Handling previously reported exceptions
    Given an exception has been reported previously
    When a new log entry is attempted for this exception
    Then the duplicate entry should be prevented and the existing report should be logged
