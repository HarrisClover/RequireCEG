Feature: Verify correctness of results for each search type

  As a user
  I want to search for books by publication year, author, or keyword
  So that I can find specific books efficiently

  Background:
    Given the book database is populated with various titles
    And the user has access to the search functionality

  Scenario: Scenario 1: Search by Publication Year
    Given the user inputs the publication year '2021'
    When the user initiates the search
    Then the system returns all books published in '2021'
    And the system displays a message with the total count of these titles

  Scenario: Scenario 2: Search by Author
    Given the user inputs the author's name 'Jane'
    When the user initiates the search
    Then the system returns all books written by 'Jane'
    And the system displays a message with the count of matching titles

  Scenario: Scenario 3: Search by Keyword in Title
    Given the user inputs the keyword 'Awesome'
    When the user initiates the search
    Then the system returns all titles that contain the keyword 'Awesome'
    And the system displays a message with the total count of matching books

  Scenario: No Books Found by Publication Year Scenario - No Match Case for Publication Year Search (C7, E4, C4, E6, Req(C4, C1))
    Given the user inputs the publication year '1900'
    When the user initiates the search
    Then the system displays a message indicating no books were found for the specified year.
    And the system shows a count of zero titles.

  Scenario: No Books Found by Author Scenario - No Match Case for Author Search (C8, E5, C5, E6, Req(C5, C2))
    Given the user inputs the author's name 'Unknown Author'
    When the user initiates the search
    Then the system displays a message indicating no books were found for the specified author.
    And the system shows a count of zero titles.

  Scenario: No Books Found by Keyword Scenario - No Match Case for Keyword Search (C9, E6, C6, E6, Req(C6, C3))
    Given the user inputs a non-existing keyword 'NotInLibrary'
    When the user initiates the search
    Then the system displays a message indicating no books were found for the specified keyword.
    And the system shows a count of zero titles.

  Scenario Outline: Scenario Outline: Filtering Search
    Given the user inputs <search-term>
    When the user initiates the search
    Then the system returns all books matching <search-term>
    And the system displays a message with the count of the matching titles
    Examples:
      | search-term | expected-count |
      | 2020 | 5 |
      | Jane | 3 |
      | Awesome | 2 |
      | Cool | 1 |

