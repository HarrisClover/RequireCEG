Feature: Random Number Generator UI
  As an end user,
  I want to generate random numbers within specified limits
  So that I can use them for my application needs

  Scenario: Generating a random number within limits
    Given the user is on the random number generator page
    When the user specifies the limits as "1" and "100"
    And the user requests a random number
    Then the displayed number should be between "1" and "100"

