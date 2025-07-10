Feature: Prevent Unauthorized Order Submissions

  As a system administrator
  I want to enforce order placement rules based on trading limits and risk conditions
  So that we can ensure secure and compliant trading for all clients

  Background:
    Given a client logged into the system
    And the client has a defined trading limit and available balances

  Scenario: Scenario 1: Order exceeds trading limit
    Given the client's trading limit is $500
    And the client tries to submit an order of $600
    When the client submits the order
    Then the order submission should be blocked
    And the message 'Order exceeds trading limit.' should be displayed

  Scenario: Scenario 2: Insufficient funds for order
    Given the client's available balance is $200
    And the client tries to place an order of $250
    When the client submits the order
    Then the order submission should be blocked
    And the message 'Insufficient funds for order.' should be displayed

  Scenario: Scenario 3: Risk check fails for GTC order
    Given the client's order type is GTC
    And the client tries to submit an order that fails risk check due to RISK_NSF
    When the client submits the order
    Then the order submission should be denied
    And the notification 'Order not allowed due to risk conditions.' should be shown

  Scenario: Scenario 4: Higher price modification within limits
    Given the client has an active order of $100
    And the new order price is $120 and within available balance
    When the client modifies the order to a higher price
    Then the modification should be allowed
    And a confirmation message should be presented to the client

  Scenario: Scenario 5: Active order modification by exceeding balance
    Given the client has an active order of $100
    And the new order price is $700 and this exceeds the available balance
    When the client modifies the order to a higher price
    Then the modification should be denied
    And the message 'Insufficient funds for order.' should be displayed

  Scenario Outline: Scenario Outline: Order placement risk checks
    Given the client has a trading limit of <trading-limit>
    And the client has an available balance of <available-balance>
    When the client submits an order of <order-amount>
    Then the order submission should <result>
    Examples:
      | trading-limit | available-balance | order-amount | result |
      | $400 | $300 | $350 | be allowed |
      | $300 | $200 | $400 | be blocked |
      | $200 | $150 | $250 | be blocked |
      | $600 | $500 | $500 | be allowed |

