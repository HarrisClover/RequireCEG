Feature: State Sharing Between Steps

  As a QA engineer
  I want to maintain the state of the WebDriver across multiple page transitions
  So that the test execution remains reliable and provides a cohesive user experience

  Background:
    Given a WebDriver instance is initialized
    And the test requires state persistence

  Scenario: Scenario 1: WebDriver is preserved through page transitions
    Given the WebDriver is not null before the transition
    When the user transitions from the first page to the second page
    Then the existing WebDriver instance should be carried over
    And the state of the WebDriver must remain intact

  Scenario: Scenario 2: WebDriver is not reinstantiated
    Given the WebDriver instance is null before the transition
    When the user transitions to the next page
    Then the WebDriver must not be reinstantiated

  Scenario: Scenario 3: Confirm WebDriver state integrity
    Given the integrity of the WebDriver state is validated upon transition
    When the user transitions from the first page to the second page
    Then the integrity of the WebDriver state must be confirmed to uphold test reliability

  Scenario Outline: Scenario Outline: Validating state across multiple scenarios
    Given the WebDriver state is <webdriver-state>
    And there are <number> classes utilizing the WebDriver
    When the user performs <action> across <number> pages
    Then the WebDriver state should be <expected-state>
    Examples:
      | webdriver-state | number | action | expected-state |
      | initialized | 2 | navigate | active |
      | active | 3 | perform actions | active |
      | null | 1 | attempt navigation | should not transition |

