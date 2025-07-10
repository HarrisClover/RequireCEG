Feature: Merging Nodes with Conflict Resolution

  As a user managing node relationships
  I want to merge two nodes while handling any potential conflicts
  So that I can maintain data integrity and ensure a smooth merging process

  Background:
    Given the nodes to be merged exist in the system
    And the user has the necessary permissions to perform the merge

  Scenario: Detecting conflicting properties during merge
    Given Node A has properties set to 'X' and Node B has the same properties set to 'Y'
    When the user attempts to merge Node A and Node B
    Then the system should display a message indicating the conflicting properties
    And the merge operation should not proceed

  Scenario: Unique constraint violation during node merge
    Given Node A meets the unique constraint with property 'Z' and Node B does not
    When the user attempts to merge Node A and Node B
    Then the system should inform the user that the merge cannot be completed due to the unique constraint

  Scenario: Detecting relationship conflicts during merge
    Given Node A has a relationship with Node C and Node B has a conflicting relationship with Node D
    When the user attempts to merge Node A and Node B
    Then the system should provide feedback on the conflicting relationships
    And the merge operation should not proceed

  Scenario: Successful merge with no conflicts
    Given Node A and Node B have no conflicting properties or relationships
    When the user initiates the merge operation
    Then the system should execute the merge successfully
    And return an acknowledgment of the successful merge

  Scenario: Conflicting properties and relationships found
    Given Node A has properties set to 'X' and Node B has the same properties set to 'Y'
    And Node A has a relationship with Node C and Node B has a conflicting relationship with Node D
    When the user attempts to merge Node A and Node B
    Then the system should display a message indicating both conflicting properties and relationships
    And the merge operation should not proceed

  Scenario: No conflicts found in properties or relationships
    Given Node A has properties set to 'X' and Node B has the same properties set to 'X'
    And Node A has a relationship with Node C and Node B has a relationship with Node C as well
    When the user attempts to merge Node A and Node B
    Then the system should execute the merge successfully
    And return an acknowledgment of the successful merge
