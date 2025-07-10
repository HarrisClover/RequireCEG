Feature: Double-Digit Input

  As a user of the calculator system
  I want to input double-digit numbers and perform arithmetic operations
  So that I can achieve accurate results for my calculations

  Background:
    Given the system is running and ready to accept input
    And the user has been trained to enter valid double-digit numbers

  Scenario: Valid Double-Digit Input
    Given the user enters a valid double-digit number 45
    When the user selects the addition operation with another double-digit number 30
    Then the result should be 75
    And the history log should include '45 + 30 = 75'

  Scenario: Invalid Input - Letters
    Given the user enters the input 'AB'
    When the user attempts to perform any operation
    Then an error message should be displayed saying 'Input is not valid, please enter a double-digit number'

  Scenario: Invalid Input - Single-Digit Number
    Given the user enters the input '5'
    When the user attempts to perform any operation
    Then an error message should be displayed saying 'Input is not valid, please enter a double-digit number'

  Scenario: Valid Operations Followed by Sequential Operations
    Given the user enters a valid double-digit number 70
    And the user performs the operation subtract with another valid double-digit number 20
    When the user selects the operation multiply with the result of the previous operation
    Then the final result should be 1000

  Scenario: Memory Functionality for Previous Calculation
    Given the user performs a calculation
    When the system stores the result in memory
    Then the user can later access the previous calculation

  Scenario: History Log for Double-Digit Entries
    Given the user enters a valid double-digit number 60
    When the user selects the operation add with another double-digit number 25
    Then the history log should include '60 + 25 = 85'
    And the history log should show all previous calculations
