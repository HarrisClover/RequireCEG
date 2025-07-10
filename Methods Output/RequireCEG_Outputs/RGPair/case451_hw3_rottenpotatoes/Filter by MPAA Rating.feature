Feature: Filter by MPAA Rating

  As a parent
  I want to filter movies by their ratings
  So that I can ensure my children have an appropriate viewing experience

  Background:
    Given the user is on the RottenPotatoes home page
    And there are movies with different MPAA ratings available in the database

  Scenario: Scenario 1: Display PG Movies Only
    Given the 'PG' checkbox is selected
    When the user applies the filter
    Then only movies with a PG rating should be displayed
    And the title of the movies is sorted alphabetically by title

  Scenario: Scenario 2: Display R Movies Only
    Given the 'R' checkbox is selected
    When the user applies the filter
    Then only movies with an R rating should be displayed

  Scenario: Scenario 3: Display Both PG and R Movies
    Given both 'PG' and 'R' checkboxes are selected
    When the user applies the filter
    Then a combined list of PG and R-rated movies should be displayed

  Scenario: Scenario 4: Display All Movies
    Given neither 'PG' nor 'R' checkbox is selected
    When the user applies the filter
    Then all available movies should be displayed

  Scenario: Scenario 5: Refresh Movie Display for Sorting by Title
    Given the user has a list of PG movies filtered
    And the user selects to sort the movies by title
    When the user applies the sorting option
    Then the movies should be displayed sorted alphabetically by title
    And the movie display should refresh to reflect the selected filter or sort option

  Scenario: Scenario 6: Refresh Movie Display for Sorting by Release Date
    Given the user has a list of R movies filtered
    And the user selects to sort the movies by release date
    When the user applies the sorting option
    Then the movies should be displayed sorted chronologically by release date
    And the movie display should refresh to reflect the selected filter or sort option

  Scenario Outline: Scenario Outline: Sorting Movies
    Given the user has a list of movies filtered by <rating>
    And the user selects to sort the movies by <sort-option>
    When the user applies the sorting option
    Then the movies should be displayed sorted by <sort-option>
    Examples:
      | rating | sort-option |
      | PG | title |
      | R | release date |
      | Both | title |
      | None | release date |

