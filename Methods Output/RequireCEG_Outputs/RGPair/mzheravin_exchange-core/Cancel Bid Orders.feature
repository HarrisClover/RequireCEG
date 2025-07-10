Feature: Cancel Bid Orders

  As a client
  I want to initiate a cancellation request for an active bid order
  So that I can manage my active orders effectively

  Background:
    Given the client has an active bid order in the order book
    And the client is logged into the system

  Scenario: Scenario 1: Successful cancellation of an unexecuted order
    Given the client submits a cancellation request for the active bid order
    When the order is still in the order book and has not been partially matched or fully executed
    Then the order should be removed from the order book
    And the client's balance should be updated accordingly

  Scenario: Scenario 2: Partial cancellation of a matched order
    Given the client submits a cancellation request for a partially matched order
    When the request is for the unmatched portion
    Then only the unmatched portion should be canceled
    And the matched portion should remain active in the order book

  Scenario: Scenario 3: Cancellation request exceeding trading capacity
    Given the client submits a cancellation request that exceeds their current trading limits
    When the system processes the cancellation request
    Then an error message should be displayed stating 'Insufficient trading capacity'

  Scenario: Scenario 4: Cancellation of a request after order is matched
    Given the client submits a cancellation request for an order that has already been partially matched
    When the request is processed
    Then only the unmatched portion should be canceled
    And the matched portion should remain active in the order book

  Scenario Outline: Scenario Outline: Canceling bid orders based on conditions
    Given the client has <order-status> bid orders
    And the cancellation request does not exceed <trading-limit>
    When the client requests cancellation for <cancellation-portion>
    Then the order status should reflect <expected-status>
    Examples:
      | order-status | trading-limit | cancellation-portion | expected-status |
      | active | $1000 | full | canceled |
      | partially matched | $500 | unmatched | partially canceled |
      | active | $200 | full | canceled |

