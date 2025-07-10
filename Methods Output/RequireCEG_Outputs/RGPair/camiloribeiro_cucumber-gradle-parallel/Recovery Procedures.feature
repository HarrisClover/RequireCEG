Feature: Recovery Procedures

  As a system administrator
  I want to monitor and recover scenarios that do not complete their designated sleep time
  So that the system maintains operational integrity and resilience in concurrent execution

  Background:
    Given there are multiple scenarios running concurrently
    And each scenario has a designated sleep time

  Scenario: Scenario 1: Monitoring Completion Times
    Given a scenario designated to sleep for one second
    When the scenario completes its sleep
    Then the system should log the completion time
    And ensure it does not affect the execution of other scenarios

  Scenario: Scenario 2: Handling Two-Second Sleeps
    Given a scenario designated to sleep for two seconds
    When multiple other scenarios perform their one-second sleeps
    Then the two-second scenario should complete concurrently
    And its completion should not delay the one-second scenarios

  Scenario: Scenario 3: Managing Five-Second Sleeps
    Given a scenario designated to sleep for five seconds
    When the scenario initiates its sleep
    Then the system must track the overall completion time
    And validate that no other scenarios are delayed

  Scenario: Scenario 4: Monitoring Execution and Adding Recovery Procedures
    Given multiple scenarios are executing, including one that fails to complete its designated sleep time
    When the system detects that any scenario fails to complete its designated sleep time
    Then the system initiates recovery procedures for failed scenarios
    And logs specific failure messages for further analysis

  Scenario Outline: Scenario Outline: Timeout Recovery Procedure
    Given a scenario intended to sleep for '<sleep-time>' seconds
    And it fails to complete within the expected duration
    When the system detects a timeout
    Then initiate a recovery procedure to reset the scenario
    And log a failure message for further analysis
    Examples:
      | sleep-time |
      | 1 |
      | 2 |
      | 5 |

