Feature: Search for Books by Title

  As a customer
  I want to search for a book title in the bookstore
  So that I can find detailed information about the book I am interested in

  Background:
    Given the user is on the bookstore search page
    And the user has an internet connection

  Scenario: Scenario 1: Empty Title Input
    Given the search input is empty
    When the user attempts to search
    Then a message prompting the user to enter a title to search is displayed
    And the database is not queried

  Scenario: Scenario 2: Title Exists
    Given the user enters a valid book title
    When the user submits the search
    Then detailed information about the book is displayed
    And the information includes the title, author, and availability status
    And the system performs search handling in a case-insensitive manner

  Scenario: Scenario 3: Title Does Not Exist
    Given the user enters a book title that does not exist in the database
    When the user submits the search
    Then a message indicating that no results were found for the given title is displayed

  Scenario: Scenario 4: Case Insensitivity
    Given the user enters a book title in various cases
    When the user submits the search
    Then the system retrieves and displays the correct book details regardless of the case

  Scenario: Scenario 5: Search Handling Required
    Given the user enters a book title
    When the user submits the search
    Then the system must handle the search in a case-insensitive manner
