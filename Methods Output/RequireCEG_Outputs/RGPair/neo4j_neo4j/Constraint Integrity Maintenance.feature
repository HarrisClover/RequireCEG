Feature: Constraint Integrity Maintenance

  As a user
  I want to ensure unique properties in the system
  So that integrity and consistency are maintained in my operations

  Background:
    Given the system has existing nodes with unique properties
    And the user is logged into the system

  Scenario: Scenario 1: Attempt to create a conflicting node
    Given a node with unique property 'username' already exists
    When the user attempts to create a new node with the same 'username'
    Then the system shall output an error message indicating a unique constraint violation
    And the message shall specify the unique constraint violation

  Scenario: Scenario 2: Successful node creation followed by conflict
    Given the user has successfully created a node with unique property 'email'
    When the user attempts to create another node with the same 'email'
    Then the system shall prevent the operation
    And the user receives feedback identifying the existing node with the conflicting property

  Scenario: Scenario 3: Merge leads to integrity constraint violation
    Given two nodes with conflicting relationships
    When the user attempts to merge the nodes
    Then the system shall rollback the operation
    And inform the user of the specific integrity constraint issues causing the rollback

  Scenario: Scenario 4: Query with optional conditions results in no matches
    Given multiple nodes satisfying different properties
    And the user introduces constraints on optional matching
    When the user performs a query with optional match conditions
    Then the system shall return an empty result set
    And the response will explain the constraint violations leading to no matches

  Scenario: Scenario 5: Processing list comprehensions that violate constraints
    Given the user processes list comprehensions based on existing nodes
    When some results do not adhere to the integrity constraints
    Then the system shall filter out invalid results
    And the user shall be notified of the enforcement of rules

  Scenario: Scenario 6: Submitting a query with semantic errors
    Given the user crafts a query containing semantic errors
    When the user submits the query
    Then the system shall return detailed feedback outlining the syntactic or semantic errors
