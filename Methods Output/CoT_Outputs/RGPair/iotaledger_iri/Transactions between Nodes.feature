Feature: Transactions between Nodes
  As a system administrator,
  I want to ensure reliable node interactions for transactions
  So that the system maintains consistency and avoids crashes.

Scenario: Creating, storing, and broadcasting transactions across neighboring nodes
  Given the system is initialized with nodes correctly bootstrapped and synchronized
  When a new transaction is created with a value of <transaction-value>
  Then the transaction should be stored correctly in the node's database
  And the transaction should be broadcasted to neighboring nodes
  And the transaction status should be confirmed once referenced by milestones

Scenario: Handling zero-value transactions
  Given the system is initialized with nodes correctly bootstrapped and synchronized
  When a transaction with a zero value is created
  Then the transaction should be stored correctly in the node's database
  And the system should confirm the status of the zero-value transaction

Scenario: Verifying node synchronization and pruning of old transactions
  Given that the system has reached a pruning depth of <pruning-depth>
  When a transaction older than the pruning depth is requested
  Then the system should ensure that no old transactions below the pruning depth are accessible
  And the nodes should remain synchronized with valid transaction data

Scenario: Adding and removing node neighbors
  Given that a node has been bootstrapped and is part of the system
  When a neighboring node is added or removed
  Then the node’s state should be updated accurately
  And the system should return correct node information for GetNodeInfo and GetNeighbors API calls

Examples:
  | transaction-value | pruning-depth | expected-node-info |
  | $50              | 10            | Node Info: valid  |
  | $0               | 15            | Node Info: valid  |
  | $200             | 5             | Node Info: valid  |
