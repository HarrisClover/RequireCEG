Feature: Confirm total number of books in the system (3 initially)

  As a library user
  I want to know the total number of books available in the system
  So that I can understand the library's inventory status

  Background:
    Given the library system is initialized
    And a total of 3 books are available in the system

  Scenario: Scenario 1: Search by publication year
    Given the user is on the library search page
    When the user searches for books published in 2016
    Then the system confirms the search
    And displays the count of results matching the specified year

  Scenario: Scenario 2: Search by author
    Given the user is on the library search page
    When the user searches for books authored by 'Jane Smith'
    Then the system returns a list of corresponding titles
    And displays the count of titles authored by Jane Smith

  Scenario: Scenario 3: Search by title keyword
    Given the user is on the library search page
    When the user searches for the keyword 'Awesome'
    Then the system responds with the number of results
    And displays 2 results matching the keyword 'Awesome'

  Scenario: Scenario 4: Display total number of available books
    Given the user is on the library homepage
    When the system is initialized
    Then the system displays the message indicating the total number of books available is 3

  Scenario: Scenario 5: Analyze user's publication year input
    Given the user inputs a publication year
    When the user confirms the search
    Then the system analyzes user's publication year input and returns the count of matching titles found

  Scenario: Scenario 6: Analyze user's author input
    Given the user inputs an author's name
    When the user confirms the search
    Then the system analyzes user's author input and returns a list of corresponding titles

  Scenario: Scenario 7: Analyze user's title keyword input
    Given the user inputs a title keyword
    When the user confirms the search
    Then the system analyzes user's title keyword input and returns the count of matching titles

  Scenario Outline: Scenario Outline: Search results for keywords
    Given the user is on the library search page
    When the user searches for the keyword <keyword>
    Then the system responds with <resultCount> results
    Examples:
      | keyword | resultCount |
      | cool | 1 |
      | Awesome | 2 |
      | history | 0 |

