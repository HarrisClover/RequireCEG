Feature: Show expected outcomes based on search criteria

  As a user of the book search system
  I want to find books based on various criteria
  So that I can discover relevant books easily

  Background:
    Given the book database is populated with entries
    And the system is ready to process search queries

  Scenario: Scenario 1: Search by publication year
    Given the user inputs '2016'
    When the system processes the query
    Then the response should be 'There are X books published in 2016.'

  Scenario: Scenario 2: Search by author name
    Given the user inputs 'Jane'
    When the system processes the query
    Then the response should be 'There are Y books by authors containing the name Jane.'

  Scenario: Scenario 3: Search by keyword
    Given the user inputs 'Awesome'
    When the system processes the query
    Then the response should reflect 'Search results: Z titles found with the keyword Awesome.'

  Scenario: Scenario 4: Specific keyword search
    Given the user inputs 'cool'
    When the system processes the query
    Then the response should state 'Search result: A title found with the keyword cool.'

  Scenario: Scenario 5: Request full inventory
    Given the user requests the full inventory of books
    When the system processes the request
    Then the response should confirm 'Total number of books available: N.'

  Scenario: Scenario 6: Combined search criteria
    Given the user inputs '2016' and 'Jane'
    When the system processes the queries sequentially
    Then the response should indicate there are matches for the year
    And the system should then check for the presence of authors matching 'Jane' and respond accordingly.

  Scenario: Scenario 7: Search with non-combined criteria
    Given the user inputs '2020'
    When the system processes the query without combining it with other criteria
    Then the response should be 'There are X books published in 2020.'

  Scenario: Scenario 8: Search while combining criteria
    Given the user inputs '2016', 'Jane', and 'Awesome'
    When the system processes these queries sequentially
    Then the response should indicate there are X matches for '2016'
    And the response should then indicate there are Y matches for authors matching 'Jane'
    And the system should finally provide 'Search results: Z titles found with the keyword Awesome.'
