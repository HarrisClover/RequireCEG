Feature: Addition Functionality

  As a user of the calculator
  I want to perform addition operations with valid numeric inputs
  So that I can calculate sums effectively and access my calculation history

  Background:
    Given the calculator is ready for input
    And the user is aware of the valid input requirements

  Scenario: Valid Single-Digit Addition
    Given a user inputs a single-digit number 5
    And the user is prompted to input a second number
    When the user inputs another single-digit number 3
    Then the calculator should display 'Result: 8'
    And the history should include '5 + 3 = 8'

  Scenario: Valid Double-Digit Addition
    Given a user inputs a double-digit number 12
    And the user is prompted to input a second number
    When the user inputs another double-digit number 27
    Then the calculator should display 'Result: 39'
    And the history should include '12 + 27 = 39'

  Scenario: Invalid First Input
    Given a user inputs a non-numeric character 'A'
    When the system processes the input
    Then the calculator should display 'Invalid input. Please enter a valid number.'

  Scenario: Adding to History
    Given the user has previously calculated 4 + 5 = 9
    When the user triggers the history command
    Then the calculator should display '4 + 5 = 9'

  Scenario: Multiple Valid Additions with Numeric Input
    Given the user inputs a valid number 7
    And the user is prompted for the second valid number 2
    When the user inputs 2
    Then the calculator should display 'Result: 9'
    And the history should include '7 + 2 = 9'

  Scenario: Multiple Valid Additions with Double-Digit Input
    Given the user inputs a valid number 15
    And the user is prompted for the second valid number 20
    When the user inputs 20
    Then the calculator should display 'Result: 35'
    And the history should include '15 + 20 = 35'

  Scenario Outline: Scenario Outline: Multiple Valid Additions
    Given the user inputs a valid number <first>
    And the user is prompted for the second valid number <second>
    When the user inputs <second>
    Then the calculator should display 'Result: <result>'
    And the history should include '<first> + <second> = <result>'
    Examples:
      | first | second | result |
      | 7 | 2 | 9 |
      | 15 | 20 | 35 |
      | 8 | 4 | 12 |

