Feature: Basic Calculator Functionality

  As a student
  I want a calculator that performs arithmetic operations
  So that I can easily complete my math homework

  Background:
    Given the calculator application is activated
    And the user is able to access its functionalities immediately

  Scenario: Scenario 1: Single-digit addition
    Given the user inputs 5 and 3
    When the user selects the addition operation
    Then the result should be 8

  Scenario: Scenario 2: Double-digit addition
    Given the user inputs 25 and 30
    When the user selects the addition operation
    Then the result should be 55

  Scenario: Scenario 3: Handling incorrect input (non-numeric input)
    Given the user inputs 'a' and 4
    When the user selects the addition operation
    Then the calculator should display an error message

  Scenario: Scenario 4: Handling incorrect input (exceeding limits)
    Given the user inputs 9999999999 and 1
    When the user selects the addition operation
    Then the calculator should display an error message

  Scenario: Scenario 5: Handling decimal numbers
    Given the user inputs 2.5 and 3.5
    When the user selects the addition operation
    Then the result should be 6

  Scenario: Scenario 6: Handling division by zero
    Given the user inputs 15 and 0
    When the user selects the division operation
    Then the calculator should display an error message

  Scenario Outline: Scenario Outline: Various arithmetic operations
    Given the user inputs <first-number> and <second-number>
    When the user performs the operation
    Then the result should be <result>
    And the user selects the <operation>
    Examples:
      | first-number | second-number | operation | result |
      | 5 | 3 | addition | 8 |
      | 10 | 2 | subtraction | 8 |
      | 6 | 4 | multiplication | 24 |
      | 15 | 3 | division | 5 |
      | 7.5 | 2.5 | addition | 10 |
      | -5 | 3 | addition | -2 |

