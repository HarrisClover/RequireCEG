Feature: Support clear interaction cues for users during searches

  As a user
  I want to receive clear feedback when searching for books
  So that I can easily find the books I am looking for

  Background:
    Given the user is on the book search page
    And the database contains three books

  Scenario: Scenario 1: Search by Publication Year
    Given a user initiates a search by publication year
    When the user specifies the publication year
    Then the system displays a message confirming the number of books found for the publication year search

  Scenario: Scenario 2: Search by Specific Author
    Given a user searches for a specific author
    When the user specifies the author's name
    Then the system responds with a list of titles available from the specified author

  Scenario: Scenario 3: Keyword Search - Awesome
    Given a user performs a keyword search for 'Awesome'
    When the user submits the keyword
    Then the system notifies the user that two results are available for the keyword 'Awesome'

  Scenario: Scenario 4: Keyword Search - Cool
    Given a user performs a keyword search for 'cool'
    When the user submits the keyword
    Then the system notifies the user that one result is available for the keyword 'cool'

  Scenario: Scenario 5: Combined Search Criteria
    Given a user combines multiple search criteria
    When the user submits the combined search
    Then the system prioritizes the results according to the order of combined search criteria and provides the corresponding message related to the resultant titles

  Scenario: Scenario 6: Complete List of Books
    Given a user accesses the complete list of books
    When the user does not apply any search filters
    Then the system affirms that there are three books available in total when accessed without any search filters
