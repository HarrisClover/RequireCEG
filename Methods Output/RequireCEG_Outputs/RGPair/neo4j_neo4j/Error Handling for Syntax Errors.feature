Feature: Error Handling for Syntax Errors

  As a database user
  I want the system to verify the syntax of my Cypher queries
  So that I can get constructive feedback to correct any errors

  Background:
    Given that a Cypher query is submitted to the system
    And it requires evaluation for correctness

  Scenario: Scenario 1: Valid Syntax
    Given a valid Cypher query
    When the query is processed
    Then the results should be returned to the user
    And no error messages are generated

  Scenario: Scenario 2: Syntax Error Detected
    Given an invalid Cypher query
    When the query is processed
    Then an error message indicating the syntax error is provided
    And the location of the error is specified

  Scenario: Scenario 3: Unsupported Operations
    Given a Cypher query containing unsupported operations
    When the query is processed
    Then an error message indicating unsupported features is generated

  Scenario: Scenario 4: Non-existent Nodes or Relationships
    Given a Cypher query referencing non-existent nodes
    When the query is processed
    Then the user is informed that the specified entities do not exist

  Scenario: Scenario 5: Conflicting Conditions
    Given a Cypher query with multiple conflicting conditions
    When the query is processed
    Then the user is alerted about the conflicts

  Scenario: Scenario 6: Missing Properties
    Given a Cypher query missing required properties for a predicate
    When the query is processed
    Then the user is prompted to verify the property specifications

  Scenario: Scenario 7: Multiple Conflicting Conditions
    Given a Cypher query with multiple conflicting conditions
    When the query is processed
    Then the user is alerted about the conflicts
    And the user must resolve the conflicts before proceeding

  Scenario: Scenario 8: Missing Conditions
    Given a Cypher query that lacks required conditions
    When the query is processed
    Then the user is prompted to add the missing conditions
