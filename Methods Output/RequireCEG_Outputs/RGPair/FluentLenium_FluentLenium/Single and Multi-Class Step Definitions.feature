Feature: Single and Multi-Class Step Definitions

  As a web application user
  I want to navigate through pages without initiating a new WebDriver instance
  So that I can have a seamless and efficient user experience while testing

  Background:
    Given a WebDriver instance is instantiated correctly
    And the resources are prepared for use in a test environment

  Scenario: Scenario 1: Seamless Page Transition
    Given the user is on the first page
    When the user clicks the 'next page' button
    Then the application should transition to the second page
    And the same WebDriver instance should be maintained without interruption

  Scenario: Scenario 2: Multi-Class Step Definition Usage
    Given the application is in a valid state
    When the user navigates through different classes
    Then the singular WebDriver instance should remain active across all class steps

  Scenario: Scenario 3: No New WebDriver Instance
    Given the user is on the first page
    When the user attempts to navigate to the second page
    Then no new WebDriver instance should be initiated during the transition

  Scenario: Scenario 4: Effective Wait Management Confirmation
    Given the page takes an arbitrary amount of time to load
    When the user performs actions while waiting for the page to load
    Then the loading finishes smoothly without loss of context
    And resources are cleaned up appropriately during the After hook

  Scenario Outline: Scenario Outline: Efficient Wait Management
    Given the page takes an arbitrary amount of time to load, simulating <loading-time>
    When the user performs actions while waiting for the page to load
    Then the loading finishes smoothly without loss of context
    Examples:
      | loading-time | user-action |
      | 2 seconds | clicks a button |
      | 5 seconds | scrolls the page |
      | 10 seconds | fills a form |

