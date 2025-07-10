Feature: Basic Calculator Functionality
  As a user,
  I want to perform arithmetic operations using a calculator
  So that I can carry out basic mathematical tasks efficiently

Scenario Outline: Perform arithmetic operations
  Given the calculator is activated
  When the user enters the number <num1>
  And the user selects the operation <operation>
  And the user enters the number <num2>
  Then the result should be <result>

Examples:
  | num1 | operation | num2 | result |
  | 5    | addition  | 3    | 8      |
  | 10   | subtraction | 4  | 6      |
  | 7    | multiplication | 6  | 42     |
  | 20   | division  | 4    | 5      |

Scenario Outline: Handle incorrect input
  Given the calculator is activated
  When the user enters the number <num1>
  And the user selects the operation <operation>
  And the user enters the number <num2>
  Then the calculator should display an error message "Invalid input" for <error-type>

Examples:
  | num1 | operation  | num2 | error-type      |
  | 10   | division   | 0    | division by zero |
  | abc  | addition   | 5    | non-numeric input |
  | 15   | subtraction | xyz  | non-numeric input |
