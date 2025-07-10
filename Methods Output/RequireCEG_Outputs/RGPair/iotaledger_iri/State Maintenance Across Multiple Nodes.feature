Feature: State Maintenance Across Multiple Nodes

  As a node operator
  I want to ensure proper synchronization and state management across multiple nodes
  So that the system maintains a reliable and consistent transaction state

  Background:
    Given that nodes can connect and communicate with each other
    And the system has defined protocols for data handling

  Scenario: Initiate bootstrapping process
    Given a node connects to another node
    When it initiates a bootstrapping process
    Then it should retrieve and synchronize data from Local Snapshot and primary data databases
    And verify that their states align with expected configurations

  Scenario: Transaction management across tangles
    Given a transaction intersects main and side tangles
    When the transaction is processed
    Then the system must check for consistency in state
    And prevent system crashes

  Scenario: Confirm transaction states
    Given there are zero-value or value transactions
    When milestones reference those transactions
    Then the status of these transactions must be confirmed

  Scenario: GetNodeInfo API call
    Given an API call is made to GetNodeInfo
    When the call is executed
    Then it must return an accurate and current status of the node

  Scenario: GetNeighbors API call
    Given a call to GetNeighbors is made
    When the call is executed
    Then it should yield a list detailing the current connected neighbors

  Scenario: Adding and removing neighbors
    Given operations involving Add/Remove Neighbors are performed
    When the operations are executed
    Then the state of those connections should reflect immediate updates

  Scenario: Transaction broadcasting
    Given a transaction is created
    When it is stored in the transaction pool
    Then it should be retrievable for subsequent queries
    And if the transaction is to be broadcasted, it should propagate effectively across connected nodes

  Scenario: Pruning transactions
    Given a pruning process is initiated
    When transactions fall below the defined pruning depth
    Then these transactions must be removed from access
    And the active transaction state must be accurately represented across all nodes

  Scenario: Synchronize nodes states
    Given data is retrieved from primary data databases
    And nodes successfully synchronize their states
    Then the system should reflect the synchronization status without errors

  Scenario: Check for transaction consistency
    Given a transaction is created and stored in the transaction pool
    When the system checks for consistency in state
    Then the action should confirm reliable interaction of transactions

  Scenario: Validate expected node configurations
    Given the states of the nodes align with the expected configurations
    When the verification process is invoked
    Then the system should maintain accurate representations of the inclusion state
