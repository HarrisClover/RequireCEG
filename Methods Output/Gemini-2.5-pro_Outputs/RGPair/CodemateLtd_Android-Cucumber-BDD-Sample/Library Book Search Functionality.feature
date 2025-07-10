Feature: Library Book Search Functionality
  As a library customer,
  I want to search for books using different criteria like publication year, author, and title,
  So that I can easily find the books I am interested in.

  Background: Library has initial books
    Given the library system has a collection of books
    And the collection initially contains exactly 3 books:
      | Title                    | Author      | Publication Year |
      | An Awesome Book          | Jane Smith  | 2016             |
      | More Awesome Stuff       | John Doe    | 2018             |
      | A Cool Programming Guide | Jane Doe    | 2020             |
      # Note: This background data is assumed to satisfy the requirements below.

  Scenario: View all available books
    Given the customer is viewing the library catalog
    When the customer requests the list of all available books
    Then the system should display a total of 3 books

  Scenario Outline: Search by Publication Year
    Given the customer wants to search by publication year
    When the customer searches for books published in the year <year>
    Then the system should display <count> matching book(s)

    Examples:
      | year | count |
      | 2016 | 1     | # Expecting "An Awesome Book"
      | 2018 | 1     | # Expecting "More Awesome Stuff"
      | 2020 | 1     | # Expecting "A Cool Programming Guide"
      | 2017 | 0     | # Expecting no books

  Scenario Outline: Search by Author
    Given the customer wants to search by author name
    When the customer searches for books by the author '<author_name>'
    Then the system should display <count> matching book(s)

    Examples:
      | author_name | count |
      | Jane        | 2     | # Assuming partial match finds "Jane Smith" and "Jane Doe"
      | Jane Smith  | 1     | # Expecting "An Awesome Book"
      | John Doe    | 1     | # Expecting "More Awesome Stuff"
      | Unknown Author | 0  | # Expecting no books

  Scenario Outline: Search by Title Keyword
    Given the customer wants to search by title keyword
    When the customer searches for books with the title keyword '<keyword>'
    Then the system should display <count> matching book(s)
    # Optional: And the results should include specific titles if needed for more detailed tests

    Examples:
      | keyword | count |
      | Awesome | 2     | # Expecting "An Awesome Book", "More Awesome Stuff"
      | cool    | 1     | # Expecting "A Cool Programming Guide"
      | Book    | 1     | # Expecting "An Awesome Book"
      | Guide   | 1     | # Expecting "A Cool Programming Guide"
      | NonExistent | 0 | # Expecting no books