Feature: Checks for Node Existence

  As a database administrator
  I want to verify the existence of nodes and their relationships when executing Cypher queries
  So that I can ensure the accuracy of data retrieval and maintain data integrity

  Background:
    Given a Cypher query is prepared to find a node based on specified properties
    And the database contains various nodes with unique properties

  Scenario: Scenario 1: Node found successfully
    Given the node with property 'name' equals 'item1'
    When executing the Cypher query
    Then the system returns the details of the node
    And a success message indicating successful retrieval

  Scenario: Scenario 2: Node not found
    Given the node with property 'name' equals 'nonexistent-item'
    When executing the Cypher query
    Then the system generates an error message stating that the node was not found

  Scenario: Scenario 3: Missing related nodes
    Given the node with property 'name' equals 'item1' which has required relationships
    When executing the Cypher query with pattern predicates
    Then the system provides feedback detailing which specific relationships are absent

  Scenario: Scenario 4: Conflict from unique constraints
    Given the node with property 'name' equals 'itemA'
    And attempting to merge it with conflicting property 'color: red'
    When executing the merge operation
    Then the system throws an error detailing the nature of the conflict in property values

  Scenario: Scenario 5: Pre-merge existence check
    Given a node with property 'name' equals 'itemB'
    When executing a merge operation
    Then the system ensures that all referenced nodes are verified for existence prior to executing any merge operations
