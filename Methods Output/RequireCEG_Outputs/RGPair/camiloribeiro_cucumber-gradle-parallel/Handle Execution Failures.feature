Feature: Handle Execution Failures

  As a system administrator
  I want to ensure reliable execution of scenarios with error handling and retry mechanisms
  So that the system can provide continuous operation and maintain output integrity even in the face of failures

  Background:
    Given the system is operational
    And a maximum retry limit is configured

  Scenario: Scenario 1: Log Errors on Sleep Operation Failure
    Given a sleep operation is executed
    When the sleep operation fails to execute
    Then an error message is logged with the failure details
    And the specific scenario causing the failure is identified

  Scenario: Scenario 2: Alert on Sleep Operation Timeout
    Given a sleep operation is in progress
    When the operation exceeds the expected duration
    Then an alert is sent to the administrator
    And the alert states which scenario has timed out

  Scenario: Scenario 3: Continue Execution After Failure
    Given one scenario in a batch fails due to sleep operation
    When the next scenario execution starts
    Then the successful scenarios continue to execution
    And the status of the failed scenario is logged

  Scenario: Scenario 4: Automatic Retry of Sleep Operation
    Given a sleep operation is required for scenario A
    And the number of attempts is 3
    When the sleep operation fails
    Then the system automatically retries up to 3 attempts
    And if retries are exhausted, the scenario is marked as failed

  Scenario: Scenario 5: Automatically Retry Sleep Operation with Multiple Scenarios
    Given a sleep operation is required for scenario B
    And the number of attempts is 5
    When the sleep operation fails
    Then the system automatically retries up to 5 attempts
    And if retries are exhausted, the scenario is marked as failed

  Scenario: Scenario 6: Automatically Retry Sleep Operation with Limited Attempts
    Given a sleep operation is required for scenario C
    And the number of attempts is 2
    When the sleep operation fails
    Then the system automatically retries up to 2 attempts
    And if retries are exhausted, the scenario is marked as failed
