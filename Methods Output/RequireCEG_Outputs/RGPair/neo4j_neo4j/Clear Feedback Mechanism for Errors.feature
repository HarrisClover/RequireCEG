Feature: Clear Feedback Mechanism for Errors

  As a database user
  I want to receive clear error messages when executing Cypher queries
  So that I can quickly identify and rectify issues with my queries

  Background:
    Given the system is capable of executing Cypher queries
    And the user has a valid query to be executed

  Scenario: Syntax Error in Query
    Given the user submits a query with incorrect syntax
    When the system attempts to execute the query
    Then the user receives 'Syntax Error: Please check the query format.'

  Scenario: Non-existing Node or Relationship
    Given the user submits a query that references a non-existing node or relationship
    When the system validates the query
    Then the user receives 'Error: Node or Relationship does not exist.'

  Scenario: Conflict during Merge
    Given the user submits a query that attempts to merge a node or relationship that already exists
    When the system executes the query
    Then the user receives 'Conflict Error: Node or Relationship already exists, cannot merge.'

  Scenario: No Matches Found
    Given the user submits a query with predicates that have no corresponding nodes or relationships
    When the system processes the query
    Then the user receives 'No matches found for the given pattern.'

  Scenario: Misapplied Aggregate Function
    Given the user submits a query that misapplies aggregate functions
    When the system attempts to execute the query
    Then the user receives 'Aggregate Error: Please ensure proper usage of aggregate functions.'

  Scenario: Semantic Error in Query
    Given the user submits a query that references invalid properties or relationships
    When the system validates the query
    Then the user receives 'Semantic Error: Invalid property or relationship reference in the query.'

  Scenario: Syntax Error due to Missing Conditions
    Given the user submits a query that has missing conditions indicating the presence of fault
    When the system attempts to execute the query
    Then the user receives 'Error: Query conditions are not met.'
