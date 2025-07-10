Feature: Book Store Search Functionality
  As a book store customer,
  I want to search for books by title or author
  So that I can find the books I am interested in

  Scenario: Searching for an existing book by title
    Given the book store has books available
    When the user searches for the book with title "The Great Gatsby"
    Then the system should return the book details in list format

  Scenario: Searching for a non-existing book
    Given the book store has books available
    When the user searches for the book with title "Unknown Title"
    Then the system should indicate that no matching book is found

  Scenario: Searching for a book by author with data represented as a map
    Given the book store supports multiple data representations
    When the user searches for books by the author "George Orwell"
    Then the system should return the book details in map format

