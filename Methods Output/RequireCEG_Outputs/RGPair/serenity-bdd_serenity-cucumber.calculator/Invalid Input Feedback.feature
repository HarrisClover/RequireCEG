Feature: Invalid Input Feedback

  As a user of the system
  I want to receive appropriate feedback based on my input
  So that I can correct my mistakes and successfully perform operations

  Background:
    Given the user is prompted to enter numeric values
    And the user has the option to select different operations

  Scenario: Invalid Input: Non-numeric values
    Given the user inputs 'abc'
    When the system processes the input
    Then the output should be 'Invalid input. Please enter numbers only.'

  Scenario: Zero Division Error
    Given the user selects division
    When the user inputs the divisor as '0'
    Then the output should be 'Cannot divide by zero. Please enter a valid divisor.'

  Scenario: Input Exceeds Maximum Value
    Given the user inputs '100' for a double-digit operation
    When the system processes the input
    Then the output should be 'Input exceeds maximum value. Please enter a number from 0 to 99.'

  Scenario: Missing Numbers for Operation
    Given the user selects addition
    When the user provides only one number
    Then the output should be 'Both numbers must be provided for the operation. Please input two valid numbers and select an operation.'

  Scenario: Result Display Limit Exceeded
    Given the user inputs numbers that sum up to '200'
    When the addition operation is performed
    Then the output should be 'Result is too large to display. Please try with smaller numbers.'

  Scenario: Invalid Input: Combination of Numeric and Non-numeric values
    Given the user inputs '50abc'
    When the system processes the input
    Then the output should be 'Invalid input. Please enter numbers only.'

  Scenario: Valid Input for Addition
    Given the user inputs '30' and '20' for addition
    When the addition operation is performed
    Then the correct sum should be displayed.
