Feature: Order Service
  As a consumer,
  I want to place, revise, and cancel my orders
  So that I can have a seamless experience when interacting with the system

Scenario: Placing an order with a valid credit card
  Given that the consumer has a valid credit card
  When the consumer places an order with a valid credit card
  Then the order should be approved
  And an OrderAuthorized event should be published

Scenario: Placing an order with an expired credit card
  Given that the consumer has an expired credit card
  When the consumer attempts to place an order
  Then the order should be rejected
  And an OrderRejected event should be published

Scenario: Revising an order
  Given that the consumer has placed an order
  When the consumer revises the order
  Then the system should reflect the changes
  And the revised order should be confirmed

Scenario: Cancelling an order
  Given that the consumer has placed an order
  When the consumer cancels the order
  Then the order status should be updated to "canceled"
  And the order should no longer be processed
