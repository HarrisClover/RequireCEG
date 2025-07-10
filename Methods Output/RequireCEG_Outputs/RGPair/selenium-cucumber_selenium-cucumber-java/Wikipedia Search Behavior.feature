Feature: Wikipedia Search Behavior

  As a user not logged into Gmail
  I want to search Wikipedia smoothly
  So that I can find information easily

  Background:
    Given the user is not logged into Gmail

  Scenario: Performing a Search on Wikipedia
    When the user selects a language from the dropdown menu and enters a search term in the input field on Wikipedia
    Then the system provides a brief loading period after executing the search on Wikipedia

  Scenario: Closing Browser After Search
    When the user executes the search on Wikipedia
    Then the system allows the user to close the browser after the loading period
