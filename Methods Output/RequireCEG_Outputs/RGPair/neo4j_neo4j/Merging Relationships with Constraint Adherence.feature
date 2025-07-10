Feature: Merging Relationships with Constraint Adherence

  As a system user
  I want to merge two nodes with unique constraints verification
  So that I can ensure data integrity and avoid conflicts

  Background:
    Given there are two nodes to be merged
    And the nodes have defined unique constraints

  Scenario: Successful Merge With No Conflicts
    Given that both nodes adhere to the unique constraints
    When the user initiates a merge operation
    Then the merge operation should succeed
    And the system confirms a successful merge and updates all relationships accordingly.

  Scenario: Merge Fails Due to Unique Constraint Violation on Node A
    Given that Node A violates a unique constraint
    When the user initiates a merge operation
    Then the merge operation should fail
    And the system returns an error message indicating 'Merge failed due to unique constraint violation on Node A.'

  Scenario: Merge Fails Due to Unique Constraint Violation on Node B
    Given that Node B violates a unique constraint
    When the user initiates a merge operation
    Then the merge operation should fail
    And the system returns an error message indicating 'Merge failed due to unique constraint violation on Node B.'

  Scenario: Duplicate Relationship Detected
    Given that there are relationships with identical properties and types between the nodes
    When the user attempts to merge the nodes
    Then the system detects the duplicate relationship
    And a notification is provided stating 'Duplicate relationship already exists between the nodes.'

  Scenario: Conflicting Relationships Resolved on Merge
    Given the user has nodes with existing relationships
    And the merge will alter these relationships
    When the user initiates the merge operation
    Then the system checks for conflicts within existing relationships
    And the conflicting relationships are resolved based on predefined rules.
