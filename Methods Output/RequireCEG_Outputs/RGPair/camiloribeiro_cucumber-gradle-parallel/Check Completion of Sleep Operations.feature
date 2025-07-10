Feature: Check Completion of Sleep Operations

  As a system administrator
  I want the system to efficiently manage sleep operations
  So that I can ensure all operations complete accurately and timely without blocking processes

  Background:
    Given the system is capable of asynchronous execution
    And the system can prioritize sleep durations without blocking

  Scenario: Scenario 1: Four One-Second Sleep Operations
    Given four one-second sleep requests are initiated
    When the system processes the sleep requests
    Then all operations should complete in four seconds
    And sleep operations should not block other processes

  Scenario: Scenario 2: Concurrent Two-Second Sleep Request
    Given three one-second sleep requests and one two-second sleep request are initiated
    When the system processes the sleep requests
    Then all operations should complete in two seconds
    And the longer two-second sleep request should finish first

  Scenario: Scenario 3: Five-Second Sleep Request
    Given four one-second sleep requests and one five-second sleep request are initiated
    When the system processes the sleep requests
    Then all operations should complete with the five-second request finishing last

  Scenario: Scenario 4: Testing Sleep Operation Timing
    Given the system is handling multiple sleep operations
    When a sleep operation for 2 seconds is initiated
    Then the operation for 2 seconds should complete within the specified time

  Scenario Outline: Scenario Outline: Sleep Request Timing
    Given the system is handling multiple sleep operations
    And the sleep requests are of length <length>
    When the sleep operation for <duration> is initiated
    Then the operation for <duration> should complete within the specified time
    Examples:
      | length | duration |
      | 1 second | 1 second |
      | 1 second | 2 seconds |
      | 1 second | 5 seconds |

