Feature: Node API Functionality
  As a Developer or Administrator
  I want the node's management and information APIs to function correctly
  So that I can monitor, manage, and interact with nodes programmatically.

  Scenario: Retrieve Node Information
    Given a running and synchronized node
    When an API call is made to 'GetNodeInfo'
    Then the API should return a successful response (e.g., HTTP 200)
    And the response body should contain accurate current node information (like version, health status, latest milestones).

  Scenario: Retrieve Neighbor Information
    Given a running node configured with 2 active neighbors
    When an API call is made to 'GetNeighbors'
    Then the API should return a successful response
    And the response body should list exactly 2 neighbors with their connection details and status.

  Scenario: Add a Neighbor via API
    Given a running node
    And a valid peer URI "peer://new_neighbor_id"
    When an API call is made to 'AddNeighbors' with the peer URI "peer://new_neighbor_id"
    Then the API should return a successful response
    And a subsequent API call to 'GetNeighbors' should include "peer://new_neighbor_id" in the list of neighbors.

  Scenario: Remove a Neighbor via API
    Given a running node with an existing neighbor identified by "peer://neighbor_to_remove_id"
    When an API call is made to 'RemoveNeighbors' targeting "peer://neighbor_to_remove_id"
    Then the API should return a successful response
    And a subsequent API call to 'GetNeighbors' should no longer include "peer://neighbor_to_remove_id" in the list of neighbors.