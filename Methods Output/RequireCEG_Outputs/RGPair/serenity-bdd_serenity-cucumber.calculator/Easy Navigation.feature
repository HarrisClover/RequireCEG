Feature: Calculator Functionality

  As a user
  I want to have an intuitive calculator interface to perform basic arithmetic operations
  So that I can easily conduct calculations and track my history

  Background:
    Given the calculator is activated
    And the user is presented with input fields and operation buttons

  Scenario: Valid Input with Operation Selection
    Given the user inputs a valid number in the designated field
    And the operation buttons are visually highlighted
    When the user selects an operation
    Then the calculator computes the result
    And the outcome is displayed on the interface

  Scenario: Invalid Input Handling
    Given the user inputs a non-numeric value
    When the user attempts to select an operation
    Then an error message 'Invalid input, please enter a number' is displayed

  Scenario: Division by Zero Handling
    Given the user inputs a valid number in the field
    And the user selects division by a zero
    When the operation is executed
    Then an error message 'Cannot divide by zero, please choose a different operation' is displayed

  Scenario: Maintain History Log
    Given the user performs a series of calculations
    When the user clicks the 'View History' button
    Then a list of all past entries and results for the current session is presented

  Scenario: Guidance for Calculations
    Given the user interacts with the calculator
    When the user hovers over operation buttons
    Then the calculator provides tooltips or guidance on basic mathematical principles to assist the user

  Scenario: Valid Inputs and Operations Requirement
    Given the user inputs a valid number in the designated field
    When the user performs a series of operations
    Then the calculator maintains a history log of all previous calculations for the current session
    And the 'View History' feature displays previously calculated results

  Scenario: Exclusive Operation Trigger
    Given the user inputs a valid number in the designated field
    And the user inputs another valid number in the second field
    When the user selects an operation that does not include division
    Then the calculator successfully computes the result
