Feature: Parallel Sleep Execution
  As a system tester,
  I want to verify that multiple sleep operations can execute concurrently
  So that we can ensure the system’s ability to handle parallel scenarios without side effects

  Background:
    Given the system is initialized with a clean starting state

  # Scenarios that each perform a one-second sleep operation
  Scenario: Sleep operation 1 second - Instance 1
    Given the system is ready for sleep operation
    When the system sleeps for 1 second
    Then the sleep operation should complete successfully

  Scenario: Sleep operation 1 second - Instance 2
    Given the system is ready for sleep operation
    When the system sleeps for 1 second
    Then the sleep operation should complete successfully

  Scenario: Sleep operation 1 second - Instance 3
    Given the system is ready for sleep operation
    When the system sleeps for 1 second
    Then the sleep operation should complete successfully

  Scenario: Sleep operation 1 second - Instance 4
    Given the system is ready for sleep operation
    When the system sleeps for 1 second
    Then the sleep operation should complete successfully

  # Scenario with a two-second sleep operation
  Scenario: Sleep operation for 2 seconds
    Given the system is ready for sleep operation
    When the system sleeps for 2 seconds
    Then the sleep operation should complete successfully

  # Scenario with a five-second sleep operation
  Scenario: Sleep operation for 5 seconds
    Given the system is ready for sleep operation
    When the system sleeps for 5 seconds
    Then the sleep operation should complete successfully

  # Repeated scenario to confirm parallel execution with one-second sleeps
  Scenario Outline: Repetitive one-second sleep test
    Given the system is ready for sleep operation
    When the system sleeps for 1 second
    Then the sleep operation should complete successfully

    Examples:
      | repetition | 
      | 1          | 
      | 2          | 
      | 3          | 
