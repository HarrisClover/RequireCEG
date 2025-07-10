Feature: Update Order Status to Canceled

  As a consumer
  I want to know if I can cancel my order
  So that I can make informed decisions about my purchases

  Background:
    Given an order is placed
    And the current status is 'confirmed'

  Scenario: Scenario 1: Successful Cancellation of Confirmed Order
    Given the order status is 'confirmed'
    And the order has not yet been processed
    When the consumer requests to cancel the order
    Then the order status should be updated to 'canceled'
    And an OrderCanceled event should be published

  Scenario: Scenario 2: Cancellations Are Not Accepted
    Given the order status is 'processed'
    When the consumer requests to cancel the order
    Then the cancellation request should be rejected
    And the consumer is notified with the message 'Your order cannot be canceled at this stage.'

  Scenario: Scenario 3: Cancellation Rejected Post Denial by Restaurant
    Given the restaurant has indicated they are no longer accepting cancellations
    When the consumer requests to cancel the order
    Then the cancellation request should be rejected
    And the consumer is notified with the message 'Your order cannot be canceled at this stage.'

  Scenario Outline: Scenario Outline: Cancellations Based on Status
    Given the order status is '<order-status>'
    When the consumer requests to cancel the order
    Then the outcome should be '<expected-outcome>'
    Examples:
      | order-status | expected-outcome |
      | confirmed | Order status should be updated to 'canceled' and an OrderCanceled event should be published |
      | processed | Cancellation request should be rejected and the consumer is notified with the message 'Your order cannot be canceled at this stage.' |
      | not accepting cancellations | Cancellation request should be rejected and the consumer is notified with the message 'Your order cannot be canceled at this stage.' |

