Feature: Basic Calculator Functionality
  As a user,
  I want to use a calculator for basic arithmetic operations
  So that I can perform calculations and track my history of operations

Scenario Outline: Performing an arithmetic operation
  Given the calculator is open and ready for use
  When I input "<input1>" and select the "<operation>" operation and input "<input2>"
  Then the result should be "<result>"
  And the history should contain "<history>"

  Examples:
    | input1 | operation | input2 | result | history         |
    | 5      | addition  | 3     | 8      | 5 + 3 = 8       |
    | 10     | subtraction | 4   | 6      | 10 - 4 = 6      |
    | 7      | multiplication | 2 | 14     | 7 * 2 = 14      |
    | 8      | division  | 4     | 2      | 8 / 4 = 2       |

Scenario: Handling incorrect input
  Given the calculator is open and ready for use
  When I input "10" and select the "division" operation and input "0"
  Then the result should be "Error: Division by Zero"
  And the history should contain "Error: Division by Zero"

Scenario: Viewing calculation history
  Given the calculator has performed several operations
  When I request the history
  Then the history should display the list of past calculations
  And the history should include:
    | 5 + 3 = 8      |
    | 10 - 4 = 6     |
    | 7 * 2 = 14     |
    | 8 / 4 = 2      |
