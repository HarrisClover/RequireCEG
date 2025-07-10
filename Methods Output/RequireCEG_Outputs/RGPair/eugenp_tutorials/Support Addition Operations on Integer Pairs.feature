Feature: Support Addition Operations on Integer Pairs

  As a system user
  I want to perform addition of two integers with validation
  So that I can successfully add valid integer pairs while following rules

  Background:
    Given the user session is active
    And the user has not exceeded five addition requests

  Scenario: Scenario 1: Both inputs are valid integers
    Given the first input is 4
    And the second input is 5
    When the user performs the addition operation
    Then the result should be 9
    And a confirmation message should be displayed

  Scenario: Scenario 2: One input is negative
    Given the first input is -3
    And the second input is 5
    When the user performs the addition operation
    Then an error message should indicate that both integers must be positive

  Scenario: Scenario 3: Both inputs are 'X' or 'Y' but one is non-positive
    Given the first input is 'X'
    And the second input is -2
    When the user performs the addition operation
    Then an error message should indicate that both integers must be positive

  Scenario: Scenario 4: Session limit reached on addition requests, no further requests allowed
    Given the user has submitted five addition requests
    When the user attempts to perform another addition request
    Then a message should indicate that a maximum of five requests is allowed per session

  Scenario: Scenario 5: Both inputs are 'A' and 'B'
    Given the first input is 'A'
    And the second input is 'B'
    When the user performs the addition operation
    Then the result should be displayed as A + B

  Scenario Outline: Scenario Outline: Inputs are alphanumeric characters A and B
    Given the first input is <firstInteger>
    And the second input is <secondInteger>
    When the user performs the addition operation
    Then the result should be <result>
    Examples:
      | firstInteger | secondInteger | result |
      | A | B | A + B |
      | 2 | 3 | 5 |
      | 4 | 5 | 9 |

