Feature: Match Orders Against Public Order Book

  As a client
  I want to place bid or ask orders in a trading system
  So that my orders can be matched with existing orders for efficient trading

  Background:
    Given the order book contains existing bid and ask orders
    And the client has an available balance for trading

  Scenario: Scenario 1: Successful Bid Order Placement
    Given a client places a bid order with a price that meets or exceeds the existing ask price
    And the client has sufficient funds
    When the order is submitted
    Then a transaction is executed
    And the client's and counterparty's balances are updated accordingly

  Scenario: Scenario 2: Bid Order Rejection Due to Insufficient Funds
    Given a client places a bid order with a price that exceeds their available funds
    When the order is submitted
    Then the order is rejected
    And an alert message indicating insufficient funds is displayed

  Scenario: Scenario 3: Partial Order Fulfillment
    Given a client places a bid order that partially matches existing ask orders
    When the order is executed
    Then the matched portion of the order is fulfilled
    And the remaining portion is retained in the order book for future matches

  Scenario: Scenario 4: Rejecting Modified Bid Exceeding Trading Limits
    Given a client modifies an existing bid order with a new price exceeding trading limits
    When the modified order is submitted
    Then the modification is rejected
    And an error message is presented

  Scenario: Scenario 5: Immediate Execution of Ask Order
    Given a client places an ask order with a price lower than or equal to existing bid prices
    When the ask order is submitted
    Then a transaction is executed
    And all relevant balances are updated accordingly

  Scenario: Scenario 6: Order Cancellation
    Given a client requests to cancel an existing bid or ask order
    When the cancellation is processed
    Then the specified order is removed from the order book
    And the client's balance reflects this change

  Scenario: Scenario 7: Bid Execution Condition Check
    Given a client places a bid order with sufficient funds and the bid price meets the ask price
    When the system confirms order conditions
    Then the bid order is ready for execution

  Scenario: Scenario 8: Cancellation Condition Check
    Given a client requests to cancel a non-existing order
    When the cancellation is processed
    Then the cancellation fails
    And an error message indicating the order does not exist is displayed
