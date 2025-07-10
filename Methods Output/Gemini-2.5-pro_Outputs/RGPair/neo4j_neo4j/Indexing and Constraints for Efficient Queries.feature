Feature: Indexing and Constraints for Efficient Queries
  As a Database Administrator,
  I want to define indexes and unique constraints,
  So that query performance is optimized and data integrity is maintained.

  Background:
    Given a graph database schema

  Scenario: Create a unique constraint on a node property
    When I execute a Cypher command to create a unique constraint on the 'email' property for nodes with label 'User'
    Then the constraint should be successfully created
    And subsequent attempts to create 'User' nodes with duplicate 'email' values should fail with a constraint violation error

  Scenario: Query performance improvement with an index
    Given an index exists on the 'productID' property for nodes with label 'Product'
    When I execute a Cypher query filtering 'Product' nodes by 'productID'
    Then the query should execute significantly faster compared to querying without the index (Note: Performance is hard to specify declaratively, focus on functional effect)
    And the correct 'Product' node should be retrieved efficiently

  Scenario: Enforce unique constraint during node creation
    Given a unique constraint exists on the 'userID' property for 'User' nodes
    And a 'User' node with 'userID' = 'user123' already exists
    When I attempt to create another 'User' node with 'userID' = 'user123'
    Then the operation should fail
    And the system should report a constraint violation error

  Scenario: Enforce unique constraint during property update
    Given a unique constraint exists on the 'username' property for 'User' nodes
    And 'User' nodes with 'username' = 'alice' and 'username' = 'bob' exist
    When I attempt to update the 'username' of 'bob' to 'alice'
    Then the update operation should fail
    And the system should report a constraint violation error