Feature: Random Number Generation UI
  As a User
  I want to generate a random number within specified limits using the UI
  So that I can obtain a random value for various purposes

  Scenario Outline: Generate a random number within valid limits
    Given I am on the random number generation page in the UI
    When I enter <min> as the minimum limit
    And I enter <max> as the maximum limit
    And I trigger the random number generation
    Then a random number should be displayed
    And the generated number should be greater than or equal to <min>
    And the generated number should be less than or equal to <max>

    Examples:
      | min | max |
      | 1   | 10  |
      | 0   | 100 |
      | -50 | 50  |
