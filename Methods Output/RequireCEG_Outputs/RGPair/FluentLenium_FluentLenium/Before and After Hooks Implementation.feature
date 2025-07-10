Feature: Before and After Hooks Implementation

  As a QA engineer
  I want to ensure that the WebDriver is initialized correctly before navigating between pages
  So that I can maintain the stability and consistency of the testing environment.

  Background:
    Given the WebDriver is not initialized
    And the test is tagged for WebDriver initialization

  Scenario: Scenario 1: Successful Navigation When WebDriver is Initialized
    Given the WebDriver is initialized correctly
    When the user clicks on the 'next page' button
    Then the user should navigate to the second page successfully
    And the WebDriver instance should be closed and state reset

  Scenario: Scenario 2: Navigation Fails When WebDriver is Not Initialized
    Given the WebDriver is not initialized
    When the user clicks on the 'next page' button
    Then the system should display an error message 'Navigation Failed: WebDriver not initialized'

  Scenario: Scenario 3: Navigation Blocked Due to Missing Tag
    Given the WebDriver is not initialized
    And the test is not tagged for WebDriver initialization
    When the user attempts to navigate without the appropriate tag
    Then the system should prevent navigation and display 'Navigation Blocked: WebDriver not initialized due to missing tag.'

  Scenario: Scenario 4: WebDriver Session State Lost
    Given the WebDriver is initialized
    And the test is tagged for WebDriver initialization
    When the user attempts to navigate but the WebDriver session state is lost
    Then the system should log 'WebDriver session state lost' and mark the test as failed

  Scenario Outline: Scenario Outline: WebDriver Session State Management
    Given the WebDriver is initialized <initialization>
    And the test is tagged <tag>
    When the user attempts to navigate to the next page
    Then the system should log 'WebDriver session state lost' if navigation fails
    Examples:
      | initialization | tag |
      | initialized | tagged |
      | not initialized | not tagged |
      | initialized | not tagged |
      | not initialized | tagged |

