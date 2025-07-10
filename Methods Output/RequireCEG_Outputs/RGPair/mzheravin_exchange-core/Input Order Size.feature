Feature: Input Order Size

  As a client
  I want to ensure that my orders adhere to my available balance and trading limits
  So that I can avoid errors during order placement and manage my trades effectively

  Background:
    Given the client has a balance of $1000
    And the client has a trading limit of 5 units

  Scenario: Scenario 1: Insufficient Funds Error
    Given the client attempts to place an order for 15 units
    When the order is submitted
    Then an error message should be displayed stating 'Insufficient funds'
    And the order should not be processed

  Scenario: Scenario 2: Exceeding Trading Limit
    Given the client attempts to place a GTC order for 6 units
    When the order is submitted
    Then the order should not be submitted
    And the client should be notified of the trading limit violation

  Scenario: Scenario 3: Successful IOC Order Execution
    Given the current bid in the order book is for 10 units
    When the client places an IOC order for 10 units
    Then the transaction should be executed
    And the client's balance should be updated accordingly

  Scenario: Scenario 4: Updating Order Size
    Given the client has an active order of 5 units
    When the client modifies the order to 3 units
    Then the order in the order book should be updated to 3 units
    And the system should preserve other parameters of the order

  Scenario: Scenario 5: Partial Fill Execution
    Given the client places an order for 7 units
    When the order executes partially with only 4 units available
    Then the system should execute the partial order
    And the order status should be updated to reflect the partial execution

  Scenario: Scenario 6: Reviewing Active Orders
    Given the client has placed or modified an order size
    When the client requests to review their active orders
    Then the system should present the current state of all active orders along with their respective sizes

  Scenario: Scenario 7: Order Update Logic Check
    Given the client attempts to modify an existing order size to a smaller valid amount
    When the order modification is processed
    Then the system should update the order in the order book while preserving other parameters

  Scenario Outline: Scenario Outline: GTC Order Size Validation
    Given the client has a trading limit of <trading-limit> units
    And the client attempts to place a GTC order for <order-size> units
    When the order is submitted
    Then the order should <result>
    Examples:
      | trading-limit | order-size | result |
      | 5 | 4 | be submitted |
      | 5 | 6 | not be submitted |
      | 10 | 8 | be submitted |
      | 3 | 2 | be submitted |
      | 3 | 4 | not be submitted |

