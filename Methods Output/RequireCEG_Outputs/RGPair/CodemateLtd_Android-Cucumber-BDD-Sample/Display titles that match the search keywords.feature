Feature: Display titles that match the search keywords

  As a customer
  I want to search for book titles by publication year, author name, or keywords
  So that I can easily find the books I'm interested in

  Background:
    Given the customer is on the book search page
    And there are multiple titles available in the system

  Scenario: Specific publication year search
    Given the user searches for books published in 2021
    When the system processes the search
    Then a list of titles published in 2021 should be displayed
    And the system filters and displays a list of titles published in the specific year

  Scenario: Search by author's name
    Given the user searches for books by 'Jane Smith'
    When the system processes the search
    Then all titles by 'Jane Smith' should be displayed
    And the system returns all titles matching the author or keywords

  Scenario: Search by keyword in title
    Given the user searches for books with the keyword 'Awesome'
    When the system processes the search
    Then two results containing 'Awesome' should be displayed
    And the system presents all relevant titles containing the keywords

  Scenario: No results found
    Given the user searches for a title that does not exist
    When the system processes the search
    Then the system should inform the user that no titles were found
    And the system communicates to the user that no titles were found

  Scenario: Search yields results matching the criteria
    Given the user searches using valid criteria that returns results
    When the system processes the search
    Then the system evaluates the total number of titles found based on the search criteria

  Scenario: Search yields no results
    Given the user searches using criteria that returns no results
    When the system processes the search
    Then the system evaluates the total number of titles found based on the search criteria
    And the system communicates to the user that no titles were found
