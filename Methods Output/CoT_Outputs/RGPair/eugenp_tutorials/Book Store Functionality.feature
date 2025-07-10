Feature: Book Store Functionality
As a user,
I want to search for books by title or author
So that I can find books easily.

Scenario: Search for Existing Book by Title
Given that a book with the title <book-title> exists
When the user searches for the book by title
Then the system should return the correct book information

Scenario: Search for Non-Existing Book by Title
Given that no book with the title <book-title> exists
When the user searches for the book by title
Then the system should return a "Book not found" message

Scenario: Search for Existing Book by Author
Given that a book by the author <book-author> exists
When the user searches for books by author
Then the system should return the correct book information

Scenario: Search for Non-Existing Book by Author
Given that no book by the author <book-author> exists
When the user searches for books by author
Then the system should return a "No books found" message

