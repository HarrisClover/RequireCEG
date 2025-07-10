Feature: Library Search Functionality

  As a customer
  I want to efficiently search for books by publication year, author, and title
  So that I can easily find the books I am interested in

  Background:
    Given the library contains three books
    And the library system is operational

  Scenario: Scenario 1: Search by Publication Year
    Given a customer accesses the search feature
    When the customer searches for books published in 2016
    Then the number of matching titles should be displayed as 2
    And the correct books 'Book A' and 'Book B' should be displayed

  Scenario: Scenario 2: Search by Author
    Given a customer accesses the search feature
    When the customer searches for books written by 'Jane Smith'
    Then the correct corresponding results 'Book C' should be displayed

  Scenario: Scenario 3: Search by Title
    Given a customer accesses the search feature
    When the customer searches for 'Awesome'
    Then two results should be returned: 'Awesome Book 1' and 'Awesome Book 2'

  Scenario Outline: Scenario Outline: Title Search
    Given the customer has entered the title '<title>'
    When the customer initiates the search
    Then the results should reflect '<expected-results>' matching titles
    Examples:
      | title | expected-results |
      | Awesome | 2 |
      | cool | 1 |
      | Interesting Book | 1 |
      | Nonexistent Title | 0 |


  Scenario: Scenario 4: No Matching Results
    Given a customer accesses the search feature
    When the customer searches for 'Completely Unknown Title'
    Then a message should be displayed stating 'No results found'
