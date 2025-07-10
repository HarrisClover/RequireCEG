Feature: Cancel Order Functionality

  As a consumer
  I want to initiate a cancellation request for my active order
  So that I can cancel my order if it hasn't been processed yet

  Background:
    Given a consumer has an active order
    And the order status is 'pending'

  Scenario: Scenario 1: Successful Cancellation of Pending Order
    Given the order status is 'pending'
    And the consumer requests to cancel the order
    When the system processes the cancellation request
    Then the order status should be updated to 'canceled'
    And a CancelOrder event should be triggered

  Scenario: Scenario 2: Rejected Cancellation of Processed Order
    Given the order status is 'processed'
    When the consumer requests to cancel the order
    Then the cancellation request should be rejected

  Scenario: Scenario 3: Error Message for Completed Order Cancellation Request
    Given the order status indicates it has already been processed or completed
    When the consumer requests to cancel the order
    Then an error message should be displayed stating that the order cannot be canceled

  Scenario Outline: Scenario Outline: Order Cancellation Based on Status
    Given the order status is '<order-status>'
    When the consumer requests to cancel the order
    Then the system should <expected-outcome>
    Examples:
      | order-status | expected-outcome |
      | pending | update order status to 'canceled' and trigger CancelOrder event |
      | processed | reject the cancellation request |
      | completed | display error message stating that the order cannot be canceled |

