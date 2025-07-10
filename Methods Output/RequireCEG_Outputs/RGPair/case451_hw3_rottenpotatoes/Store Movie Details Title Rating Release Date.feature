Feature: Store Movie Details (Title, Rating, Release Date)

  As a movie rental store owner
  I want to provide users the ability to filter and sort movies based on rating and release date
  So that customers can easily find movies that suit their preferences

  Background:
    Given the user is on the RottenPotatoes home page
    And the movie database has available movies with various ratings and release dates

  Scenario: Display movies with PG rating only
    Given the user selects the 'PG' checkbox
    When the user views the movie listings
    Then the system displays all movies with a 'PG' rating

  Scenario: Display movies with R rating only
    Given the user selects the 'R' checkbox
    When the user views the movie listings
    Then the system displays all movies with an 'R' rating

  Scenario: Display movies with both ratings
    Given the user selects both the 'PG' and 'R' checkboxes
    When the user views the movie listings
    Then the system displays all movies with either 'PG' or 'R' ratings

  Scenario: Display all movies by default
    Given the user does not select any checkboxes
    When the user views the movie listings
    Then the system displays all available movies in the database

  Scenario: Sort movies by title
    Given the user has opted to sort movies
    When the user selects to sort by title
    Then the system arranges the displayed movies in alphabetical order by title

  Scenario: Sort movies by release date
    Given the user has opted to sort movies
    When the user selects to sort by release date
    Then the system arranges the displayed movies in chronological order based on the release date

  Scenario: Display available movies
    Given the user does not select the 'PG' or 'R' checkboxes
    When the user views the movie listings
    Then the system displays all available movies in the database

  Scenario: Sort by title when only PG is selected
    Given the user has selected the 'PG' checkbox and opted to sort by title
    When the user views the movie listings
    Then the system displays all movies with a 'PG' rating sorted in alphabetical order by title

  Scenario: Sort by release date when only R is selected
    Given the user has selected the 'R' checkbox and opted to sort by release date
    When the user views the movie listings
    Then the system displays all movies with an 'R' rating sorted in chronological order by release date

  Scenario Outline: Scenario Outline: Filter and Sort Movies
    Given the user selects the '<rating>' checkbox
    And the user chooses to sort by '<sort-method>'
    When the user views the movie listings
    Then the system displays all movies with a '<rating>' rating sorted by '<sort-method>'
    Examples:
      | rating | sort-method |
      | PG | title |
      | R | release date |
      | PG | release date |
      | R | title |
      | PG | title |
      | both | release date |
      | both | title |

