Feature: Basic Query Execution

  As a user interacting with the graph database
  I want to input a well-formed Cypher query
  So that I can retrieve accurate results based on my specified patterns and conditions

  Background:
    Given the database contains existing nodes and relationships
    And the query adheres to the syntactic rules of the Cypher language

  Scenario: Valid Query Execution
    Given a user submits a valid Cypher query
    When the system parses and executes the query
    Then the user receives accurate results that match the specified patterns
    And the execution time is optimally reduced using indexing features

  Scenario: Shortest Path Query Execution
    Given a valid shortest path query
    When the system computes the shortest path between defined nodes
    Then the user receives the shortest path based on existing relationships and node properties

  Scenario: Optional Matches Handling
    Given a query with optional matches
    When the system executes the query
    Then the user receives all relevant nodes, including those without matches for optional elements

  Scenario: Constraint Violation Error
    Given a query that attempts to merge nodes violating database constraints
    When the user submits the merge operation
    Then the system provides a clear error message articulating the nature of the conflict

  Scenario: Pattern Predicate Filtering
    Given a query with pattern predicates applied
    When the system filters based on the defined properties and relationships
    Then the user retrieves precise and relevant data

  Scenario: Syntactic Error Feedback
    Given a user inputs a query with syntactic errors
    When the system attempts to execute the query
    Then the system generates feedback identifying specific errors in the query

  Scenario: Semantic Error Feedback
    Given a user inputs a query with semantic errors
    When the system attempts to execute the query
    Then the system generates feedback identifying specific semantic errors in the query

  Scenario: Syntactic and Semantic Error Detection
    Given a user inputs a query with both syntactic and semantic errors
    When the system attempts to execute the query
    Then the system generates feedback identifying specific syntactic and semantic errors in the query

  Scenario: Combination Detection of Constraints
    Given a user inputs queries to merge nodes while having syntactic, semantic, and constraint issues
    When the system processes the queries
    Then the user receives feedback detailing all identified errors, ensuring clarity on each issue
