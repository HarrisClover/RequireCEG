Feature: Log Errors for Analysis

  As a system administrator
  I want to monitor the execution of test scenarios and log errors appropriately
  So that I can ensure efficient troubleshooting and maintain system integrity

  Background:
    Given the system is configured to log all execution events
    And the expected execution duration is predefined

  Scenario: Scenario 1: Log entry for a failed scenario
    Given a scenario fails during execution
    When the failure is detected by the system
    Then a log entry is created stating 'Execution failed for scenario X'
    And the log includes a timestamp for reference

  Scenario: Scenario 2: Log warning for exceeded execution time
    Given the cumulative execution time exceeds the expected duration
    When the system detects the time overflow
    Then a warning is logged as 'Total execution time exceeded expected duration: actual_time'
    And the log includes a timestamp

  Scenario: Scenario 3: Log critical error for parallel execution failure
    Given the parallel execution functionality fails
    And the system detects side effects impacting execution
    When the failure is confirmed by the system
    Then a critical error log states 'Parallel execution failed due to undesired side effects.'

  Scenario: Scenario 4: Log informational message for successful execution
    Given all scenarios execute without any issues
    When the execution completes
    Then an informational log states 'All scenarios executed successfully without errors'
    And the log includes a timestamp

  Scenario: Scenario 5: Log entry verification for execution failure
    Given a scenario fails during execution
    When the failure is confirmed by the system
    Then a log entry is created stating 'Execution failed for scenario X' with a timestamp
    And a subsequent verification confirms the log entry is present

  Scenario: Scenario 6: Log entry verification for exceeded execution time
    Given the cumulative execution time exceeds the expected duration
    When the system detects the time overflow
    Then a warning is logged as 'Total execution time exceeded expected duration: actual_time'
    And a subsequent verification confirms the log entry is present with proper timestamp
