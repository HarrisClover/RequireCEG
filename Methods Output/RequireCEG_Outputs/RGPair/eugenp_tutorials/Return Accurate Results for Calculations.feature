Feature: Return Accurate Results for Calculations

  As a user
  I want to input two integers for addition and receive accurate results
  So that I can ensure correctness in my calculations

  Background:
    Given the system is ready to accept integer inputs
    And the limits for input values are set between -1000 and 1000

  Scenario: Scenario 1: Adding two positive integers
    Given the user inputs the integers 5 and 10
    When the user requests the sum
    Then the result should be 15

  Scenario: Scenario 2: Adding a positive and a negative integer
    Given the user inputs the integers 8 and -3
    When the user requests the sum
    Then the result should be 5

  Scenario: Scenario 3: Adding zero and a positive integer
    Given the user inputs the integers 0 and 20
    When the user requests the sum
    Then the result should be 20

  Scenario: Scenario 4: Adding zero and a negative integer
    Given the user inputs the integers 0 and -15
    When the user requests the sum
    Then the result should be -15

  Scenario: Scenario 5: First input is out of range
    Given the user inputs the integers 1500 and 50
    When the user requests the sum
    Then the system should return an error message indicating the inputs are out of range

  Scenario: Scenario 6: Second input is out of range
    Given the user inputs the integers -500 and 1100
    When the user requests the sum
    Then the system should return an error message indicating the inputs are out of range

  Scenario: Scenario 7: Non-integer input provided
    Given the user inputs a non-integer value 'abc' and 30
    When the user requests the sum
    Then the system should provide an error message detailing the need for proper input formats

  Scenario: Scenario 8: Adding two zeros
    Given the user inputs the integers 0 and 0
    When the user requests the sum
    Then the result should be 0

  Scenario: Scenario 9: First input is negative and out of range
    Given the user inputs the integers -1001 and 10
    When the user requests the sum
    Then the system should return an error message indicating the inputs are out of range
