Feature: Library Book Search Functionality
  As a library user,
  I want to search for books by publication year, author, and title
  So that I can easily find the books I am interested in.

Scenario: Searching books by publication year
  Given that there are books published in various years
  When a customer searches for books published in <publication-year>
  Then the system should return the list of books published in <publication-year>
  And the total number of books returned should be <number-of-books>

Scenario: Searching books by author
  Given that there are books by various authors
  When a customer searches for books by author "<author>"
  Then the system should return the list of books written by "<author>"
  And the total number of books returned should be <number-of-books>

Scenario: Searching books by title
  Given that there are books with various titles
  When a customer searches for books with the title containing "<keyword>"
  Then the system should return the list of books with titles containing "<keyword>"
  And the total number of books returned should be <number-of-books>

Examples:
  | publication-year | number-of-books |
  | 2016             | 2               |
  
  | author  | number-of-books |
  | Jane    | 3               |
  | Jane Smith | 1             |

  | keyword | number-of-books |
  | Awesome | 2               |
  | cool    | 1               |
