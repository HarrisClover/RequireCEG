Feature: Graceful Handling of Errors

  As a calculator user
  I want to receive clear error messages when input is invalid
  So that I can correct my input and successfully perform calculations

  Background:
    Given the calculator system is operational
    And I have access to the user interface

  Scenario: Invalid input: Non-numeric value
    Given the user enters 'abc' as input
    When the user attempts to perform the calculation
    Then the system displays 'Invalid input: Please enter a numeric value.'

  Scenario: Division by zero
    Given the user enters a number '10'
    When the user attempts to divide '10' by '0'
    Then the system displays 'Error: Division by zero is not allowed.'

  Scenario: Missing input: Second number
    Given the user enters the first number '7'
    When the user attempts to add without providing a second number
    Then the system displays 'Missing input: Please provide the second number.'

  Scenario: Single-digit limits exceeded
    Given the user enters the number '12'
    When the user attempts to perform any operation
    Then the system displays 'Error: Only single-digit numbers are accepted.'

  Scenario: Valid input and operation
    Given the user inputs <first-number>
    And provides the second number <second-number>
    When the user performs <operation>
    Then the system displays the result <result>
    Examples:
      | first-number | second-number | operation | result |
      | 5 | 3 | addition | 8 |
      | 7 | 2 | subtraction | 5 |
      | 4 | 4 | multiplication | 16 |
      | 9 | 3 | division | 3 |


  Scenario: Valid input with zero
    Given the user enters '0'
    And the user attempts to perform any arithmetic operation
    When the user enters valid second number
    Then the system displays the result based on the operation requested
