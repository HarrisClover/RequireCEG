Feature: Reference History during Calculations

  As a user of the calculator
  I want to perform calculations and keep track of my calculation history
  So that I can review my previous calculations while performing new ones

  Background:
    Given the calculator is open and ready to use
    And the user has not cleared the history

  Scenario: Scenario 1: Addition of two valid numbers
    Given the user inputs two valid numbers 5 and 10
    When the user selects the addition operation
    Then the result displayed should be 15
    And the history should include the entry '5 + 10 = 15'

  Scenario: Scenario 2: Subsequent operation using previous result
    Given the user has a previous result of 15
    When the user inputs 5 and selects the addition operation
    Then the result displayed should be 20
    And the history should include the entry '15 + 5 = 20'

  Scenario: Scenario 3: Invalid number input
    Given the user inputs an invalid number 'abc'
    When the user selects the addition operation
    Then an error message should be displayed stating 'Invalid input, please enter a valid number'
    And the history should remain unchanged

  Scenario: Scenario 4: Clearing the history
    Given the user has previous calculation entries in the history
    When the user selects the option to clear the history
    Then the message 'History cleared' should be displayed
    And the history should be empty

  Scenario: Scenario 5: Clear the calculation history
    Given the user accesses the calculation history
    When the user selects to clear the history
    Then the history should be empty
    And the message 'History cleared' should be displayed

  Scenario Outline: Scenario Outline: Validating History Access
    Given the user has performed <number> calculations
    When the user accesses the history
    Then the history should display all entries in chronological order
    Examples:
      | number | entry |
      | 2 | 5 + 10 = 15; 15 + 5 = 20 |
      | 3 | 5 + 10 = 15; 15 + 5 = 20; 20 + 5 = 25 |
      | 0 | No calculations available |

