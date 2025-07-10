Feature: Get Neighbors API Functionality

  As a user of the system
  I want to retrieve a list of current connections associated with a specific node
  So that I can understand my current network of connections

  Background:
    Given the node has established connections
    And the user is logged into the system

  Scenario: Scenario 1: Retrieve Connected Neighbors
    Given the node has connected neighbors
    When the user requests the current neighbors
    Then the system should return a structured list of connected neighbor IDs and their statuses
    And the list should not be empty

  Scenario: Scenario 2: No Connected Neighbors Available
    Given the node has no connected neighbors
    When the user requests the current neighbors
    Then the system should return a message stating that no neighbors are currently available

  Scenario: Scenario 3: Remove an Existing Neighbor
    Given the node has a connected neighbor
    When the user requests to remove the neighbor
    Then the system should remove the neighbor and return a success confirmation message

  Scenario: Scenario 4: Attempt to Remove a Non-Existent Neighbor
    Given the node has no such connected neighbor
    When the user requests to remove that neighbor
    Then the system should return an error message indicating that the neighbor does not exist

  Scenario: Scenario 5: Add a New Neighbor
    Given the node has no currently established connection with the new neighbor
    When the user requests to add the neighbor
    Then the system should add the new neighbor to the connection list and return a confirmation message

  Scenario: Scenario 6: Attempt to Add an Already Connected Neighbor
    Given the node already has a connection with the specified neighbor
    When the user requests to add that neighbor
    Then the system should return a message confirming that the neighbor is already connected

  Scenario Outline: Scenario Outline: Neighbor Operations
    Given the node has <number> connected neighbors
    And the user wants to operate on neighbor <neighbor-name>
    When <operation>
    Then <expected-result>
    Examples:
      | number | neighbor-name | operation | expected-result |
      | 1 | Neighbor_A | remove | the neighbor Neighbor_A has been successfully removed |
      | 2 | Neighbor_B | add | the neighbor Neighbor_B has been successfully added |
      | 0 | Neighbor_C | remove | the neighbor Neighbor_C does not exist |

