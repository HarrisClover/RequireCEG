Feature: Basic Calculator Functionality
  As a user, particularly students,
  I want to perform arithmetic operations using a basic calculator
  So that I can complete my math homework and understand basic arithmetic

  Background:
    Given the calculator is accessible immediately upon activation
    And the calculator maintains a history of previous entries

  Scenario Outline: Perform basic arithmetic operations and record history
    Given the user inputs "<first-number>" and "<second-number>"
    When the user selects the "<operation>" operation
    Then the calculator should display the result "<result>"
    And the operation "<first-number> <symbol> <second-number> = <result>" is added to the history

    Examples:
      | first-number | second-number | operation      | symbol | result |
      | 3            | 5             | addition       | +      | 8      |
      | 10           | 5             | subtraction    | -      | 5      |
      | 4            | 6             | multiplication | *      | 24     |
      | 20           | 4             | division       | /      | 5      |

  Scenario: Handle single-digit arithmetic operations
    Given the user inputs "7" and "3"
    When the user selects the "addition" operation
    Then the calculator should display the result "10"
    And the calculator history should include the operation "7 + 3 = 10"

  Scenario: Handle double-digit arithmetic operations
    Given the user inputs "15" and "20"
    When the user selects the "multiplication" operation
    Then the calculator should display the result "300"
    And the calculator history should include the operation "15 * 20 = 300"

  Scenario: Graceful handling of incorrect inputs
    Given the user inputs "abc" and "5"
    When the user selects the "addition" operation
    Then the calculator should display an error message "Invalid input. Please enter valid numbers."
    And the calculator history should not record this failed operation

  Scenario: Sequential arithmetic operations
    Given the user performs a valid operation "8 + 2 = 10"
    And the user then performs a valid operation "10 - 4 = 6"
    When the user reviews the calculation history
    Then the history should display both "8 + 2 = 10" and "10 - 4 = 6" in the order they were executed
