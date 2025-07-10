Feature: User Interaction with Homerunner, Gmail, and Wikipedia
  As a user,
  I want to interact with the Homerunner platform, Gmail, and Wikipedia
  So that I can complete tasks like logging in, browsing, and searching seamlessly.

  Scenario: Logging in to Homerunner and Accessing Homepage
    Given the user is on the Homerunner platform
    When the user clicks the 'Get Started' button
    Then the user should be redirected to the homepage
    And the user should be able to switch windows

  Scenario: Filling out the Homerunner Form
    Given the user is on the Homerunner form
    When the user enters their first name
    Then the family name field should not be presented

  Scenario: Logging into Gmail
    Given the user has valid Gmail credentials
    When the user logs in to Gmail
    Then the user should wait until the logout link appears

  Scenario: Refreshing the Page and Logging Out
    Given the user is logged into Gmail
    When the user refreshes the page
    Then the username input field should become visible again
    When the user logs out
    Then the user should be able to log back into Gmail with the same credentials

  Scenario: Searching on Wikipedia
    Given the user is on the Wikipedia homepage
    When the user selects a language from the dropdown
    And the user enters a search term
    And the user clicks the search button
    Then the system should wait briefly for search results
    When the user closes the browser
