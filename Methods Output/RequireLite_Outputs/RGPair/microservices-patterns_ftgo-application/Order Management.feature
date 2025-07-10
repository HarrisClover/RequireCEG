Feature: Order Management

  As a consumer
  I want to place, revise, and cancel orders efficiently
  So that I can have a seamless experience when interacting with the Order Service

  Background:
    Given the system is accepting orders
    And a consumer has a valid credit card

  Scenario: Scenario 1: Place an order with a valid credit card
    Given a consumer logs into the system
    When the consumer places an order with a valid credit card
    Then the order should be approved
    And an OrderAuthorized event should be published

  Scenario: Scenario 2: Attempt to place an order with an expired credit card
    Given a consumer logs into the system
    When the consumer attempts to place an order with an expired credit card
    Then the order should be rejected
    And an OrderRejected event should be published

  Scenario: Scenario 3: Revise an order after placement
    Given a consumer has placed an order successfully
    When the consumer revises the order to change the delivery address
    Then the system should reflect the new delivery address

  Scenario: Scenario 4: Cancel an order
    Given a consumer has placed an order successfully
    When the consumer cancels the order
    Then the order status should be updated to canceled
    And the consumer should receive a cancellation confirmation

  Scenario Outline: Scenario Outline: Place orders with different credit cards
    Given the system is accepting orders
    When the consumer attempts to place an order with a <card-type> credit card
    Then the order should be <order-status>
    Examples:

