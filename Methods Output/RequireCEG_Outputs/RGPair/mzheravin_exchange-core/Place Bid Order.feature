Feature: Place Bid Order

  As a client
  I want to place bid orders within my trading limits and available funds
  So that I can effectively trade while ensuring compliance with my financial constraints

  Background:
    Given the client has sufficient funds
    And the client is within their trading limits

  Scenario: Scenario 1: Place GTC Order Successfully
    Given the client submits a GTC bid order
    When the order is accepted by the system
    Then the system places the bid order in the order book
    And the order is kept in the order book until filled or cancelled
    And the client's order status is updated

  Scenario: Scenario 2: Place IOC Order Successfully
    Given the client submits an IOC bid order
    When the system finds a matching ask order
    Then the trade is executed, fully or partially
    And the system updates the client's balance and order book after the trade

  Scenario: Scenario 3: Place Bid Order with Insufficient Funds
    Given the client attempts to place a bid order exceeding their available funds
    When the order is submitted
    Then an error message is displayed indicating insufficient funds
    And the system does not place the bid order

  Scenario: Scenario 4: Place Bid Order Exceeding Trading Limits
    Given the client attempts to place a bid order exceeding their trading limits
    When the order is submitted
    Then an error message is displayed indicating exceeding trading limits
    And the system does not place the bid order

  Scenario Outline: Scenario Outline: Modify Existing Bid Order
    Given the client has an existing bid order of <order-amount>
    And the client wants to modify this order within their trading limit of <trading-limit>
    When the modification request is submitted
    Then the system checks the client's portfolio and trading limits
    And the order is modified if within the limits
    Examples:
      | order-amount | trading-limit |
      | $500 | $1000 |
      | $300 | $400 |
      | $200 | $200 |

