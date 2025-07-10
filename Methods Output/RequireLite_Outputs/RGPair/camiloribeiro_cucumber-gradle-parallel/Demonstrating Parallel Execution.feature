Feature: Demonstrating Parallel Execution

  As a system tester
  I want to validate the system's ability to perform multiple scenarios concurrently
  So that I can ensure that operations do not interfere with each other's execution

  Background:
    Given the system is in a predefined state
    And multiple scenarios are prepared for execution

  Scenario: Scenario 1: Sleep for 1 Second
    Given the system is ready to execute sleep operations
    When the scenario sleeps for 1 second
    Then the operation should complete within the expected duration less than or equal to 1 second

  Scenario: Scenario 2: Sleep for 2 Seconds
    Given the system is ready to execute sleep operations
    When the scenario sleeps for 2 seconds
    Then the operation should complete within the expected duration less than or equal to 2 seconds

  Scenario: Scenario 3: Sleep for 5 Seconds
    Given the system is ready to execute sleep operations
    When the scenario sleeps for 5 seconds
    Then the operation should complete within the expected duration less than or equal to 5 seconds

  Scenario: Scenario 4: Four Scenarios Sleeping for 1 Second Each
    Given the system is ready to execute sleep operations with no shared resource conflicts
    When four scenarios sleep for 1 second each concurrently
    Then the total duration of the operation should be less than or equal to 1 second

  Scenario: Scenario 5: Repeated Sleep for N Seconds
    Given the system is ready to execute repeated sleep scenarios
    When the scenario sleeps for 1 second a specified number of times
    Then all operations should complete without overlapping effects

  Scenario Outline: Scenario Outline: Sleep for Multiple Durations
    Given the system is ready to execute sleep operations for <duration> seconds
    When the scenario sleeps for <duration> seconds
    Then the operation should complete within the expected duration less than or equal to <duration> seconds
    Examples:
      | duration |
      | 1 |
      | 2 |
      | 5 |

