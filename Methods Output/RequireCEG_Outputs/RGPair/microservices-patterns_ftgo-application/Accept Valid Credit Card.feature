Feature: Accept Valid Credit Card

  As a consumer
  I want to place an order using a valid credit card
  So that my order gets processed successfully

  Background:
    Given the restaurant is accepting orders
    And the consumer has a valid credit card

  Scenario: Scenario 1: Successful Order Authorization
    Given the consumer chooses items to order
    When the consumer places an order using a valid credit card
    Then the order will be processed successfully
    And an OrderAuthorized event is published

  Scenario: Scenario 2: Order Rejection due to Expired Card
    Given the consumer has an expired credit card
    When the consumer attempts to place an order
    Then the system will reject the order
    And an OrderRejected event is published

  Scenario: Scenario 3: Update Order After Placement
    Given the consumer has successfully placed an order with a valid credit card
    When the consumer makes changes to their order
    Then the system will accurately reflect these changes in order details

  Scenario: Scenario 4: Canceling an Order
    Given the consumer has placed an order using a valid credit card
    When the consumer chooses to cancel the order
    Then the system will update the order status to 'canceled'

  Scenario: Scenario 5: Order and Changes Conditions
    Given the consumer attempts to place an order using a valid credit card
    And the restaurant is accepting orders
    When the consumer makes changes to their order after it has been placed
    Then the system will accurately reflect the changes in the order details

  Scenario: Scenario 6: Attempting to Cancel an Order with an Expired Card
    Given the consumer has an expired credit card
    When the consumer attempts to cancel an order
    Then the system will not update the order status
