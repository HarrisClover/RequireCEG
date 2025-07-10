Feature: Capture User Information

  As a system administrator
  I want to capture user information when an unhandled exception or crash occurs
  So that I can diagnose issues effectively and enhance system stability

  Background:
    Given a user is interacting with the application
    And the system is monitoring for exceptions

  Scenario: Logged in user encounters an unhandled exception
    Given a user is logged into the system
    When an unhandled exception occurs
    Then the system captures identifiable user information
    And includes user ID and session ID in the error report

  Scenario: Non-logged in user faces a native crash
    Given a user is not logged into the system
    When a native crash occurs
    Then the system gathers non-identifiable device metrics
    And includes device type and operating system version in the error report

  Scenario: User input contains unusual strings
    Given the user input includes unusual strings
    When the application processes the input
    Then the application remains stable and uninterrupted
    And handles the input without crashing

  Scenario: Persisted user information during an unhandled exception
    Given user information is persisted across sessions
    When an unhandled exception occurs
    Then the error payload is enriched with user information
    And avoids duplication of similar user details

  Scenario: Logging state during a null pointer dereference
    Given the application encounters a null pointer dereference
    When this crash occurs
    Then the system logs the user's state at the time of the crash
    And captures relevant context for debugging purposes

  Scenario Outline: Duplicate crash report filtering
    Given multiple instances of the same crash occur
    When the system detects these crashes
    Then only the first occurrence with enriched user details is retained
    And earlier duplicates are filtered out
    Examples:
      | Crash Type | Occurrence | Retained Report |
      | Null Pointer Dereference | 1 | Reported with user details |
      | Array Index Out of Bounds | 2 | Reported with user details |
      | Null Pointer Dereference | 3 | Ignored |
      | Network Timeout | 1 | Reported with device metrics |

