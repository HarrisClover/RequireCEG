Feature: Show all books available in the library

  As a library user
  I want to view all available books and filter them by various criteria
  So that I can easily find the books I'm interested in

  Background:
    Given there are three books available in the library
    And the user is logged into the system

  Scenario: Scenario 1: View all books
    Given the user requests to view all books
    When the system retrieves the list of books
    Then the system should present a message indicating that there are three books available in the library

  Scenario: Scenario 2: Filter by publication year
    Given the user applies a filter by publication year '2016'
    When the system retrieves books from that year
    Then the system should display a list of books published in 2016
    And the system should indicate the number of matching titles found

  Scenario: Scenario 3: Search by author
    Given the user searches for books authored by 'Jane'
    When the system processes the search request
    Then the system should return the relevant book listings for 'Jane'

  Scenario: Scenario 4: Search by title keyword
    Given the user searches for books using the keyword 'Awesome'
    When the system processes the title search
    Then the system should return two results consisting of titles that match the keyword 'Awesome'

  Scenario: Scenario 5: Search by title with multiple keywords
    Given the user searches for books using the keyword 'cool'
    When the system processes the title search
    Then the system should return one result consisting of a title that matches the keyword 'cool'

  Scenario: Scenario 6: Filter by publication year without results
    Given the user applies a filter by publication year '2020'
    When the system tries to retrieve books from that year
    Then the system should indicate there are no matching titles found

  Scenario Outline: Search by title keyword
    Given the user searches for books using the keyword '<keyword>'
    When the system processes the search
    Then the system should return <number> results based on the search criteria
    Examples:
      | keyword | number |
      | Awesome | 2 |
      | cool | 1 |

