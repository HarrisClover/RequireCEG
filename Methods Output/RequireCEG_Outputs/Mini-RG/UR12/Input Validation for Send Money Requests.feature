Feature: Input Validation for Send Money Requests

  As a user of the money transfer system
  I want to be able to send money without exceeding limits based on my age
  So that I can ensure compliance with the system's rules

  Background:
    Given a user logs into the system
    And the user has an age of <age>

  Scenario: Scenario 1: Adult sending money
    Given the user is classified as an adult
    When the user attempts to send an amount of <amount>
    Then the transaction should be completed successfully
    And no limitations are applied

  Scenario: Scenario 2: Non-adult sending within limit
    Given the user is classified as a non-adult
    When the user attempts to send an amount of <amount>
    Then the transaction should be completed successfully
    And the user is informed that they can only send up to 20 euros.

  Scenario: Scenario 3: Non-adult exceeding limit
    Given the user is classified as a non-adult
    When the user attempts to send an amount greater than 20 euros
    Then the system should present an error message stating, 'You can only send up to 20 euros as a non-adult.'

  Scenario: Scenario 4: Non-adult attempting to withdraw money
    Given the user is classified as a non-adult
    When the user attempts to withdraw money
    Then the system should display a message indicating, 'Only adults can withdraw money.'

  Scenario: Scenario 5: Adult attempting to withdraw money
    Given the user is classified as an adult
    When the user attempts to withdraw money
    Then the transaction should be completed successfully
    And no limitations are applied

  Scenario Outline: Scenario Outline: Non-adult sending various amounts
    Given the user is classified as a non-adult
    When the user attempts to send an amount of <amount>
    Then the system should return <expected-outcome>
    Examples:
      | amount | expected-outcome |
      | 15 euros | transaction successful |
      | 20 euros | transaction successful |
      | 25 euros | error: You can only send up to 20 euros as a non-adult. |

