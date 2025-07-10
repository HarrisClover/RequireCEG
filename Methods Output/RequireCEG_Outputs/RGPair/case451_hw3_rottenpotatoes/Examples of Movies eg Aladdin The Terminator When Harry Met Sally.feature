Feature: Movie Filtering and Sorting

  As a movie watcher
  I want to filter and sort movies based on my preferences
  So that I can easily find and watch the movies that meet my criteria

  Background:
    Given the movie database contains various movies with different MPAA ratings
    And the user has preferences for filtering and sorting

  Scenario: Scenario 1: No Checkbox Selected
    Given no checkboxes are selected for filtering
    When the user accesses the movie list
    Then the system retrieves and displays all movies in the database
    And the movies are displayed without regard to their MPAA ratings

  Scenario: Scenario 2: Filter for PG Movies
    Given the 'PG' checkbox is selected
    When the user accesses the movie list
    Then the system filters the movie list to show only 'PG' rated movies

  Scenario: Scenario 3: Filter for R Movies
    Given the 'R' checkbox is selected
    When the user accesses the movie list
    Then the system filters the movie list to show only 'R' rated movies

  Scenario: Scenario 4: Filter for Both PG and R Movies
    Given both the 'PG' and 'R' checkboxes are selected
    When the user accesses the movie list
    Then the system displays movies that fit both 'PG' and 'R' ratings simultaneously

  Scenario: Scenario 5: Sort Movies by Title
    Given movies are displayed on the screen
    When the user chooses to sort movies by title
    Then the system sorts the movies alphabetically by title

  Scenario: Scenario 6: Sort Movies by Release Date
    Given movies are displayed on the screen
    When the user chooses to sort movies by release date
    Then the system sorts the movies in chronological order by release date

  Scenario: Scenario 7: Initial Access with Active Filters
    Given the user accesses the RottenPotatoes home page
    When the system checks for active filters and sorting preferences
    Then the system automatically applies active filters
    And the movies are sorted accordingly

  Scenario: Scenario 8: Sort Movies with Active Filters
    Given active filters for 'PG' and 'R' movies are applied
    When the user chooses to sort movies by title
    Then the system displays 'PG' and 'R' movies sorted alphabetically

  Scenario: Scenario 9: Filter and Sort Movies
    Given the 'R' checkbox is selected and movies are displayed on the screen
    When the user chooses to sort movies by release date
    Then the system displays 'R' rated movies sorted in chronological order
