Feature: Seamless Page Transition with Wait Hooks

  As a web application user
  I want to navigate smoothly between pages without delays
  So that I can have a responsive and efficient user experience

  Background:
    Given the WebDriver is in a null state
    And the navigation button is visible and clickable

  Scenario: Scenario 1: Successful Page Transition
    Given the user clicks the 'next page' button
    And there are no delays in the transition
    And wait hooks are implemented to manage the state of the WebDriver instances
    When the navigation occurs
    Then the user should be on the second page
    And the navigation from the first page to the second page is managed successfully

  Scenario: Scenario 2: WebDriver State Management
    Given the WebDriver has a previous session state
    When the user navigates to the second page
    Then the state of the WebDriver is correctly maintained

  Scenario: Scenario 3: WebDriver Tag Verification
    Given the WebDriver is appropriately tagged
    When the user initiates the navigation
    Then the expected behaviors during the transition are validated

  Scenario Outline: Scenario Outline: Validate Page Transition Performance
    Given the WebDriver is initialized correctly with state <initial-state>
    And the 'next page' button is activated
    When the user clicks the navigation button
    Then the response time should be less than <max-time>
    Examples:
      | initial-state | max-time |
      | null | 200ms |
      | valid | 150ms |
      | invalid | 300ms |

