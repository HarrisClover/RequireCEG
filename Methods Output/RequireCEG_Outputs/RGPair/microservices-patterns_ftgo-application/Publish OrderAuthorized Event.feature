Feature: Publish OrderAuthorized Event

  As a restaurant owner
  I want to process orders securely using valid credit cards
  So that I can ensure timely payments and notify the system of order status changes

  Background:
    Given that the restaurant is accepting orders
    And the system has access to the consumer's credit card information

  Scenario: Scenario 1: Successful Order with Valid Credit Card
    Given a consumer provides a valid credit card
    When the consumer places an order
    Then the order is authorized
    And a confirmation is sent to the consumer
    And an OrderAuthorized event is published

  Scenario: Scenario 2: Order Rejection with Expired Credit Card
    Given a consumer provides an expired credit card
    When the consumer attempts to place an order
    Then the order is rejected due to an expired credit card
    And a rejection message is sent to the consumer
    And an OrderRejected event is published

  Scenario: Scenario 3: Order Rejection when Credit Card is Not Expired but Not Capable of Processing
    Given a consumer provides a non-expired credit card that cannot process payments
    When the consumer attempts to place an order
    Then the order is rejected
    And the consumer is informed about the rejection
    And an OrderRejected event is published

  Scenario Outline: Scenario Outline: Check Credit Card Validity
    Given a consumer's credit card is <credit-card-status>
    When the consumer tries to place an order
    Then the order should be <order-status>
    And an event should be published as <event-type>
    Examples:
      | credit-card-status | order-status | event-type |
      | valid | authorized | OrderAuthorized |
      | expired | rejected | OrderRejected |
      | non-capable | rejected | OrderRejected |

