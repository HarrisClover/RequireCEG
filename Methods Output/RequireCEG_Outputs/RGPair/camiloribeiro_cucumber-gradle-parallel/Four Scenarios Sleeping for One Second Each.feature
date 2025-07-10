Feature: Four Scenarios Sleeping for One Second Each

  As a system administrator
  I want to simulate multiple scenarios running concurrently with a sleep operation
  So that I can validate the system's ability to handle simultaneous operations effectively

  Background:
    Given the system is initialized
    And it supports parallel processing of scenarios

  Scenario: Scenario 1: Sleep Operation
    Given the scenario is started
    When the system sleeps for 1 second
    Then the scenario completes after 1 second
    And the message 'Scenario 1 has completed after 1 second.' is logged

  Scenario: Scenario 2: Sleep Operation
    Given the scenario is started
    When the system sleeps for 1 second
    Then the scenario completes after 1 second
    And the message 'Scenario 2 has completed after 1 second.' is logged

  Scenario: Scenario 3: Sleep Operation
    Given the scenario is started
    When the system sleeps for 1 second
    Then the scenario completes after 1 second
    And the message 'Scenario 3 has completed after 1 second.' is logged

  Scenario: Scenario 4: Sleep Operation
    Given the scenario is started
    When the system sleeps for 1 second
    Then the scenario completes after 1 second
    And the message 'Scenario 4 has completed after 1 second.' is logged

  Scenario: All Scenarios Completion Check
    Given all scenarios have been initiated
    When the system checks if all scenarios have executed their sleep operations
    Then the status is confirmed as successful
    And the message 'All scenarios have executed their sleep operations.' is logged

  Scenario: Required Dependency Validation
    Given all scenarios have completed their sleep operations
    When the system verifies the completion messages
    Then it confirms 'All scenarios confirmed to have completed simultaneously.'
