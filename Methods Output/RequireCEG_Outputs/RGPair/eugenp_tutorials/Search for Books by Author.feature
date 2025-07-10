Feature: Search for Books by Author

  As a book database user
  I want to search for book titles by author names
  So that I can find books relevant to my interests

  Background:
    Given the book database is available
    And the user is prompted to enter an author's name

  Scenario: Valid author name input with existing titles
    Given the user inputs a valid author name
    When the system queries the database for the author
    Then the system displays a list of books for the author
    And each book includes the title, publication date, and genre

  Scenario: Empty author name input
    Given the user inputs an empty string
    When the system processes the input
    Then the system prompts the user to 'Please enter a valid author name.'

  Scenario: Author name with special characters
    Given the user inputs an author name with special characters
    When the system sanitizes the input and removes or replaces special characters
    Then the system queries the database using the sanitized author name

  Scenario: No books found for the author
    Given the user inputs an author name with no associated titles
    When the system queries the database
    Then the system returns 'No books were found for [Author Name].'

  Scenario: Valid author name input with sanitization
    Given the user inputs an author name that contains special characters
    When the system sanitizes the author's name
    Then the system queries the database for titles associated with the sanitized author name

  Scenario Outline: Different valid author name inputs
    Given the user inputs an author name '<author-name>'
    When the system queries for books
    Then the system returns '<number-of-titles>' titles found
    Examples:
      | author-name | number-of-titles |
      | J.K. Rowling | 7 |
      | Stephen King | 10 |
      | George R.R. Martin | 5 |

