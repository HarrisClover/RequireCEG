Feature: Initialize Test Environment

  As a test engineer
  I want to execute multiple scenarios in parallel without interference
  So that I can ensure the system's reliability and performance under concurrent loads

  Background:
    Given the test environment is initialized
    And multiple scenarios can be executed independently

  Scenario: Scenario 1: Cumulative Sleep Duration Demonstration
    Given four scenarios invoke a sleep command for one second each
    When the scenarios are executed in parallel
    Then the total recorded sleep duration should be four seconds
    And each scenario sleeps without interfering with others

  Scenario: Scenario 2: Single Scenario Sleep Duration
    Given a single scenario invokes a sleep command for two seconds
    When the scenario is executed
    Then the expected sleep duration in the logs should reflect two seconds

  Scenario: Scenario 3: Multiple Single Scenarios with Different Sleep Durations
    Given two single scenarios invoke sleep commands for two seconds and five seconds respectively
    When both scenarios are executed
    Then the total recorded sleep duration should be seven seconds

  Scenario: Scenario 4: No Concurrency Issues
    Given multiple scenarios invoke sleep commands concurrently
    When the scenarios are executed in parallel
    Then no concurrency issues should arise during sleep operations

  Scenario: Scenario 5: System Confirmation of Serial Resource Access
    Given a scenario invokes a sleep command for five seconds
    When the scenario is executed
    Then the system should confirm serial resource access

  Scenario: Scenario 6: System Confirmation of Thread-Safety
    Given two scenarios run concurrently with varying sleep durations
    When the scenarios are executed
    Then the system should confirm thread-safety

  Scenario Outline: Scenario Outline: Parallel Sleep Execution
    Given a scenario invokes a sleep command for <duration> seconds
    When the scenario is executed in parallel with others
    Then the expected sleep duration should be <duration> seconds
    Examples:
      | duration |
      | 1 |
      | 2 |
      | 3 |
      | 5 |

