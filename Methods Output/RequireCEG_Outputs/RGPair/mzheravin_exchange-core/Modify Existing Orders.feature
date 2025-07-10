Feature: Modify Existing Orders

  As a client
  I want to modify my existing order with a new price and size
  So that I can adjust my order based on current market conditions

  Background:
    Given the current market price is available for comparison
    And the order type is GTC

  Scenario: Order modification with a lower price
    Given the client requests to modify the order with a new price lower than the current market price
    When the modification request is processed
    Then the order should be updated and placed back into the order book
    And the client should receive a confirmation message

  Scenario: Modification exceeding available balance
    Given the client requests to modify the order with a new price exceeding their available balance
    When the modification request is processed
    Then the request should be rejected due to insufficient funds or limits
    And an error message for insufficient funds or limits is displayed

  Scenario: Partial match execution
    Given the client submits a modification that partially matches existing orders
    When the modification request is processed
    Then the matching portion should be executed immediately
    And the corresponding amount should be deducted from the client’s balance

  Scenario: Modification breaching maximum allowable risk limits
    Given the client submits a modification that breaches maximum allowable risk limits
    When the modification request is processed
    Then the change should be blocked due to risk limit violation
    And the client should be alerted about the risk limit violation

  Scenario: Modification triggering a margin check
    Given the client wishes to modify an existing order with a proposed change exceeding risk thresholds
    And the modification triggers a margin check
    When the modification request is processed
    Then a margin check should be conducted before confirming the order update

  Scenario Outline: Scenario Outline: Modifications triggering margin checks
    Given the client wishes to modify an existing order with a proposed change exceeding risk thresholds
    And the modification triggers a margin check
    When the modification request is processed
    Then a margin check should be conducted before confirming the order update
    Examples:
      | new price | available balance | risk limit | expected outcome |
      | $150 | $200 | $1000 | margin check passed |
      | $300 | $250 | $200 | insufficient funds |
      | $500 | $600 | $400 | meeting risk limits |
      | $700 | $300 | $500 | breaching risk limits |

