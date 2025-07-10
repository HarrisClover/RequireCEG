Feature: Allow search for books by individual author names

  As a user
  I want to search for books by authors based on their names
  So that I can find specific titles or browse the complete library collection

  Background:
    Given the user accesses the book searching system
    And there are books available in the library

  Scenario: Searching for a specific author
    Given the user enters the name 'Jane Smith'
    When the search is executed
    Then the system displays all titles by 'Jane Smith'
    And confirms the total number of books attributed to 'Jane Smith'

  Scenario: Searching for authors by partial name
    Given the user enters the name 'Jane'
    When the search is executed
    Then the system displays all titles authored by any author containing 'Jane'
    And confirms the total number of books attributed to those authors

  Scenario: No matches found
    Given the user enters a non-existent author name 'John Doe'
    When the search is executed
    Then the system returns the message 'No matches found for the author specified.'

  Scenario: Displaying the complete library
    Given the user omits entering an author name
    When the search is executed
    Then the system displays the complete library collection available to all users

  Scenario: Empty input handling
    Given the user does not enter any name
    When the search is executed
    Then the system displays the complete library collection available to all users
    And confirms that no specific author title search was performed

  Scenario: Author with multiple titles in database
    Given the user enters the name of an author with multiple titles
    When the search is executed
    Then the system displays all titles attributed to that author
    And confirms the total number of books attributed to that author

  Scenario: Author with only one title in the database
    Given the user enters the name of an author with only one title
    When the search is executed
    Then the system displays the title attributed to that author
    And confirms the total number of books attributed to that author is one
