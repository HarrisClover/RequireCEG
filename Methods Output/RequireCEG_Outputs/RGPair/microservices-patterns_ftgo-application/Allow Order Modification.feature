Feature: Allow Order Modification

  As a consumer
  I want to place and modify my order
  So that I can adjust my order as needed before confirmation

  Background:
    Given the restaurant is currently accepting orders
    And the consumer has provided a valid credit card

  Scenario: Scenario 1: Place an Order Successfully
    Given the consumer has selected items for the order
    When the consumer places the order
    Then the order is processed successfully
    And the system publishes an OrderAuthorized event

  Scenario: Scenario 2: Place an Order with Expired Credit Card
    Given the consumer attempts to place an order with an expired credit card
    When the order is submitted
    Then the order is rejected
    And the system publishes an OrderRejected event with a credit card issue message

  Scenario: Scenario 3: Modify an Order within Allowed Time
    Given a valid order exists
    When the consumer wishes to revise the order within the allowed time frame
    Then the order is updated to reflect the changes
    And the consumer is notified of the successful update

  Scenario: Scenario 4: Cancel an Order
    Given a valid order exists
    When the consumer decides to cancel the order
    Then the order status is changed to 'canceled'
    And the consumer receives confirmation of the cancellation

  Scenario Outline: Scenario Outline: Order Modification Timing
    Given the consumer has placed an order
    And the time elapsed is <time-elapsed>
    When the consumer attempts to modify the order
    Then the modification is <validity>
    Examples:
      | time-elapsed | validity |
      | <30 minutes> | valid |
      | <1 hour> | valid |
      | >1 hour | invalid |


  Scenario: Scenario 5: Revise Order Beyond Allowed Time
    Given a valid order exists
    When the consumer wishes to revise the order beyond the allowed time frame
    Then the order modification is rejected
    And the consumer is notified that modifications are no longer allowed
