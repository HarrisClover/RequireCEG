Feature: Multiplication Functionality

  As a user of the calculator
  I want to perform multiplication operations with valid inputs
  So that I can obtain accurate results and easily understand the process

  Background:
    Given the user has access to the calculator
    And the calculator is ready to receive inputs

  Scenario: Scenario 1: Valid single-digit multiplication
    Given the user inputs 5
    And the user inputs 3
    When the user presses the multiply button
    Then the result should be 15
    And the history should show '5 * 3 = 15'

  Scenario: Scenario 2: Multiplication by zero
    Given the user inputs 0
    And the user inputs 7
    When the user presses the multiply button
    Then the result should be 0
    And the history should show '0 * 7 = 0'

  Scenario: Scenario 3: Invalid input handling
    Given the user inputs 'A'
    And the user inputs 8
    When the user presses the multiply button
    Then the outcome should be an error message indicating invalid input

  Scenario: Scenario 4: Chaining multiplication operations
    Given the user inputs 4
    And the user inputs 5
    When the user presses the multiply button
    Then the result should be 20
    And the user continues to multiply 20 by 2
    And the final result should be 40
    And the history should show '4 * 5 = 20' and '20 * 2 = 40'

  Scenario Outline: Scenario Outline: Valid double-digit multiplication
    Given the user inputs <first-number>
    And the user inputs <second-number>
    When the user presses the multiply button
    Then the outcome should be <result>
    Examples:
      | first-number | second-number | result |
      | 12 | 10 | 120 |
      | 23 | 45 | 1035 |
      | 34 | 56 | 1904 |


  Scenario Outline: Scenario Outline: Multiplying by one
    Given the user inputs <original-number>
    And the user inputs 1
    When the user presses the multiply button
    Then the outcome should be <original-number>
    Examples:
      | original-number |
      | 7 |
      | 19 |
      | 37 |

