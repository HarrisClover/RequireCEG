Feature: Calculator System

  As a user of the calculator
  I want to perform addition operations with both single and multiple numbers
  So that I can easily compute results and view the history of my calculations

  Background:
    Given the calculator is operational
    And the user is ready to input numbers

  Scenario: Scenario 1: Single number addition
    Given the user inputs a single number 5
    When the user selects addition
    Then the system computes and displays the sum of the single number and zero
    And the history includes 5

  Scenario: Scenario 2: Two single-digit numbers addition
    Given the user inputs the numbers 3 and 4
    When the user selects addition
    Then the system calculates the sum of the two single-digit numbers and presents the result
    And the history includes 7

  Scenario: Scenario 3: Single-digit and double-digit numbers addition
    Given the user inputs the numbers 2 and 15
    When the user selects addition
    Then the system calculates the sum of the single-digit and double-digit number and presents the result
    And the history includes 17

  Scenario: Scenario 4: Invalid input handling for letters inputted instead of numbers
    Given the user inputs the letter 'a'
    When the user selects addition
    Then the system displays 'Invalid input, please enter a number'
    And the history remains unchanged

  Scenario: Scenario 5: Successful calculation history view
    Given the user has calculated multiple sums before
    When the user requests to view history
    Then the system displays the history of all valid calculations performed during the session

  Scenario: Scenario 6: Reset calculator history
    Given the user has performed several calculations
    When the user selects the reset option
    Then the system clears all stored entries, effectively resetting the calculator's history
    And the history should be empty

  Scenario: Scenario 7: Ensure history shows correctly after a calculation
    Given the user inputs 10 and 5 and selects addition
    When the system calculates the sum
    Then the history should include 15 displayed correctly

  Scenario: Scenario 8: History not populated after invalid input
    Given the user inputs 'x' and selects addition
    When the system handles the invalid input
    Then the history should not include any result from this attempt
