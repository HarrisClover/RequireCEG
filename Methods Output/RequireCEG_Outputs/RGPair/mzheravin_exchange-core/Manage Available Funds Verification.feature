Feature: Manage Available Funds Verification

  As a client of the trading system
  I want to ensure my orders do not exceed available funds and trading limits
  So that I can place and manage my orders without facing unexpected errors

  Background:
    Given the client has a defined trading limit and available funds
    And the trading system has all necessary order types configured

  Scenario: Scenario 1: Valid GTC Order Placement
    Given the client has sufficient funds available for the new order
    And the total value of open orders plus the new order does not exceed the trading limit
    When the client attempts to place a GTC order
    Then the order is placed successfully
    And the client's available funds are updated accordingly

  Scenario: Scenario 2: GTC Order Placement Exceeds Trading Limit
    Given the client has open orders that total to $1000
    And the total value of open orders including the new order exceeds the trading limit
    When the client attempts to place a GTC order of $600
    Then an error message is displayed
    And indicates a trading limit breach

  Scenario: Scenario 3: Valid IOC Order Placement
    Given the client has sufficient funds for the IOC order portion
    And the client's available funds are enough to fulfill the IOC order immediately
    When the client attempts to place an IOC order
    Then the order is placed successfully

  Scenario: Scenario 4: Insufficient Funds for IOC Order
    Given the client has only $50 available
    When the client attempts to place an IOC order of $100
    Then an error message is displayed
    And indicates insufficient funds

  Scenario: Scenario 5: Modifying Existing Order
    Given the client modifies an existing order
    And the new price of the order causes total open orders to exceed available funds
    When the client submits the modified order
    Then an error message is displayed
    And the order modification is prevented

  Scenario: Scenario 6: Order Cancellation Impact on Funds Adjustment Logic Check (C10 and E5 Improvement Scenario)
    Given the client has placed an order of $200
    When the client cancels the order
    Then the client's available funds increase by $200
    And the correct adjustment is reflected in their available funds

  Scenario Outline: Scenario Outline: Order Cancellation Impact on Funds
    Given the client has placed an order of <order-value>
    When the client cancels the order
    Then the client's available funds increase by <order-value>
    Examples:
      | order-value |
      | $200 |
      | $350 |
      | $1000 |

