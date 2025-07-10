Feature: Sequential Input of Operations

  As a user of the calculator system
  I want to perform calculations involving multiple operations sequentially
  So that I can efficiently compute results without restarting the system for each operation

  Background:
    Given the calculator system is ready for input
    And the operation history is empty

  Scenario: Single valid operation
    Given a user inputs the first number as 5
    And the user selects multiplication
    When the user inputs the second number as 4
    Then the result should be 20
    And the operation history should log the operation

  Scenario: Second number required error
    Given a user inputs the first number as 10
    And the user selects addition
    When the user does not input a second number
    Then an error message should be displayed saying 'A second number is required'
    And the system should not perform the operation

  Scenario: Invalid input error
    Given a user inputs the first number as 'a'
    When the system prompts for an operation selection
    Then an error message should be displayed saying 'Invalid input; please enter a valid number'
    And the system should not allow any operation to proceed

  Scenario: Chaining multiple operations
    Given a user performs an addition of 10 and 5
    And the result stored is 15
    When the user selects subtraction and inputs 3
    Then the new result should be 12
    And the operation history should reflect both operations

  Scenario: Input non-numeric characters error
    Given a user inputs the first number as 'abc'
    When the user selects addition
    Then an error message should be displayed saying 'Invalid input; please enter a valid number'
    And the system should not allow operation to proceed

  Scenario Outline: Multiple valid operations with stored results
    Given the user has performed an operation yielding <previous-result>
    And the user inputs <first-number>
    When the user selects <operation>
    And the user inputs <second-number>
    Then the new result should be <new-result>
    And the operation history should include both operations
    Examples:
      | previous-result | first-number | operation | second-number | new-result |
      | 10 | 5 | addition | 3 | 18 |
      | 15 | 4 | multiplication | 2 | 30 |
      | 12 | 8 | subtraction | 2 | 10 |

