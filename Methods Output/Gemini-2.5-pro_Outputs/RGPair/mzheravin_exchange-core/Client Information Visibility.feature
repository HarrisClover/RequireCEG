Feature: Client Information Visibility
  As a client of the exchange,
  I want to view my current balances, active orders, and the public order book,
  So that I can make informed trading decisions and track my activity.

  Background:
    Given the exchange system is operational
    And client "Alice" is logged in

  Scenario: Viewing initial state
    Given client "Alice" has initial balances:
      | Currency | Amount |
      | USD      | 5000   |
      | BTC      | 1.0    |
    And client "Alice" has no active orders
    When client "Alice" requests their balances
    Then the system should display:
      | Currency | Amount |
      | USD      | 5000   |
      | BTC      | 1.0    |
    When client "Alice" requests their active orders
    Then the system should display an empty list of active orders
    When client "Alice" requests the public order book for "BTC/USD"
    Then the system should display the current state of bids and asks (e.g., potentially empty or showing other clients' orders)

  Scenario: Viewing state after placing an order
    Given client "Alice" has initial balances:
      | Currency | Amount |
      | USD      | 5000   |
      | BTC      | 1.0    |
    And client "Alice" successfully places a GTC "bid" order "bid6" for "BTC/USD" with size 0.2 at price 9200 USD
    When client "Alice" requests their balances
    Then the system should display updated balances reflecting the reserved USD (e.g., USD available might be 5000 - 1840 = 3160)
    When client "Alice" requests their active orders
    Then the system should display "bid6" in the list with its details (size 0.2, price 9200)
    When client "Alice" requests the public order book for "BTC/USD"
    Then the system should display the order book including "bid6"

  Scenario: Viewing state after an order is partially filled
    Given client "Alice" had an active GTC "bid" order "bid7" for "BTC/USD" with size 0.5 at price 9300 USD
    And 0.3 of "bid7" gets executed against an incoming ask
    When client "Alice" requests their balances
    Then the system should display balances reflecting the executed trade (BTC increased by 0.3, USD decreased by 0.3*9300) and the remaining reserved USD for the order (0.2*9300)
    When client "Alice" requests their active orders
    Then the system should display "bid7" with the remaining size 0.2
    When client "Alice" requests the public order book for "BTC/USD"
    Then the system should display the order book reflecting the updated state of "bid7" (size 0.2)

  Scenario: Viewing state after cancelling an order
    Given client "Alice" had an active GTC "ask" order "ask6" for "BTC/USD" with size 0.8 at price 9400 USD
    And client "Alice" successfully cancels order "ask6"
    When client "Alice" requests their balances
    Then the system should display balances reflecting the released BTC (0.8 BTC becomes available again)
    When client "Alice" requests their active orders
    Then the system should not display "ask6" in the list
    When client "Alice" requests the public order book for "BTC/USD"
    Then the system should display the order book without "ask6"