Feature: Single-Digit Input

  As a calculator user
  I want to input a single-digit number and perform arithmetic operations
  So that I can carry out basic calculations easily

  Background:
    Given the calculator is ready for input
    And there is a history list to record previous entries

  Scenario: Valid Single-Digit Input
    Given a user inputs a digit
    When the input is '5'
    Then the digit '5' should be displayed on the screen
    And the history list should contain '5'

  Scenario: Invalid Input - Character
    Given a user inputs a character
    When the input is 'A'
    Then an error message should be displayed saying 'Invalid input. Please enter a single-digit number between 0 and 9.'

  Scenario: Invalid Input - Out of Range
    Given a user inputs a number outside the range
    When the input is '10'
    Then an error message should be displayed saying 'Invalid input. Please enter a single-digit number between 0 and 9.'

  Scenario: Input with Valid Arithmetic Operation
    Given the user has entered the valid digit '7'
    When the user inputs an arithmetic operation '+'
    Then the screen should be cleared for the next operation

  Scenario: Input with Invalid Arithmetic Operation
    Given the user has entered the valid digit '7'
    When the user inputs an invalid operation '$'
    Then an error message should be displayed saying 'Invalid input. Please enter a single-digit number followed by a valid arithmetic operation.'

  Scenario Outline: Multiple Valid Inputs
    Given the user has input a single-digit number <digit>
    When the user inputs the operation '<operation>'
    Then the digit '<digit>' should be displayed and stored in history
    Examples:
      | digit | operation |
      | 3 | + |
      | 4 | - |
      | 2 | * |
      | 5 | / |

