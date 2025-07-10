Feature: Graph Database Query Operations
  As a developer,
  I want to execute and manage complex Cypher queries
  So that I can efficiently perform graph operations with advanced filtering, aggregation, and error handling

  Scenario Outline: Finding the shortest path with conditions
    Given a graph database with indexed nodes and relationships enforcing unique constraints
    And nodes and relationships have properties available for predicate evaluation
    When I execute a Cypher query to find the shortest path using conditions "<conditions>"
    And I apply predicates on node properties and relationship types in the query
    Then the system returns the shortest path matching the provided conditions

  Examples:
    | conditions                                    |
    | "node type 'Customer' with status = 'active'" |
    | "relationship type 'PURCHASED' with amount > 100" |

  Scenario: Aggregating and filtering query results using complex patterns
    Given a graph database containing customer and transaction data
    When I run a query using optional matches and nested structures with list comprehensions
    And aggregate results using case expressions to handle multiple scenarios
    Then the system accurately returns the aggregated and filtered data

  Scenario: Merging nodes and relationships while maintaining constraints
    Given a graph database with predefined indexing and unique constraints on key properties
    When I execute a merge operation on nodes and relationships
    Then the system merges the data correctly
    And it provides clear error feedback if any constraint conflicts occur

  Scenario: Flexible filtering with pattern predicates
    Given a graph database with diverse node and relationship types
    When I run a query that applies pattern predicates to filter based on properties and relationships
    Then the system returns a filtered set of nodes and relationships
    And it correctly manages cases where nodes or relationships do not exist

  Scenario: Clear feedback for syntactic and semantic query errors
    Given a set of complex Cypher queries submitted to the system
    When a query contains syntactic or semantic errors
    Then the system identifies the error type and location
    And it provides clear and actionable feedback to correct the query