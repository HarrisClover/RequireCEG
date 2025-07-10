Feature: Specify Order Type (GTC, IOC)

  As a client
  I want to select an order type (GTC or IOC)
  So that I can properly manage my orders based on my trading strategy

  Background:
    Given the client has sufficient trading limits and available funds
    And the order book is available for placing orders

  Scenario: Scenario 1: Client selects GTC order type
    Given the client selects GTC as the order type
    When the client submits the GTC order
    Then the order should remain active until executed or canceled
    And the system should display a confirmation message indicating that the 'GTC' order is active

  Scenario: Scenario 2: Client selects IOC order type
    Given the client selects IOC as the order type
    When the client submits the IOC order
    Then the system should attempt to execute the entire order immediately
    And if only part of the order can be filled, the unfilled portion should be canceled with a message detailing the execution results

  Scenario: Scenario 3: Client exceeds trading limits or available funds for order submission
    Given the client attempts to place an order exceeding their trading limits or available funds
    When the order submission is processed
    Then the system should present an error message stating 'Order exceeds trading limits or available funds.'

  Scenario: Scenario 4: Modifying a GTC order and reflecting the changes in the order book
    Given the client has an active GTC order
    When the client modifies the price of the GTC order
    Then the amended order should be reflected in the order book with the updated price
    And the system must handle any effects this change could have on existing matched orders to prevent mismatches

  Scenario: Scenario 5: Client decides to cancel an active order
    Given the client has an active order that they wish to cancel
    When the client submits a request to cancel the order
    Then the system should remove the order from the order book
    And the client's available balance should be updated in compliance with risk checks such as RISK_NSF

  Scenario: Scenario 6: Confirming multiple order types cannot be selected simultaneously
    Given the client attempts to select both GTC and IOC order types
    When the client tries to submit the order
    Then the system should not allow both order types to be selected simultaneously

  Scenario: Scenario 7: Ensuring GTC order modification does not create mismatches
    Given the client has an active GTC order with existing matched orders
    When the client modifies the price of the GTC order
    Then the system should ensure no mismatches occur with existing matched orders after modifying the GTC order
