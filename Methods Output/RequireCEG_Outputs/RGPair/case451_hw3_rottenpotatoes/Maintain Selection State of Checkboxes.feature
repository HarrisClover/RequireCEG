Feature: Maintain Selection State of Checkboxes

  As a moviegoer
  I want to filter movies based on rating selections
  So that I can quickly find suitable movies to watch

  Background:
    Given the user has previously selected checkboxes
    And the user is on the movie selection page

  Scenario: Scenario 1: Filter by PG Rating
    Given the 'PG' checkbox is selected
    When the user views the movie list
    Then only movies rated 'PG' should be displayed

  Scenario: Scenario 2: Filter by R Rating
    Given the 'R' checkbox is selected
    When the user views the movie list
    Then only movies rated 'R' should be displayed

  Scenario: Scenario 3: Filter by Both Ratings
    Given both 'PG' and 'R' checkboxes are selected
    When the user views the movie list
    Then movies rated 'PG' or 'R' should be displayed

  Scenario: Scenario 4: No Filters Selected
    Given neither the 'PG' nor 'R' checkbox is selected
    When the user views the movie list
    Then all available movies in the database should be displayed

  Scenario: Scenario 5: Checkbox Selection State on Refresh
    Given the 'PG' checkbox is selected
    And the page is refreshed
    When the user returns to the movie selection page
    Then the 'PG' checkbox should remain checked

  Scenario: Scenario 6: Checkbox Selection State on Refresh
    Given the 'R' checkbox is selected
    And the page is refreshed
    When the user returns to the movie selection page
    Then the 'R' checkbox should remain checked

  Scenario: Scenario 7: Both Checkboxes Selection State on Refresh
    Given both 'PG' and 'R' checkboxes are selected
    And the page is refreshed
    When the user returns to the movie selection page
    Then both 'PG' and 'R' checkboxes should remain checked

  Scenario: Scenario 8: No Checkbox Selection State on Refresh
    Given neither the 'PG' nor 'R' checkbox is selected
    And the page is refreshed
    When the user returns to the movie selection page
    Then both 'PG' and 'R' checkboxes should remain unchecked
