Feature: Book Store Search Functionality
  As a Book Store Customer
  I want to search for books by title or author
  So that I can find books I am interested in buying or viewing

  Background: Books in the Store Catalog
    Given the following books are available in the store catalog, represented internally using various structures (lists, maps):
      | Title                     | Author              | ISBN          |
      | The Lord of the Rings     | J.R.R. Tolkien      | 978-0618260274|
      | Pride and Prejudice       | Jane Austen         | 978-0141439518|
      | The Hitchhiker's Guide    | Douglas Adams       | 978-0345391803|
      | Foundation                | Isaac Asimov        | 978-0553293357|
      | Dune                      | Frank Herbert       | 978-0441172719|
      | Pride and Prejudice       | Jane Austen (Audio) | 978-1982508039| # Example of variation

  Scenario Outline: Search for an existing book by exact title
    When I search for a book with the title "<title>"
    Then the search results should include the book titled "<title>" by "<author>"

    Examples:
      | title                 | author        |
      | Dune                  | Frank Herbert |
      | Foundation            | Isaac Asimov  |

  Scenario Outline: Search for existing books by author
    When I search for books by the author "<author>"
    Then the search results should include books written by "<author>", such as "<example_title>"

    Examples:
      | author      | example_title         |
      | Jane Austen | Pride and Prejudice   |
      | Isaac Asimov| Foundation            |

  Scenario: Search for a book by partial title (if supported)
    When I search for a book with the title containing "Hitchhiker"
    Then the search results should include "The Hitchhiker's Guide" by Douglas Adams

  Scenario: Search for a non-existent book title
    When I search for a book with the title "Journey to the Center of the Earth"
    Then the search results should be empty or indicate "No books found"

  Scenario: Search for a non-existent author
    When I search for books by the author "Jules Verne"
    Then the search results should be empty or indicate "No books found"

