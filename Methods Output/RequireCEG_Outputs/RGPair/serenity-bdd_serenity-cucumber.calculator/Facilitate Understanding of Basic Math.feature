Feature: Facilitate Understanding of Basic Math

  As a student
  I want to perform arithmetic operations easily and efficiently
  So that I can enhance my mathematical understanding and skills

  Background:
    Given the calculator is activated
    And the calculator is in an immediately usable state

  Scenario: Valid input for addition
    Given a user inputs '15'
    When the user performs the addition operation
    Then the result should be '15'
    And the calculator is ready for the next input

  Scenario: Invalid input with letters
    Given a user inputs '10a'
    When the user attempts to perform an operation
    Then the system displays 'Invalid input. Please enter numbers only.'

  Scenario: Exceeding double-digit range
    Given a user inputs '100'
    When the user attempts to perform an operation
    Then the system displays 'Input exceeds the allowed range. Please input a number between 0 and 99.'

  Scenario: Performing addition and subtraction operations
    Given a user starts with '10'
    When the user inputs '+5', '-3', and then '+2'
    Then the intermediate result should be '15'
    And the final result should be '17'

  Scenario: Invalid input message handling
    Given a user inputs a non-number
    When the user attempts to perform an operation
    Then the system displays 'Invalid input. Please enter numbers only.'
    And the calculator is still ready for another valid input

  Scenario: Viewing calculation history
    Given a user has performed several calculations
    When the user requests to see the history
    Then the calculator should display a list of all previous calculations

  Scenario: Requesting calculation history
    Given the user wants to see prior calculations
    When the user requests a history of prior calculations
    Then the calculator should display a list of prior calculations

  Scenario Outline: Input Validation Scenarios
    Given a user inputs <input>
    When the user tries to perform an operation
    Then the system should return <output>
    Examples:
      | input | output |
      | 15 | 15 |
      | 10a | Invalid input. Please enter numbers only. |
      | 100 | Input exceeds the allowed range. Please input a number between 0 and 99. |

