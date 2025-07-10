Feature: Capture Error Class

  As a developer
  I want to log specific error classes with their severity levels
  So that I can efficiently monitor and address application errors

  Background:
    Given a system capable of capturing errors from JVM and NDK code
    And the existence of user information for logging

  Scenario: Capture high severity - null pointer dereference
    Given an error class indicating a null pointer dereference
    When this error occurs
    Then the error should be logged with high severity
    And the user information should be included in the log

  Scenario: Capture critical severity - stack overflow
    Given an error class indicating a stack overflow condition
    When this error occurs
    Then the error should be logged with critical severity
    And the error class should be logged

  Scenario: Capture medium severity - StrictMode violation
    Given an occurrence of a StrictMode violation
    When this violation is detected
    Then the error should be logged with medium severity
    And the error class should be recorded as StrictModeViolation

  Scenario: Aggregate duplicate errors
    Given multiple instances of the same error class are detected
    When the system aggregates these errors
    Then only a single consolidated notification should be sent

  Scenario: Continue operation with unusual user strings
    Given user data contains strings deemed unusual
    When an error reporting occurs
    Then the system should continue to operate without disruption
    And the unusual strings must be logged

  Scenario: Capture ANR error
    Given an error class indicating an Application Not Responding (ANR) incident
    When this ANR occurs in either JVM or CXX
    Then the error class should be included in the log along with its severity

  Scenario: Log on application crash
    Given a native crash or unhandled exception occurs within the JVM or NDK code
    When the crash or exception happens
    Then the error must be logged with an associated breadcrumb

  Scenario: Log on ANR occurrence
    Given an Application Not Responding (ANR) occurs in the JVM or CXX
    When this event is detected
    Then the error class and relevant details should be captured

  Scenario Outline: Capture ANR error
    Given an error class indicating an Application Not Responding (ANR) incident
    When this ANR occurs in either JVM or CXX
    Then the error class should be included in the log along with its severity
    Examples:
      | error class | severity |
      | ANR-1 | high |
      | ANR-2 | critical |
      | ANR-3 | medium |

