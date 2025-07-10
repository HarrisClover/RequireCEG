Feature: Input Order Price

  As a client
  I want to submit orders with specific price conditions
  So that I can effectively manage my trades within market limits

  Background:
    Given the client has a trading account with sufficient limits
    And the market is active and prices are fluctuating

  Scenario: Scenario 1: Submit GTC Order
    Given the order type is GTC (Good 'Til Canceled)
    And the client inputs a price for the bid or ask order
    When the order is processed
    Then the order should be placed successfully
    And the client's balance should reflect the amount deducted after a risk check

  Scenario: Scenario 2: Submit IOC Order within Market Conditions
    Given the order type is IOC (Immediate or Cancel)
    When the client submits an order at a price within current market conditions
    Then the order should be executed immediately
    And the client's balances should be updated accordingly

  Scenario: Scenario 3: Insufficient Funds for Order
    Given the client submits an order exceeding trading limits
    When the system checks the order against trading limits
    Then an 'Insufficient Funds or Limits' message should be displayed

  Scenario: Scenario 4: Modify Existing Order Price
    Given the client wishes to modify the price of an existing order
    And the new price is within trading limits
    When the new price is evaluated against current market conditions
    Then the order should be updated in the order book
    And the client should be notified of the new order status

  Scenario: Scenario 5: Cancel Existing Order
    Given the client initiates a request to cancel an existing order
    When the order is removed from the order book
    Then the corresponding funds should be restored to the client
    And any partial matches should be accounted for in the adjustment

  Scenario: Scenario 6: Order Modification Validation
    Given the client wishes to modify an existing order's price
    And the new price is within trading limits
    When the order modification is attempted
    Then the system should re-evaluate the order against current market conditions for modification
    And an update on the action taken should be communicated to the client

  Scenario: Scenario 7: Confirm Cancellation of Existing Order
    Given the client initiates the cancellation of an existing order
    And the order was partially matched before cancellation
    When the cancellation request is processed
    Then the system should restore the respective funds to the client

  Scenario Outline: Scenario Outline: Order Processing Results
    Given the client has a specified order type '<order-type>'
    And the input price '<input-price>' is submitted
    When the system processes the order
    Then the outcome should be '<outcome>'
    Examples:
      | order-type | input-price | outcome |
      | GTC | $150 | Order placed successfully |
      | IOC | $100 | Order executed immediately |
      | IOC | $2000 | Insufficient Funds or Limits |

