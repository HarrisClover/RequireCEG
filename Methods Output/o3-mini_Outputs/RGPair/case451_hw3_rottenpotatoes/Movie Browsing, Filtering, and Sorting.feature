Feature: Movie Browsing, Filtering, and Sorting
  As an avid moviegoer or concerned parent,
  I want to be able to filter movies by MPAA ratings and sort them by title or release date
  So that I can quickly find movies appropriate for me and my family.

  Background:
    Given a movie database exists containing movies with details such as title, MPAA rating, and release date
    And the database includes movies like "Aladdin", "The Terminator", and "When Harry Met Sally"

  Scenario: Filtering movies by a single MPAA rating
    Given I am on the RottenPotatoes home page
    When I select the "PG" rating checkbox
    Then I should see only movies with a "PG" rating

  Scenario: Filtering movies by multiple MPAA ratings
    Given I am on the RottenPotatoes home page
    When I select the "PG" and "R" rating checkboxes
    Then I should see movies that are either rated "PG" or "R"

  Scenario: Displaying all movies when no rating checkbox is selected
    Given I am on the RottenPotatoes home page
    When I do not select any MPAA rating checkboxes
    Then I should see all movies in the database

  Scenario: Sorting the filtered movie list by title
    Given I am on the RottenPotatoes home page
    And I have filtered movies by selecting the "PG" rating checkbox
    When I sort the movie list by "title"
    Then the displayed movies should be in alphabetical order by title

  Scenario: Sorting the filtered movie list by release date
    Given I am on the RottenPotatoes home page
    And I have filtered movies by selecting the "PG" and "R" rating checkboxes
    When I sort the movie list by "release date"
    Then the displayed movies should be ordered from the earliest to the latest release date

  Scenario: Default view with pre-selected filtering and sorting preferences
    Given I am a new visitor to RottenPotatoes
    And the default filter is set to show movies rated "PG"
    And the default sort order is by "title"
    When I access the RottenPotatoes home page
    Then I should see a list of movies filtered by the "PG" rating
    And the list should be sorted alphabetically by title
