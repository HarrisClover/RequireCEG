Feature: Node Transaction Management
As a system developer,
I want to ensure reliable node interactions and accurate transaction management,
So that our system maintains consistency, avoids crashes, and processes transactions correctly.

Scenario: Node Bootstrapping and Synchronization
Given a node is bootstrapped using a Local Snapshot
And the node is bootstrapped from a data database
When multiple nodes initialize and begin to synchronize
Then each node maintains the expected state across the network
And no node interactions result in crashes

Scenario: Handling Zero-Value and Value Transactions
Given a transaction with a zero value
And a transaction with a non-zero value
When both transactions are referenced by a milestone
Then the system confirms the correct status for each transaction

Scenario: API Functionality for Node Information and Neighbors
Given the system API is available
When a client requests node information via "GetNodeInfo"
Then the API returns accurate and up-to-date node status
When a client requests the list of neighbors via "GetNeighbors"
Then the API returns the correct list of neighboring nodes

Scenario: Managing Neighbors
Given a node is operational and connected
When a neighbor is added using the "Add Neighbor" API call
Then the system confirms the neighbor has been added successfully
And when a neighbor is removed using the "Remove Neighbor" API call
Then the system confirms the neighbor has been removed
And node states remain consistent throughout the process

Scenario: Transaction Creation, Storage, Retrieval, and Broadcasting
Given new transactions are created
When transactions are stored in the database
And transactions are retrieved successfully
Then the system allows broadcasting of these transactions across neighboring nodes
And the transaction data is accurately maintained during the entire process

Scenario: Pruned Transaction Handling
Given there are transactions older than the current pruning depth
When the system executes the pruning process
Then transactions below the pruning depth are no longer accessible
And the current inclusion state remains accurate and validated