Feature: System Time Management

  As a system administrator
  I want the system to manage time-based operations effectively
  So that concurrent scenarios execute without delays and maintain accurate timing

  Background:
    Given the system starts in a predefined initial state
    And the system can execute multiple scenarios concurrently

  Scenario: Scenario 1: One-Second Sleep Operations
    Given a single scenario requires a one-second sleep operation
    When the system executes the scenario
    Then the system suspends processes for one second
    And resumes normal operations after one second

  Scenario: Scenario 2: Parallel One-Second Sleep
    Given four scenarios each requiring a one-second sleep operation are executed in parallel
    When the system runs these scenarios
    Then all operations complete collectively after a total of one second
    And the system confirms its capability of parallel execution while managing time-based operations

  Scenario: Scenario 3: Two-Second Sleep Operations
    Given a single scenario requires a two-second sleep operation
    When the system executes the scenario
    Then the system suspends processes for two seconds
    And resumes normal operations after two seconds

  Scenario: Scenario 4: Five-Second Sleep Operations
    Given a single scenario requires a five-second sleep operation
    When the system executes the scenario
    Then the system suspends processes for five seconds
    And resumes normal operations after five seconds

  Scenario Outline: Scenario Outline: Parallel Sleep Operations
    Given the system is handling multiple scenarios that each sleep for <duration> seconds
    And the number of scenarios is <scenario-count>
    When the system executes these scenarios
    Then the total time for all scenarios to complete is <total-time> seconds
    Examples:
      | duration | scenario-count | total-time |
      | 1 | 4 | 1 |
      | 2 | 3 | 2 |
      | 5 | 2 | 5 |
      | 1 | 1 | 1 |

