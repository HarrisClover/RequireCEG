Feature: Calculator Operations

  As a user of the calculator
  I want to ensure that only numeric inputs are accepted and calculated properly
  So that I can perform calculations without making errors

  Background:
    Given the calculator is ready for input
    And the user understands the input requirements

  Scenario: Valid single-digit addition
    Given the user inputs the numbers 3 and 5
    When the user selects the addition operation
    Then the result should be 8

  Scenario: Valid addition with double-digit and single-digit
    Given the user inputs the numbers 12 and 8
    When the user selects the addition operation
    Then the result should be 20

  Scenario: Handle invalid non-numeric input
    Given the user inputs 'a' and 5
    When the user attempts to perform any operation
    Then the output should be 'Invalid input, please enter numeric values only.'

  Scenario: Multiple operations with history
    Given the user inputs 10 and 5
    When the user performs addition and then subtraction by entering 3
    Then the result should be 12
    And the history should show '10 + 5 = 15, 15 - 3 = 12'

  Scenario: Ensure ongoing result updates after each operation
    Given the user inputs a series of operations: 2, 3, and 4
    When the user performs addition then multiplication by entering 2
    Then the ongoing result should reflect the operations correctly as 10

  Scenario: Ensure retrieval of calculation history
    Given the user inputs numbers 4 and 6, and performs addition
    When the user requests the history after the operation
    Then the history should show '4 + 6 = 10'

  Scenario: Ensure calculator does not allow computations with non-numeric values
    Given the user inputs 'NaN' and 5
    When the user attempts to perform any operation
    Then the output should be 'Invalid input, please enter numeric values only.'
