Feature: Navigation Functionality

  As a store owner
  I want to ensure basic navigation functionality across multiple pages
  So that the user experience is seamless and intuitive

  Background:
    Given the initial state of the WebDriver is null
    And the system is set up with appropriate Before and After hooks

  Scenario: Scenario 1: Navigate to the Second Page
    Given a user is on the first page
    When the user clicks on the 'next page' button
    Then the user should be redirected to the second page
    And the WebDriver state should be maintained as expected

  Scenario: Scenario 2: Verify Wait Handling
    Given the user is on a page that requires loading
    When the user attempts to interact with an element that is not immediately available
    Then the system should handle the wait effectively by showing a loading indicator until the element is available

  Scenario Outline: Scenario Outline: WebDriver State Management
    Given the user is logged in with <user-status>
    When the user interacts with the feature <feature-action>
    Then the WebDriver should maintain its state as <expected-state>
    And the WebDriver is launched with <launch-condition>
    Examples:
      | user-status | launch-condition | feature-action | expected-state |
      | active | valid | click on features | state maintained |
      | inactive | invalid | attempt to access features | state not maintained |
      | active | valid | navigate between pages | state successfully transitioned |
      | inactive | valid | attempt to navigate to features | state not transitioned |

