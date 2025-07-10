Feature: Partial Match Handling

  As a trader
  I want the system to accurately process bid and ask orders, allowing for partial matches
  So that I can effectively manage my orders and understand the status of my trades

  Background:
    Given an active order book with various bid and ask orders
    And the system is initialized to check for availability and matching

  Scenario: Scenario 1: Bid Order Partially Matched
    Given a client submits a bid order for 100 units at $50
    And only 70 units are available at the specified price
    When the system processes the bid order
    Then 70 units are executed based on the total size of ask orders being less than the bid size
    And a message confirms the execution of the fulfilled amount and states that 30 units are still pending

  Scenario: Scenario 2: Ask Order Partially Matched
    Given a client submits an ask order for 80 units at $60
    When the system matches the incoming bid orders
    Then the matched quantity of 80 units is executed when ask orders partially match incoming bid orders
    And a message indicates the executed portion of the ask order while leaving any unfulfilled quantity active

  Scenario: Scenario 3: Active Order Modification
    Given a client modifies an active order changing the price from $50 to $55
    And there are 70 units in the order book fulfilling the original order
    When the system re-evaluates the active orders
    Then a confirmation message regarding the outcome of the re-evaluation is generated
    And the system re-assesses for potential partial matches based on the new price and existing quantities
