Feature: Support user feedback mechanism for result accuracy

  As a customer searching for books
  I want to receive feedback options when search results do not meet expectations
  So that my feedback can help improve the search accuracy for future users

  Background:
    Given the search system is operational
    And the customer is logged into the system

  Scenario: Scenario 1: No results for publication year
    Given a customer searches for books by the year 2023
    When no books are found for that year
    Then the system should display 'No books were found for the year 2023.'

  Scenario: Scenario 2: Author search with unsatisfactory results
    Given a customer searches for books by an author
    And the results do not meet their expectations
    When the customer views the results
    Then the system should present a feedback form
    And the feedback form should capture their comments

  Scenario: Scenario 3: Title search with satisfactory results
    Given a customer searches for a book title
    When the search yields results
    Then the system should display 'Total results found: [number].'
    And the system should prompt 'Are these results satisfactory? (Yes/No).'

  Scenario: Scenario 4: Title search with unsatisfactory results
    Given a customer searches for a book title
    When the search yields results
    And the customer selects 'No'
    Then the system should provide an option to submit specific feedback
    And the feedback should be logged for review

  Scenario: Scenario 5: Title with satisfactory results
    Given a customer searches for a book title
    When the search yields results that meet the user's expectations
    Then the system should offer the user a prompt
    And the prompt should be 'Are these results satisfactory? (Yes/No).'
