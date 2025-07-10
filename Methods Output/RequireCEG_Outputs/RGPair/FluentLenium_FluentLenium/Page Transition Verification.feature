Feature: Page Transition Verification

  As a user of the multi-page application
  I want to reliably navigate through the pages using the 'next page' button
  So that I can access the desired content without disruptions

  Background:
    Given the application is initiated
    And the WebDriver instance is null until properly tagged

  Scenario: Scenario 1: Navigate to second page
    Given the user is on the first page
    When the user clicks the 'next page' button
    Then the user should be taken to the second page
    And the WebDriver instance must be properly tagged

  Scenario: Scenario 2: Navigate to third page
    Given the user is on the second page
    When the user clicks the 'next page' button
    Then the user should be taken to the third page
    And the WebDriver instance must remain intact

  Scenario: Scenario 3: Attempt to go past last page
    Given the user is on the last page
    When the user clicks the 'next page' button
    Then the user should remain on the last page
    And there should be no page transition

  Scenario: Scenario 4: Ensure WebDriver is launched
    Given the WebDriver instance is null
    When the application is initiated
    Then the WebDriver should be launched and maintain its state

  Scenario Outline: Scenario Outline: WebDriver State Maintenance
    Given the WebDriver is properly launched and tagged
    And the user navigates to page <page-number>
    When the user goes back to the previous page
    Then the WebDriver's state should remain intact
    Examples:
      | page-number |
      | 2 |
      | 3 |
      | 4 |

