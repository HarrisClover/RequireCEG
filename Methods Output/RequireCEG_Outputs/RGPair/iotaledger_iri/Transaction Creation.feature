Feature: Transaction Creation

  As a store owner
  I want to ensure that transactions are valid and handled appropriately
  So that I can maintain the integrity of the transaction process and support customers effectively

  Background:
    Given a predetermined protocol that defines acceptable transaction limits
    And a system that logs transactions into a local node database

  Scenario: Transaction Validity Check
    Given a transaction is initiated
    When the system evaluates the transaction's value
    Then if the transaction value is not zero and does not exceed the predetermined protocol limits, it will be created with a status of 'pending'
    And it will be stored in the local node database

  Scenario: Transaction Confirmation
    Given a transaction with a 'pending' status and the transaction status is 'pending'
    When the transaction reaches a milestone checkpoint
    Then the status of the transaction will be updated to 'confirmed'

  Scenario: Broadcasting Transaction
    Given a confirmed transaction and the user opts to broadcast it
    When the transaction is propagated to all neighboring nodes
    Then each neighboring node will receive the transaction

  Scenario: Neighboring Node Validation
    Given a transaction is received by a neighboring node
    When the neighboring node performs its own validation
    Then the transaction will be stored in their database if valid
    And if a neighboring node fails to store the transaction due to synchronization issues, any error will be logged with specific error messages

  Scenario: Retry Mechanism
    Given a neighboring node fails to store a transaction
    When the system implements a retry mechanism to re-attempt broadcasting the transaction
    Then the broadcasting will continue until successful storage is achieved

  Scenario: Transaction Pruning
    Given a transaction's referenced status falls below the defined pruning depth
    When the transaction is marked as inaccessible
    Then it will be removed from all local states
    And no previous transaction data can be retrieved post-pruning

  Scenario: Neighboring Node Validation and Storage
    Given a transaction is received by a neighboring node and each neighboring node performs its own validation
    When the neighboring node evaluates if it can store the transaction
    Then the transaction will be stored in their database if valid and all neighboring nodes must validate and store the transaction

  Scenario: Synchronization Issue Handling
    Given a neighboring node fails to store a transaction due to synchronization issues
    When an error is logged
    Then the specific error message will indicate the nature of the synchronization failure

  Scenario: Successful Storage Retry
    Given a neighboring node fails to store a transaction
    When the retry mechanism is initiated
    Then broadcasting will be re-attempted until the transaction is successfully stored

  Scenario: Transaction Inaccessibility Marking
    Given a transaction is marked as inaccessible
    When the transaction's referenced status falls below the defined pruning depth
    Then the transaction will be removed from all local states
