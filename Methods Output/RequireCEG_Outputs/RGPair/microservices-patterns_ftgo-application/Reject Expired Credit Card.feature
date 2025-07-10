Feature: Reject Expired Credit Card

  As a consumer
  I want to ensure my order is processed with a valid credit card
  So that I can successfully place my order without delays

  Background:
    Given the consumer attempts to place an order using a credit card
    And the current date is checked against the credit card's expiry date

  Scenario: Scenario 1: Place order with valid credit card
    Given the consumer has a valid credit card
    When the consumer places an order
    Then the order should be authorized
    And an 'OrderAuthorized' event should be published

  Scenario: Scenario 2: Place order with expired credit card
    Given the consumer has an expired credit card
    When the consumer attempts to place an order
    Then the order should be rejected
    And an 'OrderRejected' event should be generated

  Scenario: Scenario 3: Revise order with expired credit card
    Given the consumer has a valid credit card for their original order
    When the consumer tries to revise the order using an expired credit card
    Then the revision attempt should be rejected
    And the original order remains intact and unchanged

  Scenario: Scenario 4: Attempt to place an order without any valid card
    Given the consumer has no valid credit card
    When the consumer attempts to place an order
    Then the order should be rejected
    And an 'OrderRejected' event should be generated

  Scenario Outline: Scenario Outline: Validate credit card
    Given the consumer has declared their credit card status as <card-status>
    And the expiration date is <expiry-date>
    When the system processes the card for <action>
    Then the outcome should be <result>
    Examples:
      | card-status | expiry-date | action | result |
      | valid | 2025-12 | order placement | order authorized |
      | expired | 2021-05 | order placement | order rejected |
      | valid | 2024-01 | revision | revision processed |
      | expired | 2023-06 | revision | revision rejected |

