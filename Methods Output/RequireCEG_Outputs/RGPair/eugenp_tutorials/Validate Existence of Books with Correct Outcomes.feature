Feature: Validate Existence of Books with Correct Outcomes

  As a user searching for books
  I want to find books based on title or author
  So that I can obtain the relevant book information quickly

  Background:
    Given the book database is populated with several titles and authors
    And the user is logged into the system

  Scenario: Scenario 1: Exact Title Match
    Given the user searches for a specific book title 'The Great Gatsby'
    When the system checks the database for the title
    Then the system should return the book details including author and publication date
    And the details should include all versions of the title if multiple exist

  Scenario: Scenario 2: No Title Match
    Given the user searches for a non-existent book title 'Unknown Book'
    When the system checks the database for the title
    Then the system should display a message stating no results were found for the given title

  Scenario: Scenario 3: Author Match with Results
    Given the user searches for books by author 'F. Scott Fitzgerald'
    When the system queries the database for books by that author
    Then the system should return a list of books written by 'F. Scott Fitzgerald'

  Scenario: Scenario 4: No Author Match
    Given the user searches for books by author 'Nonexistent Author'
    When the system queries the database for books by that author
    Then the system should display a message indicating no books were found by that author

  Scenario: Scenario 5: Title and Author Search
    Given the user searches for the book title '1984' by author 'George Orwell'
    When the system checks for a match on the title and corresponding author
    Then the system should return details for '1984' by 'George Orwell'
    And the system should not return any entries that do not match both the title and author

  Scenario: Scenario 6: Title Only Search with No Matches Found for Author
    Given the user searches for the book title 'Gatsby' by author 'Random Author'
    When the system checks for a match on the title and corresponding author
    Then the system should indicate that no entries match the search criteria due to a partial title match

  Scenario Outline: Scenario Outline: Advanced Search Parameters
    Given the user provides a <title> and <author>
    When the system processes the search request
    Then the outcome should be a <result-message>
    Examples:
      | title | author | result-message |
      | The Great Gatsby | F. Scott Fitzgerald | returns details for The Great Gatsby |
      | 1984 | George Orwell | returns details for 1984 by George Orwell |
      | Unknown Title | Some Author | no results found for the given title |

