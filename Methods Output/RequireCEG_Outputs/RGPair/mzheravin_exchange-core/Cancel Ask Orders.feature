Feature: Cancel Ask Orders

  As a client
  I want to cancel an active order
  So that I can reclaim my funds if I'm no longer interested in the order

  Background:
    Given the client has an active order
    And the client's available balance is sufficient

  Scenario: Scenario 1: Successful Order Cancellation
    Given the order status is active
    When the client requests to cancel the order
    Then the order should be removed from the public order book
    And the client's available balance should be updated by adding the size of the canceled order
    And a confirmation message is displayed indicating the order has been successfully canceled

  Scenario: Scenario 2: Order Not Active
    Given the order status is filled or previously canceled
    When the client attempts to cancel this order
    Then an error message is displayed: 'Order cannot be canceled as it is either filled or has been previously canceled.'

  Scenario: Scenario 3: Insufficient Balance for Cancellation
    Given the order status is active
    And the client does not have sufficient balance to cover the order size
    When the client attempts to cancel the order
    Then an error message is displayed: 'Cancellation not allowed: order size exceeds available balance.'

  Scenario: Scenario 4: Cancellation Share Invalid Orders Case without Activation Context Check (Mutual Exclusion Case Check for active order and its mutual canceling existence with other statuses.)
    Given the order status is canceled by the client
    When the client attempts to cancel the order
    Then an error message is displayed: 'Order cannot be canceled as it is either filled or has been previously canceled.'

  Scenario Outline: Scenario Outline: Various Cancellation Scenarios
    Given the order status is <order-status>
    And the client's available balance is <available-balance>
    When the client attempts to cancel the order
    Then the expected outcome is <expected-outcome>
    Examples:
      | order-status | available-balance | expected-outcome |
      | active | $500 | order should be successfully canceled |
      | filled | $1000 | error message displayed: 'Order cannot be canceled as it is either filled or has been previously canceled.' |
      | active | $50 | error message displayed: 'Cancellation not allowed: order size exceeds available balance.' |

