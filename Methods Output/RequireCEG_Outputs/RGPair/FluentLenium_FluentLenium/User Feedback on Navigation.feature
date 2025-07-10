Feature: User Feedback on Navigation

  As a user
  I want to navigate through pages smoothly and see feedback during loading
  So that I have a clear indication of my actions and the system’s response

  Background:
    Given the user is on the first page
    And the WebDriver is properly initialized

  Scenario: User navigates to the second page
    Given the user clicks the 'next page' button on the first page
    When the system processes the request
    Then the user should be directed to the second page
    And the loading message should display until the page transition is complete

  Scenario: User navigates to the third page
    Given the user clicks the 'next page' button on the second page
    When the system processes the request
    Then the user should be directed to the third page
    And the loading message should display until the page transition is complete

  Scenario: Loading message during navigation delay
    Given the user is on the second page
    When the user clicks the 'next page' button and there is a delay in navigation
    Then the loading message should persist until navigation is successful

  Scenario: Error when WebDriver is not initialized
    Given the WebDriver is not properly initialized
    When the user clicks the 'next page' button
    Then an error message should indicate 'WebDriver not initialized'

  Scenario: Consistent WebDriver instance
    Given multiple classes are defined for step definitions
    And the system maintains a single instance of WebDriver
    When the user performs multiple navigation actions across these classes
    Then the state should remain consistent without context loss

  Scenario: Indication of delay in navigation
    Given the user clicks the 'next page' button on the first page
    When there is a delay in navigation
    Then the system displays the message 'Loading...' until navigation is complete
