Feature: Filter results by specific publication years

  As a user
  I want to filter books by publication year
  So that I can find titles published in the years I am interested in

  Background:
    Given the system has a collection of books with various publication years
    And the user is on the search interface for books

  Scenario: Scenario 1: Single Year Filter
    Given the user selects the publication year 2016
    When the system queries the database for books published in 2016
    Then display the titles of the books published in 2016
    And show a confirmation message indicating the total number of titles found

  Scenario: Scenario 2: No Books Found
    Given the user selects a publication year 2023
    When the system queries the database for books published in 2023
    Then display a message stating 'No books found for the selected year.'

  Scenario: Scenario 3: Multiple Years Filter
    Given the user selects publication years 2016 and 2018
    When the system queries the database for books published in 2016 or 2018
    Then display all titles that match the selected years
    And show the total count of unique titles available across the specified years

  Scenario: Scenario 4: Confirm Results for Year Selection
    Given the user selects publication year 2016
    When the system queries for books published in 2016
    Then the database should return books specific to the year
    And the action should display relevant titles found

  Scenario Outline: Scenario Outline: Validate Year Filter Results
    Given the user selects publication year <year>
    When the system queries for books published in <year>
    Then the system should return <expected-result>
    Examples:
      | year | expected-result |
      | 2016 | 3 titles found |
      | 2017 | 5 titles found |
      | 2022 | No titles found |

