Feature: Transaction Storage

  As a system administrator
  I want to ensure transactions are stored uniquely and retrievable
  So that the system maintains accurate financial records and transaction integrity

  Background:
    Given a transaction must be created and stored in the system with a unique identifier
    And the transaction's expected state must be validated across multiple nodes

  Scenario: Transaction Creation
    Given a new transaction is initiated
    And the transaction has a unique identifier
    When the transaction is processed
    Then the transaction should be stored in the system
    And the transaction status should be retrievable

  Scenario: Zero Value Transaction Status Verification
    Given a transaction with a value of zero is created
    When the transaction is verified
    Then the system should confirm its status based on milestone verification logic
    And the zero-value status verification process must be completed

  Scenario: Broadcasting Transaction
    Given a transaction is set to be broadcasted
    When the transaction is broadcasted to neighboring nodes
    Then the transaction must propagate successfully to all neighboring nodes
    And acknowledgment of successful transmission must be received

  Scenario: Pruning Transactions
    Given a transaction falls below the pruning threshold
    When the transaction is pruned
    Then all references to the pruned transaction should be completely removed
    And the transaction should no longer be accessible

  Scenario: Transaction Classification Verification
    Given a transaction is created and classified as a value transaction
    When the transaction's status is verified against certain milestones
    Then the transaction's expected state must be validated across all multiple nodes

  Scenario: Transaction Propagation Confirmation
    Given a transaction is set to be broadcasted
    And it propagates successfully to all neighboring nodes
    When the system awaits acknowledgment
    Then the successful transmission of the transaction is acknowledged

  Scenario Outline: Node Information Accuracy
    Given the API call GetNodeInfo is made
    And the node has <number> neighbors
    When the node's current status is queried
    Then the API should return real-time, accurate data indicating the node's status
    And the list of neighbors must be consistent
    Examples:
      | number | status |
      | 5 | active |
      | 3 | inactive |
      | 0 | isolated |
      | 10 | active |
      | 2 | active |

