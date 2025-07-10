Feature: Order Management (Modification and Cancellation)
  As a client of the exchange,
  I want to modify the price of my active orders or cancel them entirely,
  So that I can react to market changes or correct mistakes.

  Background:
    Given the exchange system is operational
    And client "Alice" is logged in
    And client "Alice" has the following initial balances:
      | Currency | Amount |
      | USD      | 10000  |
      | BTC      | 2.0    |
    And client "Alice" has placed a GTC "bid" order "bid5" for "BTC/USD" with size 0.5 at price 9000 USD
    And client "Alice" has placed a GTC "ask" order "ask5" for "BTC/USD" with size 1.0 at price 9500 USD
    And client "Alice"'s balances reflect the reserved funds/assets for these orders
    And the order book contains "bid5" and "ask5"

  Scenario: Successfully cancel an active bid order
    When client "Alice" cancels order "bid5"
    Then order "bid5" should be removed from the active order list
    And the order book for "BTC/USD" should no longer contain "bid5"
    And client "Alice"'s reserved USD balance for "bid5" (4500 USD) should be released
    And client "Alice"'s USD balance should return to 10000 (assuming only ask5 remains)

  Scenario: Successfully cancel an active ask order
    When client "Alice" cancels order "ask5"
    Then order "ask5" should be removed from the active order list
    And the order book for "BTC/USD" should no longer contain "ask5"
    And client "Alice"'s reserved BTC balance for "ask5" (1.0 BTC) should be released
    And client "Alice"'s BTC balance should return to 2.0 (assuming only bid5 remains)

  Scenario: Successfully modify the price of an active bid order (no additional funds needed)
    When client "Alice" modifies the price of order "bid5" to 8900 USD
    Then order "bid5" should remain active with the updated price 8900 USD
    And the order book for "BTC/USD" should reflect "bid5" at the new price 8900 USD (potentially changing its priority)
    And client "Alice"'s reserved USD balance should be adjusted to 4450 USD (0.5 * 8900)
    And client "Alice"'s available USD balance should increase by 50 USD

  Scenario: Attempt to modify the price of an active bid order requiring more funds than available
    Given client "Alice"'s available USD balance is 100 USD (after placing other orders)
    When client "Alice" attempts to modify the price of order "bid5" (original price 9000, size 0.5) to 9300 USD
    # Original reservation: 4500 USD. New required reservation: 4650 USD. Needs 150 USD more.
    Then the modification request should be rejected with reason "RISK_NSF"
    And order "bid5" should remain unchanged in the active order list and order book (price 9000 USD)
    And client "Alice"'s balances should remain unchanged from before the modification attempt

  Scenario: Attempt to cancel an already filled or non-existent order
    Given order "bid5" has been fully executed
    When client "Alice" attempts to cancel order "bid5"
    Then the cancellation request should be rejected (e.g., "Order not found" or "Order already filled")
    And client "Alice"'s balances should remain unchanged

