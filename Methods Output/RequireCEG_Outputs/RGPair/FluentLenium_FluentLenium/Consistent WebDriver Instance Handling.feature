Feature: Consistent WebDriver Instance Handling

  As a test automation engineer
  I want to manage a single instance of WebDriver for all scenarios
  So that I can ensure reliable navigation and consistent state during testing

  Background:
    Given the WebDriver instance is initialized when the Before hook is executed only if it is currently null
    And if a WebDriver instance is already initialized, its state must be retained

  Scenario: Scenario 1: Initialize WebDriver Instance
    Given the WebDriver instance is null
    When the Before hook is executed
    Then a new WebDriver instance should be created
    And the state of the WebDriver should be ready for test scenarios

  Scenario: Scenario 2: Retain WebDriver State
    Given the WebDriver instance is already initialized
    When the Before hook is executed again
    Then the existing WebDriver instance should be retained

  Scenario: Scenario 3: Seamless Page Navigation
    Given the WebDriver instance is initialized
    When the 'next page' button is clicked
    Then the system should transition to the next page seamlessly
    And the wait hooks should manage loading time appropriately

  Scenario: Scenario 4: Multi-Class Step Definitions
    Given a WebDriver instance is shared across multiple classes
    When test scenarios are executed in those classes
    Then the state of the WebDriver must remain consistent throughout

  Scenario: Scenario 5: Handle Multiple WebDriver Instances
    Given multiple instances of the WebDriver are attempted to be created for the same feature
    When the system processes the request
    Then an error message should be generated indicating that only one WebDriver instance is allowed per feature

  Scenario Outline: Scenario Outline: Tagged Scenario Execution
    Given the system contains scenarios tagged for execution
    And there exists a current WebDriver instance
    When the tagged scenarios are executed
    Then the correct WebDriver instance should be launched
    And the state of the WebDriver must be preserved throughout the steps
    Examples:
      | tag | initial state |
      | tag1 | initialized |
      | tag2 | existing |
      | tag3 | shared |

