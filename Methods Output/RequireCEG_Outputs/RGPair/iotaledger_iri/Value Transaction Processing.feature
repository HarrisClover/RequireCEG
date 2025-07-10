Feature: Value Transaction Processing

  As a system administrator
  I want to manage transactions effectively
  So that the integrity and reliability of transaction data is maintained

  Background:
    Given a threshold for pruning transactions is defined
    And a ledger system is initialized

  Scenario: Classifying a Value Transaction
    Given the transaction amount is positive
    When the transaction is submitted
    Then it should be classified as a value transaction
    And it must be processed through both the main and side tangles

  Scenario: Validating a Zero Amount Transaction
    Given the transaction amount is zero
    When the transaction is submitted
    Then the system should confirm its validity
    And mark the transaction appropriately in the ledger

  Scenario: Handling Milestone Transactions
    Given the transaction is associated with a milestone
    When the status of the transaction is verified
    Then the system should update it appropriately to reflect progress

  Scenario: Maintaining Data Integrity for Value Transactions
    Given at least one value transaction exists in the system
    When information about transactions is retrieved
    Then the system should facilitate its creation, storage, and retrieval properly

  Scenario: Broadcasting Transactions to Neighbors
    Given a value transaction is present in the system
    When the transaction is broadcasted to neighboring nodes
    Then the neighbors should be accurately added or removed
    And the integrity of node interactions must be preserved

  Scenario: Pruning Irrelevant Transactions
    Given the pruning threshold has been reached
    When access to transactions is requested
    Then transactions below the defined pruning depth must not be accessible

  Scenario: Ensuring Integrity with Value Transactions
    Given there are value transactions present in the system
    When the transaction processing system operates
    Then it must facilitate the creation, storage, and retrieval of value transactions

  Scenario: Preventing Access below the Pruning Depth
    Given the pruning threshold has been reached
    When a transaction below the defined pruning depth is requested
    Then the system should prevent access to such transactions

  Scenario Outline: Transaction Validity
    Given the transaction amount is <amount>
    And the transaction is of <transaction-type>
    When the transaction is processed
    Then the transaction should be <expected-outcome>
    Examples:
      | amount | transaction-type | expected-outcome |
      | $100 | value | processed successfully |
      | $0 | zero | marked as valid in ledger |
      | $-50 | negative | not processed |

