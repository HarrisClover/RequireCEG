Feature: Managing Concurrent Scenarios Execution

  As a system administrator
  I want to manage the execution of multiple scenarios simultaneously without timing interference
  So that the system can maintain accurate processing times and ensure reliable parallel execution

  Background:
    Given the system is capable of executing multiple scenarios concurrently
    And the system implements sleep duration for scenarios

  Scenario: Scenario 1: Two-Second Sleep Execution
    Given a scenario that requires a sleep duration of two seconds
    And no interruptions from other scenarios during this period
    When the scenario execution starts
    Then the execution should complete exactly after two seconds
    And the system should log the timing accurately

  Scenario: Scenario 2: One-Second Sleep Execution
    Given multiple scenarios that require a sleep duration of one second are initiated
    When the one-second sleep scenarios are executed in parallel
    Then they should not interfere with the two-second sleep scenario's timing

  Scenario: Scenario 3: Validation of Timing
    Given the timer for the two-second scenario is running
    When the two-second scenario has completed its sleep duration
    Then the execution should confirm it completed exactly after two seconds
    And no additional delays have occurred during this execution

  Scenario: Scenario 4: Additional Delays Logging
    Given a scenario that requires a sleep duration of two seconds
    And additional delays have occurred during the execution
    When the execution is completed
    Then the system should log an error message indicating a failure in maintaining proper parallel processing capabilities
