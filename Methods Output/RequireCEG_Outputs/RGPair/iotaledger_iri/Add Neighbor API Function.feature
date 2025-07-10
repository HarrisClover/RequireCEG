Feature: Add Neighbor API Function

  As a node in the network
  I want to add a neighbor successfully based on its connection status
  So that I can ensure stable and reliable connections in the network

  Background:
    Given a node attempts to add a neighbor using the Add Neighbor API Function
    And the neighbor's connection status is unknown

  Scenario: Scenario 1: Neighbor already exists
    Given the neighbor is already connected
    When the node attempts to add this neighbor
    Then the system returns an error message 'Neighbor already exists.'

  Scenario: Scenario 2: Neighbor is reachable and stable
    Given the neighbor is not connected
    And the neighbor's status indicates that it is reachable and in a stable state
    When the node attempts to add the neighbor
    Then the system establishes the connection
    And returns a success message 'Neighbor added successfully.'

  Scenario: Scenario 3: Neighbor is unreachable or unstable
    Given the neighbor is not connected
    And the neighbor's status indicates that it is unreachable or in an unstable state
    When the node attempts to add the neighbor
    Then the system returns a failure message 'Neighbor cannot be added due to its unstable state or reachability issues.'

  Scenario: Scenario 4: Adding a neighbor during synchronization with stable status
    Given the node is in an active synchronization process
    And the neighbor is not currently connected
    And the neighbor's status is reachable and in a stable state
    When the node attempts to add the neighbor
    Then the newly added neighbor will be included in subsequent broadcasts
    And transaction validation checks to maintain consistency in the node's local state
    And returns success message 'Neighbor added successfully.'

  Scenario: Scenario 5: Adding a neighbor during synchronization with unstable status
    Given the node is in an active synchronization process
    And the neighbor is not currently connected
    And the neighbor's status is unreachable or unstable
    When the node attempts to add the neighbor
    Then the newly added neighbor will not be included in subsequent broadcasts
    And returns failure message 'Neighbor cannot be added due to its unstable state or reachability issues.'
