Feature: Display List of Movies Based on Filters

  As a movie catalog user
  I want to filter movies by rating and have sorting options
  So that I can find movies that match my preferences

  Background:
    Given the user is on the RottenPotatoes home page
    And the database contains movies with various ratings

  Scenario: Display PG movies only
    Given the 'PG' checkbox is selected
    When the user submits the filter
    Then the system should display all movies rated 'PG'

  Scenario: Display R movies only
    Given the 'R' checkbox is selected
    When the user submits the filter
    Then the system should display all movies rated 'R'

  Scenario: Display PG and R movies
    Given both 'PG' and 'R' checkboxes are selected
    When the user submits the filter
    Then the system should display all movies rated 'PG' and 'R'

  Scenario: Display all movies when no checkboxes are selected
    Given neither the 'PG' nor the 'R' checkbox is selected
    When the user submits the filter
    Then the system should display all available movies in the database

  Scenario: Sort movies by title
    Given the user has selected a filter
    When the user chooses to sort the movies by title
    Then the system should display the movies alphabetically from A to Z

  Scenario: Sort movies by release date
    Given the user has selected a filter
    When the user chooses to sort the movies by release date
    Then the system should display the movies from the oldest to the newest

  Scenario: Initial access to movie catalog
    Given the user accesses the RottenPotatoes home page
    Then the system should dynamically reflect the relevant movie list based on filter criteria upon initial access
