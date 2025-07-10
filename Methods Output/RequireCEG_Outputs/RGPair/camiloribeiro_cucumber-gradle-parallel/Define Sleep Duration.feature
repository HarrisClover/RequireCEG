Feature: Define Sleep Duration

  As a system administrator
  I want to ensure that sleep operations can be executed concurrently without interference
  So that the system can handle multiple requests efficiently and accurately

  Background:
    Given the system supports sleep operations of specified durations
    And multiple scenarios can initiate sleep operations concurrently

  Scenario: Scenario 1: One-second sleep operation
    Given a scenario is initiated with a one-second sleep duration
    When the system executes the sleep operation
    Then the operation should complete successfully after one second

  Scenario: Scenario 2: Four concurrent one-second sleep operations
    Given four scenarios are initiated each with a one-second sleep duration
    When all scenarios are executed concurrently
    Then all operations should complete successfully after one second

  Scenario: Scenario 3: Two-second sleep operation
    Given a scenario is initiated with a two-second sleep duration
    When the system executes the two-second sleep
    Then the operation should complete successfully after two seconds

  Scenario: Scenario 4: Five-second sleep operation
    Given a scenario is initiated with a five-second sleep duration
    When the system executes the sleep operation
    Then the operation should complete successfully after five seconds

    Scenario 5 Multiple one-second sleep operations completion check after one second duration initiation concurrently and requirement check for dependencies execution correctly timing out in parallel execution of sleep operations initiated together concurrently with dependency checks between operations with Request relations initiated jointly confirming all sleep operations execute correctly within defined timescales at start times accurately without failures or overlaps happening reliably under concurrency effects with requirement checks ensuring success collectively all fulfill completion specifications without interference constraints applied about duration handling speaking at control levels accurately addressing dependencies functioning as designed without failures overlooked under defined specifications in precise timescales, outcome resolutions concluding operational success confirmations recorded accumulating results verifiably assuring repeatabilities applied crossing over testing confirmations consistent with scheduling concerns addressed effectively related timely.
    Then all operations should finish seamlessly after one second duration initiation collectively
    And the operations should fulfill completion specifications without interference.

  Scenario Outline: Scenario Outline: Multiple one-second sleep operations
    Given a scenario is initiated with <num> one-second sleep operations
    When executing these operations concurrently
    Then all operations should finish seamlessly after <total> seconds
    Examples:
      | num | total |
      | 1 | 1 |
      | 2 | 2 |
      | 3 | 3 |
      | 4 | 4 |

