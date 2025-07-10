Feature: Library Search Functionality
  As a customer,
  I want to search for books by publication year, author, and title,
  So that I can quickly and accurately find the books I need.

  Background:
    Given the library contains the following books
      | Title               | Author      | Publication Year |
      | Awesome Tales       | Jane Doe    | 2016             |
      | Awesome Adventures  | Jane Smith  | 2016             |
      | Cool Exploration    | John Smith  | 2018             |

  Scenario: View the complete list of available books
    When a customer views the library catalog
    Then they should see a total of 3 books

  Scenario Outline: Search books by publication year
    When a customer searches for books published in <year>
    Then the system should display <resultCount> book(s) published in <year>

    Examples:
      | year | resultCount |
      | 2016 | 2           |
      | 2018 | 1           |

  Scenario Outline: Search books by author
    When a customer searches for books by author "<author>"
    Then the system should display <resultCount> book(s) written by "<author>"

    Examples:
      | author     | resultCount |
      | Jane       | 2           |
      | Jane Smith | 1           |

  Scenario Outline: Search books by title keyword
    When a customer searches for books with titles containing "<keyword>"
    Then the system should return <resultCount> book(s) that contain the keyword "<keyword>" in the title

    Examples:
      | keyword | resultCount |
      | Awesome | 2           |
      | cool    | 1           |
