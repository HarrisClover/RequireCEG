Feature: Validate Concurrent Execution

  As a system architect
  I want to ensure that multiple scenarios can run concurrently without blocking
  So that the system maintains performance and responsiveness

  Background:
    Given the system is in a predefined state
    And five scenarios are designed to sleep for varying durations

  Scenario: Scenario 1: Four 1-Second Sleep Scenarios
    Given four scenarios each sleep for one second
    When all four scenarios are executed in parallel
    Then the total execution duration should be exactly four seconds
    And all sleep operations must complete successfully

  Scenario: Scenario 2: One 2-Second Sleep Scenario
    Given four scenarios sleep for one second and one scenario sleeps for two seconds
    When all scenarios are executed concurrently
    Then the total execution duration should not exceed six seconds
    And all sleep operations must complete successfully

  Scenario: Scenario 3: One 5-Second Sleep Scenario
    Given four scenarios sleep for one second and one scenario sleeps for five seconds
    When all scenarios are executed concurrently
    Then the total execution duration should not exceed nine seconds
    And all sleep operations must complete successfully

  Scenario: Scenario 4: Repeated One-Second Sleep Scenarios
    Given a repetitive one-second sleep scenario is run in parallel with others
    When the scenarios complete their sleep
    Then all sleep operations must complete successfully
    And proper order of execution is maintained

  Scenario: Scenario 5: Validate Total Execution Duration
    Given four one-second sleep scenarios and one two-second sleep scenario
    When the total execution time is calculated
    Then the total execution duration must not exceed six seconds

  Scenario: Scenario 6: Validate Total Execution with Five-Second Sleep
    Given four one-second sleep scenarios and one five-second sleep scenario
    When the total execution time is calculated
    Then the total execution duration must not exceed nine seconds
