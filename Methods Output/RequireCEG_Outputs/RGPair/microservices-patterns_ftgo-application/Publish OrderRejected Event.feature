Feature: Publish OrderRejected Event

  As a store owner
  I want the system to validate credit cards independently after a rejection
  So that orders are only approved if valid and accepted

  Background:
    Given a customer has attempted to place an order
    And the credit card was rejected previously

  Scenario: Scenario 1: Validate expired credit card
    Given the customer attempts to place a new order
    And the customer's credit card is still expired
    When the system validates the credit card
    Then the order is rejected
    And the order rejected event is published

  Scenario: Scenario 2: Validate accepted credit card
    Given the customer attempts to place a new order
    And the customer's credit card is valid
    When the system validates the credit card
    Then the order is approved
    And the order approved event is published

  Scenario: Scenario 3: Repeated expiry rejection behavior
    Given the customer attempts to place a new order
    And the customer's credit card is still expired
    When the system checks the credit card validity
    Then the order is rejected
    And the order rejected event is published

  Scenario Outline: Scenario Outline: Repeated rejection attempts
    Given the customer continues to attempt ordering after a rejection
    And the credit card state is <card-state>
    When the system checks the credit card validity
    Then the order is <order-outcome>
    Examples:
      | card-state | order-outcome |
      | expired | rejected |
      | valid | approved |
      | expired | rejected |
      | valid | approved |

