Feature: Reliable Node Interactions and Transaction Handling
  As a system administrator,
  I want the system to ensure reliable node interactions for stitching transactions,
  So that the system remains consistent and avoids crashes while managing transactions.

Scenario Outline: Node Interaction and Transaction Handling
  Given the system is running and nodes are initialized with Local Snapshot and data databases
  And the system is synchronized across multiple nodes
  When a transaction is created with a value of <transaction-value> at node <node-id>
  And the transaction is broadcasted to neighboring nodes
  And a GetNodeInfo API call is made
  Then the node must return accurate information about its current state
  And the transaction should be stored and retrievable by the GetNeighbors API
  And any Add/Remove Neighbors API call should function correctly without causing inconsistencies
  And if the transaction is pruned, it must no longer be accessible below the pruning depth
  And the transaction status should be confirmed once referenced by milestones

Examples:
  | transaction-value | node-id |
  | $0                | Node1   |
  | $150              | Node2   |
  | $500              | Node3   |
  | $0                | Node4   |
