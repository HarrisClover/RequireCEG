Feature: Consistency Verification Across Nodes

  As a system user
  I want to ensure that all nodes reflect the same state for transaction validity
  So that the integrity and accuracy of transactions across the network are maintained

  Background:
    Given the system is operational
    And all nodes are synchronized correctly

  Scenario: Scenario 1: Validating a stitching transaction
    Given a stitching transaction is initiated
    And all nodes demonstrate the same state of the transaction
    When the transaction confirmation process is triggered
    Then the transaction is confirmed
    And all nodes reflect the confirmed transaction state

  Scenario: Scenario 2: Local Snapshot Bootstrapping
    Given a node attempts to bootstrap from a Local Snapshot
    When the synchronization process is initiated
    Then the node's state aligns with the states of neighboring nodes

  Scenario Outline: Scenario Outline: Transaction Status on Milestones
    Given a transaction is initiated with value <value>
    When the transaction is referenced by a milestone
    Then the transaction status is confirmed across all nodes
    Examples:
      | value |
      | zero |
      | non-zero |


  Scenario: Scenario 3: Accurate Node Information Response
    Given a user makes an API call using GetNodeInfo
    When the response is returned
    Then it reflects the accurate and real-time state of the node

  Scenario: Scenario 4: Maintaining Coherence on Neighbor Changes
    Given a user adds or removes neighbors
    When the internal records are updated
    Then the system maintains coherence among neighbor records

  Scenario: Scenario 5: Broadcasting Transactions to Neighbors
    Given a transaction is created
    When the transaction is stored or retrieved
    Then an effective broadcasting mechanism is triggered
    And all relevant neighboring nodes are notified of the transaction

  Scenario: Scenario 6: Transaction Pruning Validation
    Given a transaction pruning process is initiated
    When the state of the transactions is validated
    Then old transactions below the pruning depth cannot be accessed

  Scenario: Scenario 7: Ensuring Synchronization with Expected States
    Given a node attempts to bootstrap from a Local Snapshot
    When the synchronization is commenced
    Then ensures synchronization is established with expected states
