Feature: Display count of matching titles based on selected year

  As a user searching for books
  I want to find books based on their publication year
  So that I can discover relevant titles from that year

  Background:
    Given the user selects a publication year
    And the system is prepared to validate the input

  Scenario: Scenario 1: Valid year with matching titles
    Given the user inputs a valid year format
    And there are books in the database for that year
    When the user searches for books published in that year
    Then the system displays the message 'Found {count} book(s) for the publication year {selected year}'
    And the count reflects the accurate number of matching titles

  Scenario: Scenario 2: Valid year with no matching titles
    Given the user inputs a valid year format
    And there are no books in the database for that year
    When the user searches for books published in that year
    Then the system displays the message 'No books found for the publication year {selected year}'

  Scenario: Scenario 3: Invalid year format
    Given the user inputs a year that is not in a valid format
    When the user attempts to search for books published in that year
    Then the system does not proceed with the search
    And the user is prompted with an error message

  Scenario: Scenario 4: Valid year with exactly three matching titles
    Given the user inputs a valid year format
    And there are exactly three matching titles in the database for that year
    When the user searches for books published in that year
    Then the system displays the message 'Found 3 book(s) for the publication year {selected year}'
    And the count reflects the accurate number of matching titles
