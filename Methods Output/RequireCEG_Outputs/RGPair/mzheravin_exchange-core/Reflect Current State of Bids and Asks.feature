Feature: Reflect Current State of Bids and Asks

  As a trading platform user
  I want to accurately see the current state of bids and asks in the order book
  So that I can make informed trading decisions

  Background:
    Given the trading platform is operational
    And the order book is initialized with existing bids and asks

  Scenario: Place a Bid Order
    Given a client places a bid order at price $X
    When the bid order is submitted
    Then the bid should be added to the bids section
    And a confirmation message acknowledging the bid should be shown

  Scenario: Place an Ask Order
    Given a client places an ask order at price $Y
    When the ask order is submitted
    Then the ask should be added to the asks section
    And a confirmation message acknowledging the ask should be shown

  Scenario: Complete Transaction
    Given there is a matching bid and ask in the order book
    When the bid matches the ask resulting in a full execution
    Then both the matched bid and ask should be removed from the order book
    And a transaction confirmation detailing the executed price and quantity should be provided

  Scenario: Partial Match of Orders
    Given there is a partial match between a bid and an ask
    When the bid and ask are processed
    Then the remaining unmatched portion should be retained in the order book
    And clients should receive a notification that the order is partially filled

  Scenario: Modify an Existing Order
    Given a client wants to modify an existing order by changing the price
    When the modified order is submitted
    Then the previous order should be removed from the order book
    And the new price should be displayed along with a confirmation of the successful modification

  Scenario: View Active Orders and Balances
    Given a transaction has been completed
    When the client checks their account
    Then they should be able to view their active orders
    And their updated balance should be displayed seamlessly

  Scenario: Check Active Order without Pending Modification
    Given a client has existing active orders
    When the client requests to view their active orders and updated balance
    Then the client should see their active orders
    And the updated balance should be displayed without any pending modifications
