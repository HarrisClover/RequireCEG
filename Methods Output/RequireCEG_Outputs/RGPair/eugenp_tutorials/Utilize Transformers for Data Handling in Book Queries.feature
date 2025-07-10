Feature: Utilize Transformers for Data Handling in Book Queries

  As a user
  I want to search for books by title or author and receive accurate results
  So that I can find the books I am interested in quickly and efficiently

  Background:
    Given the system has a database of books
    And the user is logged into the system

  Scenario: Scenario 1: Search by Title - Book Found
    Given the user inputs a valid book title
    When the user executes the search
    Then the system finds matching books in the database for the title query
    And the system returns a detailed representation of each book found for the title query

  Scenario: Scenario 2: Search by Title - Book Not Found
    Given the user inputs an invalid book title
    When the user executes the search
    Then the system displays a message notifying the user of the absence of books matching the title

  Scenario: Scenario 3: Search by Author - Books Found
    Given the user inputs a valid author name
    When the user executes the search
    Then the system finds matching books in the database for the author query
    And the system returns a detailed representation of each book found for the author query

  Scenario: Scenario 4: Search by Author - No Books Found
    Given the user inputs an author name with no matching books
    When the user executes the search
    Then the system displays a message notifying the user of the absence of books matching the author

  Scenario: Scenario 5: Transform Output Format - Books Found by Title Search Requesting Map Format with Results Found Satisfaction of Query Requirements and Format Transformation Requirement.
    Given the user has searched for books with title
    And there are 3 results found
    When the user requests the output in map format
    Then the system transforms the output data into a map format upon user request
    And the system returns the book information structured as a map

  Scenario: Scenario 6: Transform Output Format - No Books Found by Title Search Requesting Map Format Requirement with No Results.
    Given the user has searched for books with title
    And there are 0 results found
    When the user requests the output in map format
    Then the system returns an empty map or notification indicating no results
    And the system fulfills the user's request in map format

  Scenario Outline: Scenario Outline: Transform Output to Map Format
    Given the user has searched for books with <search-type>
    And there are <number> results found
    When the user requests the output in map format
    Then the system returns the book information structured as a map
    Examples:
      | search-type | number |
      | title | 3 |
      | author | 5 |
      | title | 0 |

