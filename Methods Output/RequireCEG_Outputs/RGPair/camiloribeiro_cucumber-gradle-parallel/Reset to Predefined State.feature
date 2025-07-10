Feature: Reset to Predefined State

  As a system administrator
  I want to reset the system to its original state after executing scenarios
  So that I can ensure the system is ready for new scenario executions without any residual effects from previous runs

  Background:
    Given the system is currently executing multiple scenarios with different sleep durations
    And all scenarios are capable of running in parallel

  Scenario: Scenario 1: Complete Single Sleep Scenario
    Given a scenario is initiated that requires a sleep of one second
    When the scenario is executed
    Then the scenario completes after one second
    And the system records a total elapsed time of one second

  Scenario: Scenario 2: Multiple One Second Sleep Scenarios
    Given four scenarios are initiated that each require a sleep of one second
    When the scenarios are executed concurrently
    Then the scenario execution completes after four seconds
    And the system confirms that all four scenarios completed simultaneously

  Scenario: Scenario 3: Two Second Sleep Scenario with One Second
    Given a scenario requires a sleep of two seconds alongside four one-second sleep scenarios
    When all scenarios are executed
    Then the system confirms the completion of the two-second scenario after two seconds
    And the one-second scenarios complete within the same timeframe

  Scenario: Scenario 4: Five Second Sleep Scenario with Others
    Given a scenario requires five seconds sleep while others are running
    When the scenario is executed with one and two-second sleep scenarios
    Then the system confirms the five-second scenario completes after five seconds
    And the two-second scenario completes after two seconds

  Scenario: Scenario 5: Single Reset Operation After Executions with Cancellation Confirmation and Requirements Verified
    Given the system has executed multiple scenarios causing state changes
    When a reset operation is initiated
    Then the system is restored to its predefined state
    And the system confirms that all previously initiated scenarios are cancelled

  Scenario: Scenario 6: Validating Not Conditions to Check for Effects Without Scenario Executions
    Given the system has not executed any scenarios prior to reset
    When the reset operation is checked
    Then the system confirms that no state changes have occurred
    And the system is in the original predefined state

  Scenario Outline: Scenario Outline: System Reset After Executions
    Given the system has executed multiple scenarios causing state changes
    When the reset operation is initiated
    Then the system is restored to its predefined state
    Examples:
      | operation | outcome |
      | reset operation | system returns to initial conditions |
      | execute multiple scenarios | previous states are cleared |

