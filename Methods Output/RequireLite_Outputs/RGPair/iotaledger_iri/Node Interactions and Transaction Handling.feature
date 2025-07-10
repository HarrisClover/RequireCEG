Feature: Node Interactions and Transaction Handling

  As a system administrator
  I want to ensure reliable node interactions for stitching transactions
  So that the system maintains consistency and avoids crashes

  Background:
    Given the system nodes are initialized
    And all nodes are synchronized from local snapshots and data databases

  Scenario: Scenario 1: Verify Node Bootstrap and Synchronization
    Given a set of active nodes in the system
    When the nodes initiate a bootstrap process
    Then all nodes shall synchronize correctly
    And if a synchronization failure occurs, an error message should be logged and nodes should retry synchronization

  Scenario: Scenario 2: Handle Value Transactions
    Given a transaction including a zero-value transaction
    When the transaction is processed and referenced by a milestone
    Then the transaction status must be confirmed correctly
    And if the transaction is non-zero, it must be processed and its status appropriately confirmed

  Scenario Outline: Scenario Outline: API Call Functionality
    Given the system supports API calls like <api-call>
    When <api-call> is executed
    Then the response must be accurate and representative of the node's state
    And if the API call is invalid, a proper error response must be generated
    Examples:
      | api-call | expected-response |
      | GetNodeInfo | Node information details |
      | GetNeighbors | List of neighbor nodes |
      | Add/Remove Neighbors | Confirmation of neighbor addition/removal |
      | InvalidAPICall | Error response indicating invalid API call |


  Scenario: Scenario 3: Validate Pruned Transactions
    Given pruning has been executed on transactions
    When a retrieval request for old transactions below the pruning depth is made
    Then no old transactions should be accessible
    And if an attempt to access pruned transactions occurs, an appropriate error message should be returned
