Feature: Accurate Result Return Across Match Conditions

  As a user querying a graph database
  I want to retrieve the shortest path that matches specific criteria
  So that I can analyze the correct relationships and properties of nodes effectively

  Background:
    Given the graph structure is properly populated with nodes and relationships
    And I understand the predicates required for my query

  Scenario: Scenario 1: Valid path retrieval with predicates
    Given the user executes a Cypher query with valid predicates
    When the query is processed
    Then the system returns the shortest path that meets all defined criteria
    And only nodes that meet the predicate conditions are included

  Scenario: Scenario 2: Handling optional matches
    Given the user includes optional matches in their Cypher query
    When the query is processed
    Then the system returns all potential paths including null nodes where relevant

  Scenario: Scenario 3: Conflict during merge operation
    Given the user attempts to perform a merge operation with conflicting identifiers
    When the operation is executed
    Then the system delivers a clear error message indicating the conflict

  Scenario: Scenario 4: Syntactic error in query
    Given the user submits a Cypher query with a syntax error
    When the system validates the query
    Then the system provides detailed feedback about the syntax error

  Scenario: Scenario 5: Semantic error in query
    Given the user submits a Cypher query with a semantic error
    When the system analyzes the query
    Then the system provides a clear message indicating the nature of the semantic error

  Scenario: Scenario 6: Validating aggregate function results
    Given the user specifies an aggregate function in the Cypher query
    And the nodes meet the specified criteria
    When the system processes the aggregate function
    Then the correct aggregate value is returned based on all matched paths

  Scenario: Scenario 7: Validating filtering of nodes based on relationships
    Given the user includes pattern predicates for filtering relationships
    When the query is processed
    Then the system filters nodes and includes only relationships that meet the specified conditions
