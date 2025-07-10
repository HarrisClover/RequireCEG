Feature: Support Multiple Data Representations for Book Listings

  As a user searching for books
  I want to search books by title or author and receive results in both list and map formats
  So that I can easily review and utilize the information about the books

  Background:
    Given the system contains a database of books
    And a user is logged into the system

  Scenario: Search by Title: Books Found
    Given the user enters a title that exists in the database
    When the user submits the search query
    Then the system returns a list of books matching the title
    And the system returns a map of books matching the title

  Scenario: Search by Author: Books Found
    Given the user enters an author name that exists in the database
    When the user submits the search query
    Then the system returns a list of books matching the author
    And the system returns a map of books matching the author

  Scenario: Search by Title: No Results
    Given the user enters a title that does not exist in the database
    When the user submits the search query
    Then the system returns a message indicating no results found in list format
    And the system returns a message indicating no results found in map format

  Scenario: Apply Transformers to Output
    Given the user enters a title and specifies transformations for the output
    When the user submits the search query
    Then the system returns a transformed list format of the books found
    And the system returns a transformed map format of the books found

  Scenario: Books Not Found with Transformers Applied
    Given the user enters a title that does not exist in the database
    When the user submits the search query and specifies transformers for the output
    Then the system returns a message indicating that no results were found in list format
    And the system returns a message indicating that no results were found in map format

  Scenario: XOR Output Formats: List vs Map
    Given the user specifies an output format
    And the user enters a valid query that finds books in the database
    When the user submits the search query for both list and map formats
    Then the system returns results in either list format or map format, but not both
