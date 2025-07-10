Feature: Transaction Creation, Storage, Retrieval, and Broadcasting
  As a User or Application
  I want to reliably create, store, retrieve, and broadcast transactions through the network
  So that transactions can be successfully submitted and propagated to peers.

  Scenario: Create, Store, and Retrieve a Transaction
    Given a running node
    When a client creates a valid transaction 'T_NEW'
    And submits 'T_NEW' to the node via the appropriate API endpoint (e.g., 'PostTransaction')
    Then the node should return a success status indicating acceptance
    And the node should store transaction 'T_NEW' in its database
    And a subsequent API call to retrieve the transaction using the ID of 'T_NEW' should return the correct transaction data.

  Scenario: Broadcast a Transaction to Neighbors
    Given a running node 'A' connected to a neighbor node 'B'
    When node 'A' successfully receives and stores a new transaction 'T_PROPAGATE'
    Then node 'A' should attempt to broadcast transaction 'T_PROPAGATE' to node 'B'
    And eventually, node 'B' should also have transaction 'T_PROPAGATE' in its database (verifiable via API on node B).