Feature: Exchange Order Management
  As a client,
  I want to place, manage, and cancel orders on the exchange,
  So that I can trade effectively while ensuring my orders are valid and meet risk requirements.

Scenario Outline: Place and Manage Orders
  Given that the client is logged into the system
  And the client has a balance of <balance> and trading limit of <limit>
  When the client places an order with type <order-type>, price <price>, and size <size>
  Then the order should be added to the order book
  And the client’s balance should be updated accordingly
  And the order book should reflect the current bids and asks
  And the system should check for trading limits to ensure the order is valid
  And if the order exceeds the limit, it should be rejected with error <error-message>
  
Scenario Outline: Cancel an Order
  Given that the client has placed an order with type <order-type>, price <price>, and size <size>
  When the client cancels the order
  Then the order should be removed from the order book
  And the client’s balance should be updated to reflect the cancellation
  And the order book should no longer show the canceled order

Scenario Outline: Match Orders and Execute Trades
  Given that the client has placed a <order-type> order with price <price> and size <size>
  And there is an opposing order in the order book that matches the price and size
  When the system matches the orders
  Then the trade should be executed fully or partially, based on available quantity
  And the client’s balance should be updated accordingly
  And the order book should reflect the trade execution
  
Examples:
  | balance | limit | order-type | price | size | error-message |
  | $500    | $1000 | GTC        | $150  | 5   | "Exceeds limit" |
  | $1000   | $5000 | IOC        | $250  | 10  | "Valid order" |
