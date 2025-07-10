Feature: Sort Movies by Release Date

  As a user of the movie application
  I want to filter and sort movies by their release date and ratings
  So that I can easily find movies that suit my preferences

  Background:
    Given the movie database is populated with various movies
    And the user is logged into the application

  Scenario: Filtering by PG and R Ratings
    Given the user has selected 'PG' and 'R' rating filters
    When the user applies these filters
    Then the application should display only movies with 'PG' and 'R' ratings
    And the displayed movies should be sorted by release date in ascending order

  Scenario: Sorting Movies by Title after Applying Filters
    Given the user has filtered movies by 'PG' rating
    When the user changes the sorting preference to 'Title'
    Then the application should re-sort the filtered movies by title in ascending order

  Scenario: Clearing Filters to Show All Movies
    Given the user has selected 'PG' and 'R' rating filters
    When the user selects the 'Clear All Filters' option
    Then the application should revert to displaying all movies sorted by release date in ascending order

  Scenario: Not Applying Any Filters
    Given the user has not selected any filters
    When the user accesses the movie list
    Then the application should display all movies sorted by release date in ascending order

  Scenario: Re-sorting Movies by Title After Filtering
    Given the user has filtered movies by 'R' rating
    When the user changes the sorting preference to 'Title'
    Then the application should re-sort the already filtered list of movies by title in ascending order

  Scenario Outline: Applying Multiple Filters and Sorting
    Given the user has selected <rating> filter
    And the user has selected <sort_option>
    When the user applies these filters and sorts
    Then the application should display movies filtered by <rating> and sorted by <sort_option>
    Examples:
      | rating | sort_option |
      | PG | release date |
      | R | title |
      | PG-13 | release date |

