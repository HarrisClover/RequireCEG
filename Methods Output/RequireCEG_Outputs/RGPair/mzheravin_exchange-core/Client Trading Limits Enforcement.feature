Feature: Client Trading Limits Enforcement

  As a client
  I want the system to verify my available balance and trading limits when placing an order
  So that I can ensure that my order is valid and within my financial capabilities

  Background:
    Given the client has a defined available balance and trading limits
    And the client is logged into the system

  Scenario: Placing an order exceeding available balance
    Given the client has an available balance of $500
    When the client attempts to place an order for $600
    Then the system should display an error message
    And the error message should indicate 'Insufficient Funds'

  Scenario: Placing an order exceeding trading limit
    Given the client has a trading limit of $1000
    When the client attempts to place an order for $1200
    Then the system should display an error message
    And the error message should indicate 'Limit Exceeded'

  Scenario: Placing a valid GTC order
    Given the client has an available balance of $1000
    And the client has a trading limit of $1500
    When the client places a GTC order for $300
    Then the system should add the order to the public order book

  Scenario: Placing a valid IOC order with partial match
    Given the client has an available balance of $1000
    And the public order book has matching orders
    When the client places an IOC order for $300
    Then the system should execute the matching portion of the order
    And the remaining portion should be canceled

  Scenario: Modifying an active order within limits
    Given the client has an active order of $200
    And the client has an available balance of $1000
    When the client modifies the order to $150
    Then the system should accept the modification

  Scenario: Modifying an active order exceeding limits
    Given the client has an active order of $200
    And the client has an available balance of $100
    When the client modifies the order to $250
    Then the system should display an error message
    And the error message should indicate 'Insufficient Funds'

  Scenario: Canceling an active order
    Given the client has an active order for $300
    When the client cancels the order
    Then the system should remove the order from the order book
    And the client's balance should be adjusted accordingly

  Scenario: Modifying an order with a breach on price
    Given the client has an active order of $200
    And the client has reasonable expectations for the modified order price
    When the client modifies the order to $10000
    Then the system should display an error message regarding modified order breach

  Scenario: Modifying an order with a breach on size
    Given the client has an active order of $200
    And the client has a valid modification request
    When the client modifies the order size to 2000
    Then the system should display an error message regarding modified order breach

  Scenario Outline: Scenario Outline: Attempt to place an order
    Given the client has an available balance of <available-balance>
    And the client has a trading limit of <trading-limit>
    When the client attempts to place an order for <order-value>
    Then <expected-error-message>
    Examples:
      | available-balance | trading-limit | order-value | expected-error-message |
      | $200 | $300 | $400 | Insufficient Funds |
      | $500 | $1000 | $1200 | Limit Exceeded |
      | $1000 | $1500 | $600 | Order is placed successfully |

