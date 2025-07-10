Feature: Performance with Step Definitions of Varying Types

  As a test automation engineer
  I want to ensure seamless navigation and maintain performance during testing
  So that page transitions occur efficiently and the WebDriver is used optimally

  Background:
    Given the WebDriver is initialized only when necessary
    And the existing WebDriver state is maintained across multiple steps

  Scenario: Scenario 1: Navigate to Second Page
    Given a customer is on the first page
    When the customer clicks the 'next page' button
    Then the system should navigate to the second page seamlessly
    And the loading time should be managed efficiently

  Scenario: Scenario 2: WebDriver Initialization
    Given the WebDriver state is null
    When a test is executed requiring a WebDriver
    Then the WebDriver should be initialized only once

  Scenario: Scenario 3: Maintain WebDriver State
    Given the WebDriver state is not null
    When the next step in the test execution is executed
    Then the WebDriver state should be maintained across multiple steps

  Scenario: Scenario 4: Efficient Tag Annotations
    Given the tag annotations are correctly utilized
    And the test execution is occurring
    When the application is tested
    Then wait hooks manage loading time efficiently

  Scenario: Scenario 5: Consistent Step Definitions
    Given single-class step definitions are used
    And multi-class step definitions are used
    When the test execution begins
    Then consistent performance is exhibited during test execution

  Scenario: Scenario 6: Efficient Page Transition
    Given the loading time does not exceed the expected timeframe
    When the user navigates through different pages
    Then navigation functions should be reliable and efficient throughout the application
