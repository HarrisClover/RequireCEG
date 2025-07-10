Feature: Basic Navigation and WebDriver Management
  As a tester,
  I want to ensure that the system's navigation and WebDriver handling are functioning correctly
  So that the system provides a consistent and reliable user experience across all pages.

  Scenario Outline: Navigate through pages and manage WebDriver
    Given the user is on the first page
    And the WebDriver is initialized with null state
    When the user clicks on the 'next page' button
    Then the user should be taken to the second page
    And the WebDriver state should remain consistent
    And the WebDriver should be correctly initialized after each page load
    And the appropriate wait hooks should ensure the page transition is seamless

  Examples:
    | feature-test-case |
    | navigation |
