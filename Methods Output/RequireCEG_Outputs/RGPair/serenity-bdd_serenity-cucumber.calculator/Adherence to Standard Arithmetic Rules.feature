Feature: Adherence to Standard Arithmetic Rules

  As a user of the calculator
  I want to perform arithmetic operations accurately with numeric inputs
  So that I can obtain correct results for my calculations

  Background:
    Given the calculator is open and ready for input
    And the user has valid numeric inputs

  Scenario: Valid addition operation
    Given the first input is 5
    And the second input is 3
    When the user selects addition
    Then the result should be 8
    And both inputs are numeric values

  Scenario: Invalid non-numeric input
    Given the first input is 'five'
    And the second input is 3
    When the user selects addition
    Then the result should be 'Invalid input, please enter numeric values only.'
    And the inputs are not numeric

  Scenario: Division by zero
    Given the first input is 10
    And the second input is 0
    When the user selects division
    Then the result should be 'Division by zero is not allowed.'
    And the selected operation is division

  Scenario: Valid subtraction operation
    Given the first input is 8
    And the second input is 5
    When the user selects subtraction
    Then the result should be 3
    And both inputs are numeric values

  Scenario: Valid multiplication operation
    Given the first input is 4
    And the second input is 3
    When the user selects multiplication
    Then the result should be 12
    And both inputs are numeric values

  Scenario: History of calculations if multiple operations
    Given the user has executed three operations previously
    When the user requests the history
    Then the history should show the last three calculations
