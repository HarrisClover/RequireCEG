Feature: Adjust Order Prices

  As a client adjusting an active order
  I want to ensure that my new price for the order is within acceptable limits and does not breach trading limits
  So that I can successfully update my order and ensure trades occur without issues

  Background:
    Given the client has a valid active order
    And the client is logged into their trading account

  Scenario: Scenario 1: Successful Price Adjustment
    Given the current order price is $500
    And the new price is $480
    When the client attempts to adjust the order price to $480
    Then the order should be successfully updated
    And the trade should execute if matched

  Scenario: Scenario 2: Insufficient Funds Error
    Given the client has an available balance of $200
    When the client attempts to adjust the order price to $600
    Then the system should reject the adjustment
    And an error message indicating insufficient funds should be displayed

  Scenario: Scenario 3: Trading Limits Violation
    Given the client has specific trading limits set to $1000
    When the client attempts to adjust the order price to $1200
    Then the system should reject the adjustment
    And an error message indicating violation of trading limits should be displayed

  Scenario: Scenario 4: Invalid Price Adjustment Rejection
    Given the current order price is $500
    When the client attempts to adjust the order price to $650
    Then the system should reject the adjustment
    And an error message indicating the adjustment is invalid should be displayed

  Scenario Outline: Scenario Outline: Validating Price Adjustment
    Given the current order price is <current-price>
    And the new price is <new-price>
    When the client attempts to adjust the order price
    Then the outcome should be <outcome>
    Examples:
      | current-price | new-price | outcome |
      | $300 | $250 | successfully updated |
      | $750 | $800 | successfully updated |
      | $500 | $600 | insufficient funds error |
      | $400 | $550 | violation of trading limits error |

