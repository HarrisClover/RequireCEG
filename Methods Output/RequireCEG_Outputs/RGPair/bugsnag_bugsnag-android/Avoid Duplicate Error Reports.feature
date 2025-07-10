Feature: Avoid Duplicate Error Reports

  As a system administrator
  I want to suppress duplicate error reports
  So that we can maintain a clean and efficient error reporting system

  Background:
    Given the system has a logging mechanism
    And the Bugsnag notifier is initialized

  Scenario: Scenario 1: Report Duplicate Error
    Given an error of class 'NullReferenceException' with message 'Object reference not set to an instance of an object'
    And a previous report for the same error exists
    When the system encounters the same error again
    Then the report should be suppressed
    And no new report should be generated

  Scenario: Scenario 2: Update Severity Level
    Given an error has been reported with severity 'Low'
    When an error of the same class and message occurs with severity 'High'
    Then the existing report should be updated
    And the new severity level should be indicated

  Scenario: Scenario 3: Track Error Severity Changes
    Given an unhandled exception occurs with message 'Unhandled exception occurred'
    And a previous report exists with severity 'Medium'
    When the same error occurs with severity 'Critical'
    Then the existing report should be updated
    And the new severity level should be indicated

  Scenario Outline: Scenario Outline: Track Errors Across Sessions
    Given an unhandled exception occurs with message '<error-message>'
    And the current session has user ID '<user-id>' and device '<device>'
    When the same error occurs within the session
    Then no duplicate error report should be generated
    Examples:
      | error-message | user-id | device |
      | Database connection failed | User123 | DeviceA |
      | File not found | User456 | DeviceB |
      | Access denied | User789 | DeviceC |

