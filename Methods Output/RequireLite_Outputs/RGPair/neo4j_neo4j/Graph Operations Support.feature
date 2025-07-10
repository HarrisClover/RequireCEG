Feature: Graph Operations Support

  As a database administrator
  I want the system to support various graph operations using Cypher queries
  So that I can efficiently manage and query graph data

  Background:
    Given the system is initialized with predefined graph data, including nodes for users, products, and their relationships
    And the user has the necessary permissions to execute queries

  Scenario: Scenario 1: Shortest Path Calculation
    Given the user specifies a start node labeled 'UserA' and an end node labeled 'UserB'
    When the user executes a Cypher query to find the shortest path between 'UserA' and 'UserB'
    Then the system should return the correct shortest path, including all relationships
    And the response time should be no longer than 2 seconds

  Scenario: Scenario 2: Predicate Application
    Given the user wants to apply predicates on node properties such as 'age' or 'location'
    When the user executes a query to filter users older than 30 years
    Then the system should return all user nodes that match the specified criteria

  Scenario Outline: Scenario Outline: Complex Querying Patterns
    Given the user executes a query with nested structures <query-structure>
    When the system processes the request
    Then the system should return aggregate results <results>
    And the user also intends to define optional matches with the results
    Examples:
      | query-structure | optional-match | results |
      | MATCH (a)-[r]->(b) RETURN a | WITH a OPTIONAL MATCH (c) RETURN c | 3 nodes found |
      | MATCH (x)-[y]->(z) RETURN x | WITH x OPTIONAL MATCH (w) RETURN w | 2 nodes found |
      | MATCH (p)-[q]->(r) RETURN r | WITH r OPTIONAL MATCH (s) RETURN s | 5 nodes found |

