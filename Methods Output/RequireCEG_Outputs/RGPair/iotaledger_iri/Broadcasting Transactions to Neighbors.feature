Feature: Broadcasting Transactions to Neighbors

  As a system administrator
  I want to ensure all valid transactions are broadcasted to active neighboring nodes
  So that the system maintains an up-to-date and synchronized network state

  Background:
    Given the transaction involves a value that must be validated
    And there are active neighboring nodes available for broadcasting

  Scenario: Valid transaction with active neighbors
    Given a transaction that has been validated against the current state
    And the transaction is referenced by a milestone
    When the transaction is broadcasted to the active neighbors
    Then the transaction status should be updated to 'confirmed'
    And an acknowledgment should be received from each neighboring node

  Scenario: Transaction with no available neighbors
    Given a transaction ready to be broadcasted
    When there are no active neighboring nodes available
    Then an error should be logged indicating the failure to find an active neighbor

  Scenario: Zero-value transaction broadcasting
    Given a zero-value transaction exists
    When the transaction is broadcasted
    Then the transaction should be confirmed with lower priority
    And the acknowledgment for the transaction should indicate its low priority

  Scenario: Dynamic adjustment of neighbors during broadcasting
    Given the state of neighboring nodes has changed due to addition or removal
    When broadcasting a transaction
    Then the broadcasting process should only include currently active neighboring nodes

  Scenario: Handling broadcast of transactions that are not pruned
    Given a transaction that is created and not pruned
    When the transaction is processed for broadcasting
    Then the transaction should be directed to broadcast to active neighboring nodes

  Scenario: Validation before broadcasting transactions
    Given the transaction involves a valid value against the main and side tangle
    When the transaction is validated
    Then it should successfully proceed to broadcasting

  Scenario: Logging error when no active neighbors are available
    Given a transaction ready for broadcasting
    And there is no active neighboring node available
    When attempting to broadcast the transaction
    Then an error should be logged indicating the failure to find an active neighbor
