Feature: Place Ask Order

  As a client
  I want to place ask orders with assurance of sufficient balance and adherence to trading limits
  So that I can confidently manage my trades without encountering unexpected errors

  Background:
    Given the client has an account with a specified balance and trading limits
    And the system is online and operational

  Scenario: Successful Placement of Ask Order
    Given the client has sufficient balance and the order adheres to trading limits
    When the client places a GTC order
    Then the order should be recorded in the public order book
    And the client's active orders should be updated to reflect the new order

  Scenario: Failed Placement Due to Insufficient Funds
    Given the client has insufficient balance
    When the client attempts to place an ask order
    Then an error message should be presented indicating insufficient funds

  Scenario: Failed Placement Due to Limit Breach
    Given the client's order exceeds specified trading limits
    When the client attempts to place an ask order
    Then an error message should be presented indicating limit breach

  Scenario: Modification of Ask Order
    Given the client has an unfilled ask order
    And the client's account has a sufficient balance and the order adheres to trading limits
    When the client decides to modify their ask order with a new price or size
    Then the system should re-evaluate the order against trading limits and available balance
    And the client's active orders should be updated if the modified order is acceptable

  Scenario: Cancellation of Ask Order - GTC
    Given the client has an active GTC ask order
    When the client decides to cancel the ask order
    Then the order should be removed from the order book
    And the client's balance should be updated accordingly

  Scenario: Cancellation of Ask Order - IOC
    Given the client has an active IOC ask order
    When the client decides to cancel the ask order
    Then the order should be removed from the order book
    And the client's balance should be updated accordingly

  Scenario: Review Active Orders and Balances
    Given the client has placed ask orders
    When the client reviews their active orders
    Then the client can see their active orders and updated balances

  Scenario: Attempt to Fill IOC Order
    Given the system attempts to fill the IOC order against the existing order book
    When there is a match in the order book
    Then the order should be filled according to the available orders
    And the client's balance should be adjusted accordingly
