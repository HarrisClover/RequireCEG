Feature: Provide an intuitive search interface for ease of use

  As a user
  I want to search for books by publication year, author name, or keywords
  So that I can easily find the relevant books based on my criteria

  Background:
    Given the system has a database of books
    And the user is on the search page

  Scenario: Searching by publication year
    Given a user enters the publication year '2023'
    When the user submits the search
    Then the system should query the database for books matching the publication year
    And the displayed results should include all books published in '2023'

  Scenario: Searching by author's name
    Given a user enters the author's name 'Jane Smith'
    When the user submits the search
    Then the system should filter the list by the specified author
    And the displayed results should include all books written by 'Jane Smith'

  Scenario: Searching by keyword in book titles
    Given a user enters the keyword 'Awesome'
    When the user submits the search
    Then the system should search for books containing 'Awesome' in their titles
    And the displayed results should include all books containing 'Awesome'

  Scenario: Searching with multiple criteria
    Given a user enters '2022' for publication year and 'John Doe' for author
    When the user submits the search
    Then the system should display titles of books that meet all specified filters
    And the results should include all books published in '2022' by 'John Doe'

  Scenario: No results found
    Given a user enters '2021' for publication year and 'Unknown Author' for author
    When the user submits the search
    Then the system should display 'No results found for your search.'

  Scenario: Not selecting any criteria
    Given a user does not select any search criteria
    When the user submits the search
    Then the system should display 'No criteria selected.'

  Scenario: Searching with invalid author name
    Given a user enters an invalid author's name 'Invalid Author'
    When the user submits the search
    Then the system should display 'No results found for your search.'
