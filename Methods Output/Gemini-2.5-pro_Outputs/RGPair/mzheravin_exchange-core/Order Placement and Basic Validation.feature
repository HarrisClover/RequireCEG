Feature: Order Placement and Basic Validation
  As a client of the exchange,
  I want to place bid and ask orders with specific parameters,
  So that I can participate in the market, ensuring my orders respect my balances and limits.

  Background:
    Given the exchange system is operational
    And client "Alice" is logged in
    And client "Alice" has the following initial balances:
      | Currency | Amount |
      | USD      | 10000  |
      | BTC      | 2.0    |
    And client "Alice" has standard trading limits

  Scenario Outline: Placing a valid order successfully reserves funds/assets
    Given the order book for "BTC/USD" is empty
    When client "Alice" places a <OrderType> "<Side>" order for "BTC/USD" with size <Size> and price <Price> <QuoteCurrency>
    Then the order should be accepted and assigned an Order ID
    And client "Alice" should see the active order in their order list
    And client "Alice"'s balances should be updated to reflect the reserved <ReservedCurrency> amount of <ReservedAmount>
    And the public order book for "BTC/USD" should show the new <Side> order at <Price> with size <Size>

    Examples:
      | OrderType | Side | Size | Price | QuoteCurrency | ReservedCurrency | ReservedAmount |
      | GTC       | bid  | 0.5  | 9000  | USD           | USD              | 4500           | # 0.5 * 9000 USD reserved
      | GTC       | ask  | 1.0  | 9100  | USD           | BTC              | 1.0            | # 1.0 BTC reserved

  Scenario Outline: Attempting to place an order exceeding available balance (RISK_NSF)
    Given client "Alice" has the following balances:
      | Currency | Amount |
      | USD      | 1000   |
      | BTC      | 0.1    |
    When client "Alice" attempts to place a GTC "<Side>" order for "BTC/USD" with size <Size> and price <Price> <QuoteCurrency>
    Then the order placement should be rejected with reason "RISK_NSF"
    And client "Alice"'s balances should remain unchanged:
      | Currency | Amount |
      | USD      | 1000   |
      | BTC      | 0.1    |
    And client "Alice" should not see the failed order in their active order list

    Examples:
      | Side | Size | Price | QuoteCurrency | # Required | # Available |
      | bid  | 0.2  | 9000  | USD           | 1800 USD   | 1000 USD    |
      | ask  | 0.5  | 9100  | USD           | 0.5 BTC    | 0.1 BTC     |

  Scenario: Placing an Immediate Or Cancel (IOC) order that cannot be immediately filled
    Given the order book for "BTC/USD" has no matching asks below 9100 USD
    When client "Alice" places an IOC "bid" order for "BTC/USD" with size 0.1 and price 9000 USD
    Then the order should be rejected or cancelled immediately as it cannot be filled
    And client "Alice"'s balances should remain unchanged
    And client "Alice" should not see the IOC order in their active order list
    And the order book for "BTC/USD" should remain unchanged by this IOC attempt