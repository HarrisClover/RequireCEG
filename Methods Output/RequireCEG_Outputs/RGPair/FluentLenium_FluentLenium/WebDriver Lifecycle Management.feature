Feature: WebDriver Lifecycle Management

  As a test engineer
  I want to manage the lifecycle of the WebDriver instance
  So that the testing process is consistent and reliable across different scenarios

  Background:
    Given the user is on the first page of the application
    And the 'next page' button is displayed

  Scenario: Scenario 1: Initialize WebDriver after clicking next page
    Given the initial state of the WebDriver is null
    When the user clicks the 'next page' button
    Then the WebDriver instance should be created and configured
    And the system should navigate to the second page

  Scenario: Scenario 2: Maintain WebDriver instance across features
    Given the WebDriver has been initialized for the current feature
    When the user interacts with the pages of the application
    Then the same WebDriver instance should be used throughout the process
    And the WebDriver instance remains consistent throughout the process

  Scenario: Scenario 3: Validate WebDriver launch conditions
    Given the WebDriver is launched with the appropriate tags
    And wait hooks are implemented correctly
    When the user accesses the next page
    Then the navigation functionality should be operational without errors

  Scenario: Scenario 4: Confirm web navigation functionality
    Given the WebDriver instance is created and configured
    When the user clicks on navigation elements
    Then the navigation functionality should be confirmed operational without errors

  Scenario Outline: Scenario Outline: Validate WebDriver behavior during transitions
    Given the WebDriver is launched with the appropriate tags
    And wait hooks are implemented correctly
    When the user navigates from page <currentPage> to page <nextPage>
    Then the navigation functionality should be operational without errors
    Examples:
      | currentPage | nextPage |
      | 1 | 2 |
      | 2 | 3 |
      | 3 | 4 |

