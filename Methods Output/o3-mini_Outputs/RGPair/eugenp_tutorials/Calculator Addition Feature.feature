Feature: Calculator Addition Feature
  As an end user,
  I want to perform addition of two integers
  So that I can quickly calculate sums

  Scenario Outline: Adding two integers
    Given the calculator is ready for use
    When the user adds <number1> and <number2>
    Then the result should be <result>

    Examples:
      | number1 | number2 | result |
      | 5       | 10      | 15     |
      | -3      | 7       | 4      |
      | 0       | 0       | 0      |

