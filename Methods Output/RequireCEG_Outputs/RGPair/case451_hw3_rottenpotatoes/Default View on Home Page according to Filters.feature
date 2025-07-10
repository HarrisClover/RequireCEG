Feature: Default View on Home Page according to Filters

  As a user
  I want to filter and sort the movies displayed on the home page
  So that I can easily find movies that meet my preferences

  Background:
    Given the user accesses the RottenPotatoes home page

  Scenario: Scenario 1: No Filters Applied
    Given no checkboxes are selected
    Then the system displays all movies in the database

  Scenario: Scenario 2: PG Filter Applied
    Given the 'PG' checkbox is selected
    Then the system filters and displays only the movies with a 'PG' rating

  Scenario: Scenario 3: R Filter Applied
    Given the 'R' checkbox is selected
    Then the system filters and displays only the movies with an 'R' rating

  Scenario: Scenario 4: Both Filters Applied
    Given both the 'PG' and 'R' checkboxes are selected
    Then the system displays all movies rated 'PG' and 'R'

  Scenario: Scenario 5: Sorting by Title
    Given the user opts to sort the movies by title
    Then the system arranges the films alphabetically based on their titles

  Scenario: Scenario 6: Sorting by Release Date
    Given the user opts to sort the movies by release date
    Then the system lists the movies chronologically according to their release dates

  Scenario: Scenario 7: Sorting with No Filters
    Given no checkboxes are selected
    And the user opts to sort the movies by title
    When the user accesses the home page
    Then the system displays all movies sorted alphabetically by title

  Scenario: Scenario 8: Filters and Sorting by Title
    Given the 'PG' checkbox is selected
    And the user opts to sort the movies by title
    When the user accesses the home page
    Then the system displays all PG movies sorted by title

  Scenario: Scenario 9: Filters and Sorting by Release Date
    Given the 'R' checkbox is selected
    And the user opts to sort the movies by release date
    When the user accesses the home page
    Then the system displays all R movies sorted by release date

  Scenario: Scenario 10: Filters and Multiple Sorting Options
    Given both the 'PG' and 'R' checkboxes are selected
    And the user opts to sort the movies by title
    When the user accesses the home page
    Then the system displays all PG and R movies sorted by title
