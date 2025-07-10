Feature: Subtraction Functionality

  As a user of the application
  I want to perform subtraction between two numeric inputs
  So that I can find the difference between the two numbers

  Background:
    Given the application is running
    And I have two numeric inputs

  Scenario: Valid Inputs - Positive Difference
    Given number1 is 10
    And number2 is 5
    When the user triggers the subtraction operation
    Then the result should be 5
    And the operation should be logged in history

  Scenario: Valid Inputs - Negative Difference
    Given number1 is 5
    And number2 is 10
    When the user triggers the subtraction operation
    Then the result should be -5
    And the operation should trigger a warning message indicating that the result is a negative value
    And the operation should be logged in history

  Scenario: Valid Inputs - Zero as Number1
    Given number1 is 0
    And number2 is 5
    When the user triggers the subtraction operation
    Then the operation should trigger a message notifying that the result is a negative value
    And the operation should be logged in history

  Scenario: Invalid Input - Non-Numeric
    Given number1 is 'abc'
    And number2 is 5
    When the user triggers the subtraction operation
    Then the application should display an error message indicating invalid input

  Scenario: Valid Inputs - Equal Numbers
    Given number1 is 100
    And number2 is 100
    When the user triggers the subtraction operation
    Then the result should be 0
    And the operation should be logged in history

  Scenario Outline: Scenario Outline: Valid Numeric Inputs
    Given number1 is <number1>
    And number2 is <number2>
    When the user triggers the subtraction operation
    Then the result should be <result>
    Examples:
      | number1 | number2 | result |
      | 15 | 10 | 5 |
      | 20 | 30 | -10 |
      | 100 | 100 | 0 |

