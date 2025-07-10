Feature: Ensure accurate reflection of search results in quantity and quality

  As a user
  I want to search for books by publication year, author, or keyword
  So that I can find specific books that meet my criteria effectively

  Background:
    Given the database is populated with books
    And the search functionality is available

  Scenario: Scenario 1: Search by Publication Year
    Given the user inputs a publication year of '2016'
    When the user executes the search
    Then the system returns the exact count of books published in '2016'
    And a message indicating the number found is displayed

  Scenario: Scenario 2: Search by Author
    Given the user inputs an author's name containing 'Jane'
    When the user executes the search
    Then the system filters the results based on the author's name
    And all titles containing 'Jane' and the total number of matches are presented

  Scenario: Scenario 3: Keyword Search (Awesome)
    Given the user inputs a keyword search term 'Awesome'
    When the user executes the search
    Then the system returns exactly two results for the keyword 'Awesome'

  Scenario: Scenario 4: Keyword Search (cool)
    Given the user inputs a keyword search term 'cool'
    When the user executes the search
    Then the system returns exactly one result for the keyword 'cool'

  Scenario: Scenario 5: Compound Query with Author and Title
    Given the user applies multiple criteria, including both author 'Jane' and title containing 'Best'
    When the user executes the search
    Then the system executes a compound query for author and title criteria
    And displays only titles matching both criteria along with the accurate count of these combined results

  Scenario: Scenario 6: Search with Keyword Criteria
    Given the user inputs both keywords 'Awesome' and 'cool'
    When the user executes the search
    Then the system returns results based on the intersection of both keyword searches
