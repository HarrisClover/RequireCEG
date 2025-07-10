Feature: Not Found Page Handling
  As a user
  I want to see a 'Not Found' page when I navigate to an invalid URL
  So that I know the requested page doesn't exist.

  Scenario: Accessing an Invalid Path
    Given the user attempts to navigate to an invalid path like "/non-existent-page"
    Then the user should be presented with a "Not Found" page
    And the "Not Found" page should indicate that the requested resource could not be found