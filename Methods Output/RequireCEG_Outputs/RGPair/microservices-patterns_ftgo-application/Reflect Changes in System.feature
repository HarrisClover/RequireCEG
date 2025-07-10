Feature: Order Processing System

  As a consumer
  I want to place an order, revise it or cancel it
  So that I can have my order processed correctly and efficiently

  Background:
    Given the restaurant is accepting orders
    And I have a valid credit card

  Scenario: Scenario 1: Successful Order Placement
    Given the consumer has selected items to order
    And the payment details are valid
    When the consumer places an order
    Then the order should be approved
    And the OrderAuthorized event should be published

  Scenario: Scenario 2: Order Rejection due to Expired Credit Card
    Given the consumer has a credit card that is expired
    When the consumer attempts to place an order
    Then the order should be rejected
    And the OrderRejected event should be published

  Scenario: Scenario 3: Revising an Order
    Given the consumer has an active order
    When the consumer revises their order
    Then the order details should be updated in real-time
    And the OrderAuthorized event should be published

  Scenario: Scenario 4: Canceling an Order
    Given the consumer wishes to cancel their order
    When the consumer initiates the cancellation
    Then the order status should be updated to 'canceled'
    And the consumer should receive clear communication about the order's cancellation status

  Scenario: Scenario 5: Cancellation Notification Requirement
    Given the consumer wants to cancel their order
    When the cancellation is processed
    Then the consumer should receive clear communication about the order's cancellation status

  Scenario Outline: Scenario Outline: Order Placement with Different Payment Methods
    Given the restaurant is accepting orders
    And the consumer has a <credit-card-status> credit card
    When the consumer tries to place an order using a <payment-method>
    Then <expected-outcome>
    Examples:
      | credit-card-status | payment-method | expected-outcome |
      | valid | credit card | order should be approved |
      | expired | credit card | order should be rejected |
      | valid | debit card | order should be approved |
      | invalid | payment method | order should be rejected |

