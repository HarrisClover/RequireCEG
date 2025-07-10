Feature: Unique Constraint Management

  As a system administrator
  I want to manage unique constraints during node operations
  So that I can ensure data integrity and avoid conflicts

  Background:
    Given the system has predefined unique constraints on specific properties
    And the system is operational

  Scenario: Scenario 1: Successful Node Merge
    Given a node with property value that does not conflict with existing unique constraints
    And current nodes in the database
    When merging the node with a new value
    Then the node should be updated successfully
    And the confirmation message 'Node merged successfully.' should be returned

  Scenario: Scenario 2: Unique Constraint Violation on Merge
    Given a node with property value that conflicts with an existing unique constraint
    When merging the node with this conflicting value
    Then the operation should return an error message
    And the message 'Error: Unique constraint violation for property [property_name]. Value [value] already exists.' should be shown

  Scenario: Scenario 3: Entity Not Found on Query
    Given the system has nodes and relationships stored
    When querying for an entity that does not exist
    Then the system should return an error message
    And the message 'Error: Entity not found.' should be shown

  Scenario: Scenario 4: Constraint Violation on Node Creation
    Given an attempt to create a new node that matches an existing unique constraint
    When the system processes the creation request
    Then the operation should be rejected
    And the message 'Error: Unable to create node. Unique constraint violation for property [property_name].' should be returned

  Scenario: Scenario 5: Update Prevention Due to Unique Constraint
    Given an existing node with a unique property value
    And an attempt to update the node with a value that violates the unique constraint
    When the system processes the update request
    Then the update should be prevented
    And the message 'Error: Update prevented due to unique constraint violation on property [property_name].' should be returned

  Scenario: Scenario 6: Successful Node Merge with Non-Conflict
    Given the node is being merged with a property value that does not conflict with existing unique constraints
    When merging the node
    Then the system should return confirmation message that the node was merged successfully.
    And the message 'Node merged successfully.' should be shown

  Scenario: Scenario 7: Error When Node Exists and is Queried
    Given the node does not exist when queried
    When a query is sent for that node
    Then the system should return an error message
    And the message 'Error: Entity not found.' should be shown

  Scenario Outline: Scenario Outline: Merge Operations with Unique Constraints
    Given a node with property value '<property_value>'
    And an existing node with value '<existing_value>'
    When performing a merge operation
    Then the result should be '<result>'
    Examples:
      | property_value | existing_value | result |
      | Value A | Value B | Node merged successfully. |
      | Value C | Value C | Error: Unique constraint violation for property [property]. Value [Value C] already exists. |

