Feature: Graph Operations and Query Handling
  As a user of the system,
  I want to perform various graph operations using Cypher queries
  So that I can efficiently retrieve, manipulate, and filter graph data based on different conditions and properties

Scenario Outline: Executing Graph Queries with Various Operations
  Given that the system supports Cypher queries for graph operations
  And the system can handle queries for finding the shortest paths with different node and relationship conditions
  And indexing features are enabled for fast retrievals with unique constraints
  When I perform a graph operation with the following query parameters
    | Query Type        | Condition     | Property or Relationship |
    | Shortest Path     | Distance < 100 | Node: Location           |
    | Aggregate Results | COUNT(*)       | Relationship: PURCHASE  |
    | Optional Match    | Age > 30       | Node: Customer          |
    | Nested Structure  | Total > 500    | Relationship: PURCHASE  |
  Then the system should return the correct results based on the conditions and query structure
  And the query should handle optional matches, aggregations, and nested conditions accurately
  And the system should apply indexing for fast retrievals without performance degradation
  And error handling should be in place for conflicting scenarios or invalid queries

Examples:
  | Query Type        | Condition    | Property or Relationship |
  | Shortest Path     | Distance < 100 | Node: Location          |
  | Aggregate Results | COUNT(*)      | Relationship: PURCHASE  |
  | Optional Match    | Age > 30      | Node: Customer          |
  | Nested Structure  | Total > 500   | Relationship: PURCHASE  |
