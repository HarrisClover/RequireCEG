Feature: Support All/None Checkbox States

  As a user
  I want to filter movies based on their ratings and sort them
  So that I can easily find movies that meet my preferences

  Background:
    Given the user accesses the home page
    And the system has movies with various ratings in the database

  Scenario: Scenario 1: Filter by PG Movie
    Given the 'PG' checkbox is selected
    When the user views the movie list
    Then only movies rated 'PG' should be displayed

  Scenario: Scenario 2: Filter by R Movie
    Given the 'R' checkbox is selected
    When the user views the movie list
    Then only movies rated 'R' should be displayed

  Scenario: Scenario 3: Filter by Both PG and R Movies
    Given both the 'PG' and 'R' checkboxes are selected
    When the user views the movie list
    Then movies rated 'PG' and 'R' should be displayed

  Scenario: Scenario 4: Filter by None
    Given neither the 'PG' nor the 'R' checkbox is selected
    When the user views the movie list
    Then all movies in the database should be displayed

  Scenario: Scenario 5: Sort by Title Alphabetically Default Behavior (No Filters Applied)
    Given the user has not selected any checkbox
    When the user views the movie list
    Then movies should be sorted alphabetically by title

  Scenario: Scenario 6: Sort by Release Date Chronologically When Selected
    Given the user opts to sort movies by release date
    When the user views the movie list
    Then movies should be arranged chronologically

  Scenario: Scenario 7: Filter with No Selection Defaults to All Movies Displayed and Title Sorting Applied | NOT Both Checkboxes Selected | NOT C3 Exists Implies Display E4 E5 Sort Title | Logic: AND (C1, C2) = E3 | OR (C4, C5) = E7 | Reqd: DIR (C3) = E4 | DIR (C8) = E8 | This is E8 before any filters exist | | {Events to display all movies and default sorting by title when checkboxes are not selected}
    Given the user has not selected any checkbox
    When the user views the movie list
    Then all movies should be displayed regardless of their ratings, sorted alphabetically by title

  Scenario Outline: Scenario Outline: Combined Checkbox and Sorting Behavior
    Given the 'PG' checkbox is <PG-State>
    And the 'R' checkbox is <R-State>
    And the user opts to sort by <Sort-Option>
    When the user views the movie list
    Then the movies displayed should match the <Expected-Movies>
    Examples:
      | PG-State | R-State | Sort-Option | Expected-Movies |
      | selected | not selected | title | PG Movies sorted by title |
      | not selected | selected | release date | R Movies sorted by release date |
      | selected | selected | title | PG and R Movies sorted by title first |

