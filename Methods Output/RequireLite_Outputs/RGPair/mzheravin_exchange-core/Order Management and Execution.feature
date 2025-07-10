Feature: Order Management and Execution

  As a client
  I want to place, manage, and cancel orders in the exchange
  So that I can effectively trade while maintaining control over my investments

  Background:
    Given the exchange system is online
    And my account has sufficient balance

  Scenario: Place a bid order with sufficient balance
    Given I have logged into my account
    When I submit a bid order for 10 shares of XYZ at $100 each
    Then the order should be added to the order book
    And my available balance should be updated accordingly

  Scenario: Attempt to place a bid order with insufficient balance
    Given I have logged into my account
    When I submit a bid order for 10 shares of XYZ at $100 each
    Then the order should not be placed
    And I should receive an error message indicating insufficient funds

  Scenario: Cancel an active order
    Given I have an active order to buy 5 shares of ABC at $50 each
    When I cancel my order
    Then the order should be removed from the order book
    And my available balance should be restored

  Scenario Outline: Match orders in the order book
    Given the order book contains a bid order for <bid-size> shares of <stock> at <bid-price>
    When the orders match
    Then the trades should be executed
    And the client balances should be updated
    Examples:
      | bid-size | stock | bid-price | ask-size | ask-price |
      | 10 | XYZ | $100 | 10 | $100 |
      | 5 | ABC | $50 | 5 | $50 |
      | 20 | LMN | $200 | 15 | $199 |
      | 15 | ABC | $50 | 15 | $50 |
      | 10 | XYZ | $100 | 5 | $99 |


  Scenario: Order matching with multiple entries
    Given the order book contains multiple bid orders for ABC at varying prices
    When the orders attempt to match
    Then the highest bid order for ABC should be executed first
    And the remaining active orders in the order book should be adjusted accordingly
