Feature: Review Client Balances

  As a client
  I want to review my current balance after any transaction
  So that I can manage my trading activity effectively

  Background:
    Given the system is operational
    And the client has a registered account

  Scenario: Scenario 1: Successful balance retrieval
    Given the client requests their current balance
    When the system retrieves the balance
    Then the system displays the current balance to the client
    And the client is informed about their trading limits

  Scenario: Scenario 2: Balance exceeds trading limits
    Given the client's balance is above the trading limits
    When the client checks their balance
    Then the client is notified that they can place new orders

  Scenario: Scenario 3: Insufficient funds error
    Given the client wishes to make a transaction
    And the required amount exceeds the client's current balance
    When the client attempts the transaction
    Then the system displays an error message stating 'Insufficient funds for the requested operation.'

  Scenario: Scenario 4: Partial order match adjustment
    Given the client places an order that partially matches
    When the order execution occurs
    Then the system adjusts the balance to reflect the executed portion of the order

  Scenario: Scenario 5: Cancelling an order
    Given the client has an active order
    When the client cancels the order
    Then the system updates the balance to include the funds allocated to that order

  Scenario: Scenario 6: Summary of active orders
    Given the client has multiple active orders
    When the client requests a summary
    Then the system provides a summary of all active orders along with the updated balance

  Scenario Outline: Scenario Outline: Balance management
    Given the client's current balance is <current-balance>
    And the requested transaction amount is <transaction-amount>
    When the client requests to perform the transaction
    Then the outcome should be <outcome>
    Examples:
      | current-balance | transaction-amount | outcome |
      | $500 | $200 | Transaction successful |
      | $100 | $150 | Insufficient funds for the requested operation. |
      | $300 | $250 | Transaction successful |
      | $50 | $75 | Insufficient funds for the requested operation. |

