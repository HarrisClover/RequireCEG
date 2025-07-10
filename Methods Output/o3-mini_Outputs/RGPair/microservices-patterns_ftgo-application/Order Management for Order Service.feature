Feature: Order Management for Order Service
As a consumer,
I want to be able to place, revise, and cancel orders efficiently,
So that I can have a seamless experience when interacting with the Order Service.

Scenario for placing an order with a valid credit card
Scenario: Place an order with a valid credit card
Given a consumer has valid credentials
And the consumer provides a valid credit card
When the consumer places an order while the restaurant is accepting orders
Then the order is approved
And an OrderAuthorized event is published

Scenario for handling an order placement using an expired credit card
Scenario: Reject an order with an expired credit card
Given a consumer has valid credentials
And the consumer provides an expired credit card
When the consumer attempts to place an order
Then the order is rejected
And an OrderRejected event is published

Scenario for revising an existing order
Scenario: Revise an existing order
Given an order has been successfully placed
When the consumer revises the order details
Then the system reflects the updated order details

Scenario for cancelling an existing order
Scenario: Cancel an existing order
Given an order has been successfully placed
When the consumer cancels the order
Then the order status updates to canceled