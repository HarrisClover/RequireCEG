Feature: Update Balances on Order Cancellation

  As a client
  I want to ensure my balance is accurately updated when I cancel an order
  So that I can have visibility on my financial status after the cancellation

  Background:
    Given a client has an active order
    And the order details include order size and price

  Scenario: Scenario 1: Client cancels a bid order
    Given the order type is a bid
    And the order size is 10
    When the client cancels the order
    Then the client's balance should be incremented by 10
    And a confirmation message is sent to the client detailing their updated balance

  Scenario: Scenario 2: Client cancels an ask order
    Given the order type is an ask
    And the order size is 5 and trade price is $200
    When the client cancels the order
    Then the client's balance should be adjusted by adding $1000
    And a confirmation message is sent to the client detailing their updated balance

  Scenario: Scenario 3: Client cancels an order without an existing order
    Given the order type is a bid
    And there is no active order
    When the client attempts to cancel the order
    Then the client's balance remains unchanged
    And no confirmation message is sent to the client

  Scenario Outline: Scenario Outline: Client cancels orders and checks balance
    Given the order type is <orderType>
    And the order size is <orderSize>
    When the client cancels the order
    Then the client's balance should be updated according to the cancellation
    Examples:
      | orderType | orderSize | expectedBalanceChange |
      | bid | 10 | 10 |
      | ask | 5 | 1000 |
      | ask | 8 | 1600 |
      | bid | 12 | 12 |

