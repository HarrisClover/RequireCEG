Feature: Order Service
  As a consumer,
  I want to place, revise, and cancel orders,
  So that I can have a seamless experience interacting with the Order Service.

Scenario: Place an order with a valid credit card
  Given the consumer has a valid credit card
  And the restaurant is accepting orders
  When the consumer places an order
  Then the order should be approved
  And an "OrderAuthorized" event should be published

Scenario: Place an order with an expired credit card
  Given the consumer has an expired credit card
  And the restaurant is accepting orders
  When the consumer attempts to place an order
  Then the order should be rejected
  And an "OrderRejected" event should be published

Scenario: Revise an existing order
  Given the consumer has placed an order
  When the consumer revises the order
  Then the system should reflect the changes made to the order

Scenario: Cancel an order
  Given the consumer has placed an order
  When the consumer cancels the order
  Then the order status should be updated to "canceled"
