Feature: Store Previous Entries

  As a user
  I want to keep a history of my addition operations
  So that I can track my calculations and learn from mistakes

  Background:
    Given the calculator is initialized
    And the user has not set a flag to save operations

  Scenario: Single addition operation logs correctly
    Given the user inputs the number 5
    When the user adds it to the number 7
    Then the result should be 12
    And the history should contain the entry '5 + 7 = 12'

  Scenario: Double addition operation logs correctly
    Given the user inputs the numbers 10 and 20
    When the user adds these two numbers
    Then the result should be 30
    And the history should contain the entry '10 + 20 = 30'

  Scenario: Inputting three numbers triggers an error
    Given the user inputs the numbers 5, 10, and 15
    When the user attempts to add them together
    Then an error message should be displayed saying 'Only single or double-digit additions are allowed'

  Scenario: Viewing the entry history when no operations performed
    Given the user requests to view the entry history
    Then the entry history should be empty

  Scenario: Saving all operations with a flag
    Given the user sets a flag to save all operations
    And the user inputs 3 and 4
    When the user adds the numbers
    Then the result should be 7
    And the history should contain the entry '3 + 4 = 7'

  Scenario: Error display for invalid input on three numbers
    Given the user sets a flag to save all operations
    And the user inputs 5, 10, and 15
    When the user attempts to add them together
    Then an error message should be displayed saying 'Only single or double-digit additions are allowed'
