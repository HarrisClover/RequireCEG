Feature: Calculator Addition Functionality
  As a User
  I want to add two integers using the calculator feature
  So that I can get their accurate sum

  Scenario Outline: Adding two integers
    Given the calculator feature is available
    When I provide the first integer <num1>
    And I provide the second integer <num2>
    And I request the addition operation
    Then the calculated result should be <sum>

    Examples:
      | num1 | num2 | sum  |
      | 5    | 7    | 12   |
      | -10  | 25   | 15   |
      | 0    | 99   | 99   |
      | -5   | -8   | -13  |
      | 1234 | 5678 | 6912 |

