Feature: Parallel Scenario Execution Verification
  As a test engineer,
  I want to verify that scenarios can run concurrently using sleep operations
  So that I can confirm the parallel execution capability of the test framework or system.

  Background:
    Given the system is configured for parallel test execution

  # These four scenarios are intended to run in parallel.
  # If executed sequentially, they would take ~4 seconds.
  # If executed in parallel, they should complete in ~1 second.
  Scenario: Parallel Execution - Sleep 1 Second (Instance A)
    When the scenario sleeps for 1 second
    Then the scenario execution completes successfully

  Scenario: Parallel Execution - Sleep 1 Second (Instance B)
    When the scenario sleeps for 1 second
    Then the scenario execution completes successfully

  Scenario: Parallel Execution - Sleep 1 Second (Instance C)
    When the scenario sleeps for 1 second
    Then the scenario execution completes successfully

  Scenario: Parallel Execution - Sleep 1 Second (Instance D)
    When the scenario sleeps for 1 second
    Then the scenario execution completes successfully

  # This scenario runs alongside the others.
  Scenario: Parallel Execution - Sleep 2 Seconds
    When the scenario sleeps for 2 seconds
    Then the scenario execution completes successfully

  # This scenario also runs alongside the others.
  # The total execution time for the feature (when run in parallel)
  # should be dictated by the longest running scenario (~5 seconds).
  Scenario: Parallel Execution - Sleep 5 Seconds
    When the scenario sleeps for 5 seconds
    Then the scenario execution completes successfully