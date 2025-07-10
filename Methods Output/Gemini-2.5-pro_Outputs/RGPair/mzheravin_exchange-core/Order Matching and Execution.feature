Feature: Order Matching and Execution
  As the exchange system,
  I need to match compatible bid and ask orders from the order book,
  So that trades can be executed and client balances updated accordingly.

  Background:
    Given the exchange system is operational
    And client "Alice" is logged in with initial balances:
      | Currency | Amount |
      | USD      | 10000  |
      | BTC      | 1.0    |
    And client "Bob" is logged in with initial balances:
      | Currency | Amount |
      | USD      | 10000  |
      | BTC      | 1.0    |

  Scenario: Full match of a new bid against an existing ask
    Given client "Bob" has an active GTC "ask" order "ask1" for "BTC/USD" with size 0.5 at price 9500 USD
    And the order book reflects "ask1"
    When client "Alice" places a GTC "bid" order "bid1" for "BTC/USD" with size 0.5 at price 9500 USD
    Then order "bid1" should be fully executed against "ask1"
    And order "ask1" should be fully executed
    And client "Alice"'s balances should be updated to:
      | Currency | Amount |
      | USD      | 5250   | # 10000 - (0.5 * 9500)
      | BTC      | 1.5    | # 1.0 + 0.5
    And client "Bob"'s balances should be updated to:
      | Currency | Amount |
      | USD      | 14750  | # 10000 + (0.5 * 9500)
      | BTC      | 0.5    | # 1.0 - 0.5
    And the order book for "BTC/USD" should no longer contain "ask1" or "bid1"
    And both clients should see the trade execution details

  Scenario: Partial match of a new bid against an existing larger ask
    Given client "Bob" has an active GTC "ask" order "ask2" for "BTC/USD" with size 1.0 at price 9600 USD
    And the order book reflects "ask2"
    When client "Alice" places a GTC "bid" order "bid2" for "BTC/USD" with size 0.3 at price 9600 USD
    Then order "bid2" should be fully executed against "ask2"
    And order "ask2" should be partially executed with remaining size 0.7
    And client "Alice"'s balances should be updated to:
      | Currency | Amount |
      | USD      | 7120   | # 10000 - (0.3 * 9600)
      | BTC      | 1.3    | # 1.0 + 0.3
    And client "Bob"'s balances should be updated to:
      | Currency | Amount |
      | USD      | 12880  | # 10000 + (0.3 * 9600)
      | BTC      | 0.7    | # 1.0 - 0.3 (asset remains reserved for the rest of the order)
    And the order book for "BTC/USD" should show "ask2" with size 0.7 at price 9600 USD
    And client "Alice" should not see "bid2" in their active orders
    And client "Bob" should see "ask2" updated in their active orders

  Scenario: Partial match of a new larger bid against an existing smaller ask
    Given client "Bob" has an active GTC "ask" order "ask3" for "BTC/USD" with size 0.2 at price 9700 USD
    And the order book reflects "ask3"
    When client "Alice" places a GTC "bid" order "bid3" for "BTC/USD" with size 0.5 at price 9700 USD
    Then order "ask3" should be fully executed against "bid3"
    And order "bid3" should be partially executed with remaining size 0.3
    And client "Alice"'s balances should be updated to:
      | Currency | Amount |
      | USD      | 5150   | # 10000 - (0.5 * 9700) initially reserved, then 0.3*9700 remains reserved
      | BTC      | 1.2    | # 1.0 + 0.2
    And client "Bob"'s balances should be updated to:
      | Currency | Amount |
      | USD      | 11940  | # 10000 + (0.2 * 9700)
      | BTC      | 0.8    | # 1.0 - 0.2
    And the order book for "BTC/USD" should show "bid3" with size 0.3 at price 9700 USD
    And client "Bob" should not see "ask3" in their active orders
    And client "Alice" should see "bid3" updated in their active orders

  Scenario: IOC order partially filled, remainder cancelled
    Given client "Bob" has an active GTC "ask" order "ask4" for "BTC/USD" with size 0.1 at price 9800 USD
    And the order book reflects "ask4"
    When client "Alice" places an IOC "bid" order "bid4" for "BTC/USD" with size 0.3 at price 9800 USD
    Then order "bid4" should be partially executed against "ask4" for size 0.1
    And order "ask4" should be fully executed
    And the remaining size 0.2 of order "bid4" should be cancelled
    And client "Alice"'s balances should be updated to:
      | Currency | Amount |
      | USD      | 9020   | # 10000 - (0.1 * 9800)
      | BTC      | 1.1    | # 1.0 + 0.1
    And client "Bob"'s balances should be updated to:
      | Currency | Amount |
      | USD      | 10980  | # 10000 + (0.1 * 9800)
      | BTC      | 0.9    | # 1.0 - 0.1
    And the order book for "BTC/USD" should no longer contain "ask4" or any part of "bid4"
    And client "Alice" should not see "bid4" in their active orders