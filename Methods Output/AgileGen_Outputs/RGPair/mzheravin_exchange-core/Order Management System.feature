Feature: Order Management System
  As a client,
  I want to place, manage, and cancel bid and ask orders,
  So that I can trade effectively while respecting my trading limits and balances.

Scenario Outline: Placing and managing orders
  Given that the client has an active account with a balance of <balance>
  And the client is logged into the system
  When the client places a <order-type> order with a price of <order-price> and a size of <order-size>
  Then the order should be added to the order book
  And the client's balance should be adjusted accordingly
  Or the order should not exceed the client's trading limit

  Examples:
    | order-type | order-price | order-size | balance |
    | GTC        | $100        | 10         | $2000   |
    | IOC        | $50         | 20         | $1500   |

Scenario Outline: Modifying an existing order
  Given that the client has an active order with order ID <order-id> and a price of <existing-price>
  And the client wants to modify the price of the order to <new-price>
  When the client submits the modification request
  Then the order's price should be updated to <new-price>
  Or the client's balance should reflect any necessary adjustments

  Examples:
    | order-id | existing-price | new-price |
    | 12345    | $100           | $90      |
    | 67890    | $200           | $180     |

Scenario Outline: Handling partial order matches
  Given that the client has placed an order with a price of <order-price> and a size of <order-size>
  And a matching order exists in the order book
  When the order is partially matched
  Then the order size should be reduced to <remaining-size>
  Or the client's balance should reflect the partial execution

  Examples:
    | order-price | order-size | remaining-size |
    | $100        | 10         | 5              |
    | $50         | 20         | 15             |

Scenario Outline: Cancelling an order
  Given that the client has an active order with order ID <order-id>
  When the client cancels the order
  Then the order should be removed from the order book
  Or the client's balance should be restored to the original amount

  Examples:
    | order-id |
    | 12345    |
    | 67890    |

Scenario Outline: Risk check for unauthorized order placement
  Given that the client has a balance of <balance>
  And the client is trying to place an order with a price of <order-price> and a size of <order-size>
  When the client submits the order
  Then the system should check for sufficient funds
  Or the system should reject the order if it exceeds the client's available balance

  Examples:
    | balance | order-price | order-size |
    | $500    | $200        | 3          |
    | $1000   | $300        | 5          |
