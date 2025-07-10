Feature: Division Functionality

  As a user of the calculator
  I want to perform division operations with proper handling of invalid inputs and errors
  So that I can obtain reliable results and understand potential issues

  Background:
    Given the calculator is initialized
    And the user is ready to input numbers

  Scenario: Division by zero
    Given the user inputs a dividend of 100
    And the user inputs a divisor of 0
    When the user attempts to divide
    Then the calculator displays 'Division by zero is not allowed'
    And the result is not calculated

  Scenario: Division with negative divisor
    Given the user inputs a dividend of 50
    And the user inputs a divisor of -5
    When the user divides the numbers
    Then the calculator displays the result as -10
    And the calculator presents a warning message: 'Note: Division by negative numbers may yield unexpected results'

  Scenario: Valid division with positive numbers
    Given the user inputs a dividend of 20
    And the user inputs a divisor of 4
    When the user divides the numbers
    Then the calculator displays the result as 5.00
    And the division operation is prioritized over others

  Scenario: Attempt to divide invalid decimal numbers
    Given the user inputs a dividend of 0.5
    And the user inputs a divisor of 0.0
    When the user attempts to divide
    Then the calculator displays 'Division by zero is not allowed'
    And the result is not calculated

  Scenario: Valid division with negative dividend
    Given the user inputs a dividend of -50
    And the user inputs a divisor of 2
    When the user divides the numbers
    Then the calculator displays the result as -25.00

  Scenario Outline: Multiple division operations
    Given the user inputs <dividend>
    And the user inputs <divisor>
    When the user performs the division and additional operations
    Then the calculator displays the result as <result>
    Examples:
      | dividend | divisor | result |
      | 100 | 2 | 50.00 |
      | 75 | -3 | -25.00 |
      | 0 | 10 | 0.00 |
      | -50 | -5 | 10.00 |

