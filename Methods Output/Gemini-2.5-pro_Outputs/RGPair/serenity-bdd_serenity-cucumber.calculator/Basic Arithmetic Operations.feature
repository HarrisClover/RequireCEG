Feature: Basic Arithmetic Operations
  As a user
  I want to perform basic arithmetic calculations using the calculator
  So that I can get accurate results for my mathematical problems

  Background:
    Given the calculator application is open and ready for use

  Scenario Outline: Adding Numbers
    When I enter the first number "<Number1>"
    And I press the addition button
    And I enter the second number "<Number2>"
    And I press the equals button
    Then the displayed result should be "<Result>"

    Examples: Single and Double-Digit Addition
      | Number1 | Number2 | Result | Description           |
      | 5       | 3       | 8      | Single digit addition |
      | 15      | 8       | 23     | Double + Single digit |
      | 12      | 25      | 37     | Double digit addition |
      | 99      | 1       | 100    | Double digit boundary |

  Scenario Outline: Performing Various Arithmetic Operations
    When I enter the first number "<Number1>"
    And I press the "<Operator>" button
    And I enter the second number "<Number2>"
    And I press the equals button
    Then the displayed result should be "<Result>"

    Examples: Basic Operations
      | Number1 | Operator     | Number2 | Result | Description          |
      | 10      | subtraction  | 4       | 6      | Subtraction          |
      | 7       | multiplication | 6       | 42     | Multiplication       |
      | 20      | division     | 5       | 4      | Division             |
      | 55      | addition     | 11      | 66     | Double digit add     |
      | 90      | subtraction  | 25      | 65     | Double digit subtract|
      | 12      | multiplication | 10      | 120    | Double digit multiply|
      | 100     | division     | 10      | 10     | Double digit divide  |

  Scenario: Performing a Sequence of Operations
    When I enter the number "10"
    And I press the addition button
    And I enter the number "5"
    And I press the subtraction button
    And I enter the number "3"
    And I press the equals button
    Then the displayed result should be "12" # Assuming left-to-right evaluation or standard order if specified