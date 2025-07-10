Feature: Merge Operations
  As a Developer,
  I want to use the MERGE clause in Cypher,
  So that I can create nodes or relationships if they don't exist, or match them if they do, while respecting constraints.

  Background:
    Given a graph database with potential unique constraints

  Scenario: Merge a node that does not exist
    Given no 'User' node with 'email' = 'new@example.com' exists
    When I execute a MERGE query for a 'User' node with 'email' = 'new@example.com'
    Then a new 'User' node with that email should be created

  Scenario: Merge a node that already exists
    Given a 'User' node with 'email' = 'existing@example.com' already exists
    When I execute a MERGE query for a 'User' node with 'email' = 'existing@example.com'
    Then no new node should be created, and the existing node should be matched

  Scenario: Merge with ON CREATE clause
    When I execute a MERGE query for a 'User' node with 'userID' = 'user789' setting 'createdAt' timestamp ON CREATE
    Then if the node is created, the 'createdAt' property should be set
    And if the node already exists, the 'createdAt' property should not be set or overwritten by this MERGE

  Scenario: Merge with ON MATCH clause
    Given a 'Product' node with 'productID' = 'prod456' exists
    When I execute a MERGE query for that 'Product' node setting 'lastAccessed' timestamp ON MATCH
    Then the 'lastAccessed' property of the existing node should be updated
    And if the node had to be created (unexpectedly), 'lastAccessed' should not be set by ON MATCH

  Scenario: Merge a relationship
    Given nodes 'UserA' and 'UserB' exist
    When I execute a MERGE query to create a 'FOLLOWS' relationship from 'UserA' to 'UserB'
    Then the 'FOLLOWS' relationship should exist between them
    And executing the same MERGE query again should not create a duplicate relationship

  Scenario: Merge operation violating a unique constraint
    Given a unique constraint exists on 'username' for 'User' nodes
    And a 'User' node with 'username' = 'unique_user' exists
    When I attempt to MERGE a new 'User' node setting its 'username' to 'unique_user' ON CREATE
    Then the operation should fail due to the constraint violation
    And the system should report a clear error message