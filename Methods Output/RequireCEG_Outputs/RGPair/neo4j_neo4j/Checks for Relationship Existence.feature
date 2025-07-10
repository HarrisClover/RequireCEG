Feature: Relationship Verification and Path Retrieval

  As a user of the graph database system
  I want to verify if a relationship exists between two nodes and retrieve the relevant path and properties
  So that I can understand the connections and properties associated with those nodes

  Background:
    Given a user initiates a Cypher query to find a path between two nodes
    And the system is aware of all node relationships

  Scenario: Scenario 1: Valid Relationship Exists
    Given a relationship exists between Node A and Node B
    When the user queries the path between Node A and Node B
    Then the system retrieves the path
    And the relevant properties of the relationship are returned

  Scenario: Scenario 2: No Relationship Exists
    Given no relationship exists between Node A and Node B
    When the user queries the path between Node A and Node B
    Then the system outputs 'No path found between the specified nodes'

  Scenario: Scenario 3: Applying Predicate and No Valid Paths Found
    Given a relationship exists between Node A and Node B, but it doesn't meet the criteria specified in the predicate
    When the user applies a predicate to filter the results
    Then the system responds with 'No matching paths found'

  Scenario: Scenario 4: Node Merging with Unique Constraints
    Given there are unique constraints on Node A and Node B
    And the user attempts to merge Node A with Node B
    When the merge operation is executed
    Then the system checks for relationship existence conflicts
    And the system notifies the user with 'Merge operation cannot be completed due to relationship existence conflicts'

  Scenario: Scenario 5: Valid Path Found with Predicate
    Given a relationship exists between Node A and Node C
    And the user specifies a filtering predicate that matches the relationship
    When the user queries the path using the predicate
    Then the system retrieves the relevant paths that match the filtering criteria

  Scenario: Scenario 6: No Unique Constraints Considered During Merge
    Given there are no unique constraints on Node A and Node B
    And the user attempts to merge Node A with Node B
    When the merge operation is executed
    Then the system successfully completes the merge operation
