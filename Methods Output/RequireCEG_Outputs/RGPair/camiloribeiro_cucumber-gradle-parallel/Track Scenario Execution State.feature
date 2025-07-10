Feature: Track Scenario Execution State

  As a system administrator
  I want to manage the execution state of scenarios, ensuring that their start and completion times are tracked accurately
  So that I can confirm that multiple scenarios run concurrently without interfering with one another and that completion times reflect actual execution durations

  Background:
    Given the system is capable of executing multiple scenarios simultaneously
    And the system can monitor start and completion times for each scenario

  Scenario: Scenario 1: Four simultaneous scenarios executing sleep
    Given four scenarios are initiated each with a sleep operation for one second
    When all four scenarios are executed
    Then the total elapsed time should be four seconds
    And each scenario should finish concurrently

  Scenario: Scenario 2: Single scenario executing extended sleep
    Given one scenario initiates a sleep operation for two seconds
    When the scenario is executed
    Then the total elapsed time should reflect precisely two seconds

  Scenario: Scenario 3: Single scenario executing longer sleep
    Given one scenario initiates a sleep operation for five seconds
    When the scenario is executed
    Then the system should track the completion time as five seconds

  Scenario: Scenario 4: Multiple scenarios executing with concurrency
    Given multiple scenarios are allowed to operate concurrently without side effects
    When all operations complete
    Then status reports for each scenario confirm no undesired side effects during parallel execution

  Scenario: Scenario 5: Tracking total elapsed time
    Given four scenarios execute one-second sleeps and one scenario executes a two-second sleep
    When all scenarios are initiated simultaneously
    Then the completion time should accurately reflect the maximum sleep duration
