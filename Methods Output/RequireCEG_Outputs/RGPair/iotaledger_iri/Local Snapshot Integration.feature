Feature: Local Snapshot Integration

  As a system node
  I want to initialize and synchronize my state using a local snapshot or data database
  So that I can ensure correct and consistent operation

  Background:
    Given the node has started up
    And the presence of either a Local Snapshot or data database

  Scenario: Scenario 1: Successful Initialization with Local Snapshot
    Given a Local Snapshot exists
    When the node initializes its state using the Local Snapshot
    Then the node confirms its operational state with a success message
    And the state is initialized with Local Snapshot data

  Scenario: Scenario 2: Fallback to Data Database Initialization
    Given no Local Snapshot exists
    And the data database is accessible
    When the node bootstraps its state from the data database
    Then the node confirms its operational state with a success message
    And the state is bootstrapped from data database

  Scenario: Scenario 3: Transaction Status Verification
    Given a request for transaction status is made
    And that it references predefined milestones
    When the system verifies transactions against the Local Snapshot and the data database
    Then the system returns accurate transaction status

  Scenario: Scenario 4: Node Specific Information Request
    Given a request is made for node-specific information
    When the request is for GetNodeInfo
    Then the system provides accurate and up-to-date node information
    And the node provides an accurate and up-to-date response for GetNodeInfo

  Scenario: Scenario 5: Handling Broadcast Requests
    Given a new transaction is created
    When a broadcast request is initiated
    Then the transaction is successfully propagated to neighboring nodes
    And the system provides an accurate response for Add/Remove Neighbors statuses

  Scenario: Scenario 6: Validating Pruning Depth
    Given a transaction is pruned
    When the system validates the pruning depth
    Then no entries beneath the defined pruning limit are available
    And the system ensures the defined pruning depth is validated
