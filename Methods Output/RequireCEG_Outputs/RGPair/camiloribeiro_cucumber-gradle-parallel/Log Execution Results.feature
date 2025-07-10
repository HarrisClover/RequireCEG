Feature: Log Execution Results

  As a system administrator
  I want to track the execution time of multiple scenarios running in parallel
  So that I can ensure the system performs efficiently and accurately logs durations

  Background:
    Given the system is configured to handle concurrent scenario executions
    And logging is enabled for tracking execution times

  Scenario: Scenario 1: Four Scenarios Running in Parallel
    Given four scenarios are initiated simultaneously
    When each scenario runs for one second
    Then the system logs a total duration of four seconds
    And each scenario is logged with its execution time of one second

  Scenario: Scenario 2: Single Scenario Sleeping for Two Seconds
    Given a scenario is executed that sleeps for two seconds
    When the scenario completes execution
    Then the system logs this duration as two seconds

  Scenario: Scenario 3: Single Scenario Sleeping for Five Seconds
    Given a scenario is executed that sleeps for five seconds
    When the scenario completes execution
    Then the system logs this duration as five seconds

  Scenario: Scenario 4: Multiple Scenarios Each Sleeping for One Second
    Given multiple scenarios are executed, each sleeping for one second
    When the scenarios complete execution
    Then the system logs each scenario as taking one second individually

  Scenario: Scenario 5: Ensuring Clarity in Logged Execution Times
    Given the system logs the execution times
    When all scenarios are completed
    Then the logged execution times are clear and accurate

  Scenario: Scenario 6: Total Duration Logged Accurately
    Given two scenarios are executed in parallel, one sleeping for two seconds and the other for three seconds
    When both scenarios complete execution
    Then the system logs a total duration of five seconds
    And the individual execution times are logged as two seconds and three seconds

  Scenario: Scenario 7: Restriction on System State During Execution
    Given there are ongoing scenario executions
    When a new scenario execution is initiated
    Then the predefined state of the system is maintained throughout the execution
    And no changes occur to the system state
