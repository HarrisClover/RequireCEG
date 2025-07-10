Feature: Capture Error Severity

  As a system administrator
  I want the system to categorize errors based on severity
  So that we can prioritize response and maintain system stability

  Background:
    Given the application is running
    And error logging mechanisms are in place

  Scenario: Scenario 1: Null Pointer Dereference Exception
    Given a null pointer dereference occurs
    When the application encounters this error
    Then the error severity should be marked as 'Critical'
    And the incident should be logged appropriately

  Scenario: Scenario 2: Stack Overflow Exception
    Given a stack overflow occurs
    When the application encounters this error
    Then the error severity should be marked as 'High'
    And the incident should be documented in the error log

  Scenario: Scenario 3: StrictMode Violations
    Given an exception related to StrictMode is thrown
    When the application detects this violation
    Then the error severity should be set as 'Medium'
    And the incident should be logged accordingly

  Scenario: Scenario 4: Handled Error
    Given an error is handled by the system
    When the application encounters a handled error scenario
    Then the error severity should be recorded as 'Low'
    And each handled error should be tagged for identification

  Scenario: Scenario 5: Duplicate Error Reporting
    Given an error has already been reported during the current session
    When the same error occurs again
    Then the duplicate error report should be suppressed
    And the structure of the error payload should remain intact

  Scenario Outline: Scenario Outline: Unusual User Data
    Given user data contains '<unexpected-string>'
    When the system processes the user input
    Then the error severity should be captured
    And the logging process should continue without interruption
    Examples:
      | unexpected-string |
      | some unexpected value |
      | another unusual entry |
      | malformed input |

