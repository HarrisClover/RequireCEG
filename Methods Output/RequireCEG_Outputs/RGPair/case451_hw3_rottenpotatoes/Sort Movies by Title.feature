Feature: Sort Movies by Title

  As a moviegoer
  I want to filter and sort movies based on ratings and release dates
  So that I can easily find the movies that I am interested in

  Background:
    Given a list of available movies with various ratings
    And both 'PG' and 'R' checkboxes are available

  Scenario: Filter Movies by PG Rating
    Given the 'PG' checkbox is selected
    When the user views the movie list
    Then only movies rated 'PG' should be displayed

  Scenario: Filter Movies by R Rating
    Given the 'R' checkbox is selected
    When the user views the movie list
    Then only movies rated 'R' should be displayed

  Scenario: Display All Movies with No Checkbox Selected
    Given no checkboxes are selected
    When the user views the movie list
    Then all available movies should be displayed

  Scenario: Show All Movies When Both Checkboxes Are Selected
    Given both 'PG' and 'R' checkboxes are selected
    When the user views the movie list
    Then the system shows all movies including 'PG', 'R', and any other selected ratings

  Scenario: Sort Movies by Title
    Given movies are filtered based on user preferences
    When the user opts to sort the movies by title
    Then the movies should be arranged in ascending alphabetical order

  Scenario: Sort Movies by Release Date
    Given movies are filtered based on user preferences
    When the user opts to sort the movies by release date
    Then the movies should be arranged in chronological order

  Scenario Outline: Filter and Sort Movies
    Given the user selects the <checkbox> checkbox
    And the user opts to sort by <sort-type>
    When the user views the movie list
    Then the displayed movies should reflect the selected filters and sorting order
    Examples:
      | checkbox | sort-type |
      | PG | title |
      | R | release date |
      | None | title |
      | PG and R | release date |

