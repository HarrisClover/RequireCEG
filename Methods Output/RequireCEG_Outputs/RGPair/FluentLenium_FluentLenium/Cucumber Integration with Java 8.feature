Feature: WebDriver Management for Navigation

  As a test automation engineer
  I want the system to manage the WebDriver state effectively
  So that I can ensure seamless navigation between pages during testing

  Background:
    Given the WebDriver instance is initialized
    And the system is set up to handle multiple test scenarios

  Scenario: Scenario 1: Initialize WebDriver and Navigate to Second Page
    Given the user clicks the 'next page' button
    And the WebDriver instance is initialized
    When the system navigates to the second page
    Then the navigation to the second page should be seamless
    And the WebDriver should maintain its state as initialized

  Scenario: Scenario 2: Attempt Navigation without Initialized WebDriver
    Given the user clicks the 'next page' button
    And the WebDriver instance is null
    When the system attempts to navigate to the second page
    Then the WebDriver state should remain null until the Before hook is executed

  Scenario: Scenario 3: Multi-Class Navigation Handling
    Given the user triggers a tagged test step
    And the WebDriver state is maintained across multiple steps
    When the testing scenarios involve multi-class step definitions
    Then the system should enforce a single driver per feature for multi-class step definitions
    And the WebDriver should trigger correctly based on how the test steps are tagged

  Scenario: Scenario 4: WebDriver State with Uninitialized Instance
    Given the user triggers a stepping sequence
    And the WebDriver state is not initialized
    When the system attempts to trigger the associated testing action
    Then the WebDriver state should remain null, and the navigation action should not occur
