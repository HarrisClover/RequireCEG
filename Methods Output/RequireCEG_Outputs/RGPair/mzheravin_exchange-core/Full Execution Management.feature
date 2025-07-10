Feature: Full Execution Management

  As a client
  I want to place, modify, and cancel bid orders within my predefined trading limits
  So that I can efficiently manage my trading activity and maximize my available funds

  Background:
    Given the client has predefined trading limits and available funds
    And the client is logged into the trading system

  Scenario: Scenario 1: Place a valid bid order
    Given the client's bid price is within trading limits
    And the size of the bid is within the allowed limits
    And the client has sufficient available funds to place the bid order
    When the client places a bid order
    Then the order is added to the public order book
    And the client's balance is adjusted accordingly

  Scenario: Scenario 2: Place an invalid bid order
    Given the client's bid price exceeds trading limits
    When the client attempts to place a bid order
    Then the order is rejected
    And the client's balance remains unchanged

  Scenario: Scenario 3: Cancel an active order
    Given the client has an active order in the order book
    When the client cancels the active order
    Then the active order is removed from the order book
    And the corresponding funds are reinstated to the client’s balance

  Scenario: Scenario 4: Modify an existing order
    Given the client wishes to change the price of an existing order
    When the client modifies the order
    Then the system re-evaluates the updated order
    And the matching process is adjusted as necessary

  Scenario Outline: Scenario Outline: Bid order validation and execution
    Given the client’s bid price is <bid-price>
    And the bid size is <bid-size>
    When the client places the bid order
    Then the order is <order-status>
    And the client's balance is <balance-status>
    Examples:
      | bid-price | bid-size | order-status | balance-status |
      | $100 | 10 | added to the public order book | adjusted |
      | $600 | 2 | rejected | unchanged |
      | $150 | 5 | partially matched | adjusted |

