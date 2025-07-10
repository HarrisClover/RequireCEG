Feature: Exchange Order Management
  As a client of the exchange,
  I want to be able to place, manage, and cancel both bid and ask orders
  So that the system accurately matches orders and maintains correct client balances.

  # Scenario: Placing a Bid Order
  # Clients should be allowed to place orders without exceeding their trading limits and with the proper risk checks.
  Scenario: Place a GTC bid order
    Given a client with a valid account balance and within trading limits
    When the client submits a Good-Til-Cancelled (GTC) bid order with a specified price and size
    Then the system should validate the order against client funds and trading limits
    And the order should appear in the public order book as an open bid
    And the client's balance should be reserved for the order amount

  # Scenario: Placing an Immediate-Or-Cancel (IOC) Ask Order
  # Immediate execution is expected for IOC orders, with any unmatched portion automatically canceled.
  Scenario: Place an IOC ask order
    Given a client with sufficient funds and within trading limits
    When the client submits an Immediate-Or-Cancel (IOC) ask order with a specified price and size
    And the system matches the order against existing bid orders
    Then any shares that cannot be immediately matched should be canceled
    And the client should receive execution details for the filled portion

  # Scenario: Order Modification
  # Clients should be able to modify details of their active orders.
  Scenario: Modify an existing order
    Given a client with an active order on the public order book
    When the client updates the order price or size
    Then the system should validate the new order parameters against trading limits
    And update the order in the public order book accordingly
    And adjust the reserved funds or balances to match the modified order

  # Scenario: Partial Order Match
  # The system must correctly handle partial order executions.
  Scenario: Handle a partial order match
    Given a client places an order for a certain quantity at a given price
    And the public order book contains orders that only partially satisfy the client's order
    When the system matches the order partially
    Then the client should receive immediate execution for the matched shares
    And the remaining portion of the order should continue to be open
    And the client's balance should reflect the partial execution

  # Scenario: Order Cancellation
  # Clients need the ability to cancel their orders and have the system update both the order book and their balance.
  Scenario: Cancel an active order
    Given a client with an active order in the public order book
    When the client requests to cancel the order
    Then the order should be removed from the public order book
    And any funds or balances reserved for the order should be released back to the client

  # Scenario: Order Rejection due to Insufficient Funds or Risk Check Failure
  # The system must enforce trading limits and available funds, rejecting orders that exceed these constraints.
  Scenario: Reject order exceeding available funds
    Given a client attempting to place an order that exceeds their available balance
    When the system performs risk checks and verifies the client's funds and trading limits
    Then the order submission should be rejected with a "RISK_NSF" error
    And no changes should be made to the public order book or the client's reserved funds
