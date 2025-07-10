Feature: Null State Verification for WebDriver

  As a test automation engineer
  I want to ensure the WebDriver is correctly instantiated before use
  So that I can avoid null state errors when executing test scenarios

  Background:
    Given the user accesses the navigation feature for the first time
    And there has been no prior setup for the WebDriver

  Scenario: First access of the navigation feature
    Given the initial state of the WebDriver instance is null
    When the user performs a valid Before hook
    Then the WebDriver should be instantiated correctly
    And the state of the WebDriver should no longer be null

  Scenario: Navigating to the next page
    Given the WebDriver has been successfully instantiated
    When the user clicks on the 'next page' button
    Then the transition to the second page should occur seamlessly

  Scenario: Managing wait hooks during page transition
    Given the WebDriver is instantiated
    When the Before hook executes successfully
    Then the system manages wait hooks correctly during the page transition

  Scenario: Validating WebDriver consistency across multi-class definitions
    Given the WebDriver instance is initiated
    When the user interacts with multiple class step definitions
    Then the WebDriver instance must remain consistent across different classes
