Feature: Get Node Info API Functionality

  As a user of the node
  I want to retrieve information about the node's status and neighbors
  So that I can understand the current state of the system and troubleshoot any issues

  Background:
    Given a node exists in the network
    And the user has permissions to query the node

  Scenario: Scenario 1: Node is synchronized and has neighbors
    Given the node is synchronized with the Local Snapshot and data databases
    And the node has neighboring nodes
    When the user requests node information
    Then the system returns a confirmation message regarding its synchronization status
    And the system provides a list of neighboring nodes

  Scenario: Scenario 2: Node is isolated without neighbors
    Given the node is not synchronized
    And the node has no neighboring nodes
    When the user requests node information
    Then the system indicates the lack of neighbors

  Scenario: Scenario 3: Node is bootstrapping without neighboring nodes
    Given the node is in the process of bootstrapping
    When the user requests node information
    Then the system conveys the bootstrapping progress prominently

  Scenario: Scenario 4: Error during node information request
    Given the user requests node information
    And an error occurs during the request
    Then the system responds with a well-defined error message detailing the specific issue

  Scenario: Scenario 5: Node requests for older transactions in a pruned network
    Given the node belongs to a pruned network
    And a request for older transactions is made
    When the user inquires about transaction availability
    Then the system indicates that transactions beneath the pruning depth are inaccessible
