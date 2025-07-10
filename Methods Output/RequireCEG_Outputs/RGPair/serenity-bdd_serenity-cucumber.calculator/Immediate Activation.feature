Feature: Calculator Operations

  As a user
  I want to perform arithmetic calculations
  So that I can easily compute numbers with immediate feedback

  Background:
    Given the calculator interface is launched
    And the user is prompted to enter calculations

  Scenario: Addition of two valid inputs
    Given the user inputs number one as 5
    And the user inputs number two as 3
    When the user selects the addition operation
    Then the application computes and displays the sum as 8
    And the calculator interface is presented instantly

  Scenario: Subtraction using valid inputs
    Given the user inputs number one as 7
    And the user inputs number three as 2
    When the user selects the subtraction operation
    Then the application computes and displays the difference as 5

  Scenario: Multiplication with double input
    Given the user inputs number two as 4
    When the user selects multiplication with the same input
    Then the application computes and displays the product as 16

  Scenario: Division with non-zero divisor
    Given the user inputs number two as 8
    And the user inputs number four as 2
    When the user selects the division operation
    Then the application computes and displays the quotient as 4

  Scenario: Division with zero divisor
    Given the user inputs number two as 10
    And the user inputs number four as 0
    When the user selects the division operation
    Then the application shows the message 'Cannot divide by zero'
    And the user is informed of invalid operations

  Scenario: Validation of input limits
    Given the user inputs number one as 100
    When the input is validated
    Then the application shows the message 'Please enter single or double-digit numbers only'

  Scenario: Show calculation history
    Given the user has performed several calculations
    When the user activates the show history flag
    Then the application displays the history of the last three calculations along with the latest result

  Scenario: Ensuring sum is computed only with valid inputs
    Given the user selects addition operation
    When the user inputs one valid number and one invalid number
    Then the application does not compute and displays an appropriate error message
