Feature: Enable keyword search within book titles

  As a library user
  I want to search for books by entering keywords in the title search field
  So that I can find specific books easily based on their titles

  Background:
    Given the initial total number of books in the library is three
    And the user is on the search page

  Scenario: Scenario 1: Search with keyword 'Awesome'
    Given the user enters the keyword 'Awesome' into the title search field
    When the user submits the search
    Then the system should display two books that match the keyword 'Awesome'
    And the total number of books displayed should be 2

  Scenario: Scenario 2: Search with keyword 'cool'
    Given the user enters the keyword 'cool' into the title search field
    When the user submits the search
    Then the system should display one book that matches the keyword 'cool'
    And the total number of books displayed should be 1

  Scenario: Scenario 3: Search with empty keyword field
    Given the user enters an empty keyword into the title search field
    When the user submits the search
    Then the system should retrieve and display the complete list of all available books in the library

  Scenario: Scenario 4: Search with non-matching keyword
    Given the user enters a keyword that does not match any book titles
    When the user submits the search
    Then the system should display a message indicating that no results were found
