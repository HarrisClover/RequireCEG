Feature: Movie Filtering and Sorting

  As a parent concerned about movie ratings
  I want to filter and display a list of movies based on their MPAA ratings
  So that I can easily browse appropriate films for my family

  Background:
    Given the application has a database of movies with details such as title, rating, and release date
    And the default view presents movies according to selected filters and sorting preferences

  Scenario: Viewing movies with PG rating
    Given the user selects the 'PG' checkbox
    When the user views the movie list
    Then only movies with 'PG' ratings should be displayed

  Scenario: Viewing movies with R rating
    Given the user selects the 'R' checkbox
    When the user views the movie list
    Then only movies with 'R' ratings should be displayed

  Scenario: Viewing movies without any rating filters
    Given no checkboxes are selected
    When the user views the movie list
    Then all available movies should be displayed

  Scenario: Applying multiple filters mutually exclusive
    Given the user selects both 'PG' and 'R' checkboxes
    When the user views the movie list
    Then an error message should be displayed indicating that only one filter can be applied at a time

  Scenario: Applying an invalid filter
    Given the user selects an invalid filter
    When the user views the movie list
    Then an error message should be displayed indicating invalid filter selection

  Scenario: Viewing movie list when database is empty
    Given the database has no movies
    When the user views the movie list
    Then a message should be displayed indicating that no movies are available

  Scenario Outline: Sorting movies by criteria
    Given the movies are available in the database with their details
    When the user requests to sort the movie list
    Then the movies should be sorted by <sort-criteria>
    And the user has selected <sort-criteria>
    Examples:
      | sort-criteria | expected-order |
      | title | alphabetical order |
      | release date | chronological order |
      | rating | highest to lowest |
      | rating | lowest to highest |

