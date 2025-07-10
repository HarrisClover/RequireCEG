Feature: Shortest Path Queries
  As a Data Analyst,
  I want to find the shortest paths between nodes using Cypher queries,
  So that I can understand the closest relationships within the graph data.

  Background:
    Given a graph database containing nodes and relationships with properties

  Scenario: Find the shortest path between two specific nodes
    When I execute a Cypher query to find the shortest path between node 'A' and node 'Z'
    Then the system should return the sequence of nodes and relationships representing the shortest path
    And the path length should be correct

  Scenario: Find the shortest path considering node property predicates
    Given node 'B' on a potential path has property 'status' = 'active'
    When I execute a Cypher query for the shortest path between 'A' and 'Z' where all intermediate nodes must have 'status' = 'active'
    Then the system should return the shortest path satisfying the node property condition
    Or indicate that no such path exists

  Scenario: Find the shortest path considering relationship type predicates
    When I execute a Cypher query for the shortest path between 'A' and 'Z' using only relationships of type 'FRIENDS_WITH'
    Then the system should return the shortest path satisfying the relationship type condition
    Or indicate that no such path exists

  Scenario: Find the shortest path with combined node and relationship conditions
    Given node 'C' has property 'level' > 5
    And relationship 'CONNECTS' has property 'weight' < 10
    When I execute a Cypher query for the shortest path between 'A' and 'Z' where nodes have 'level' > 5 and relationships are 'CONNECTS' with 'weight' < 10
    Then the system should return the shortest path satisfying all conditions
    Or indicate that no such path exists

  Scenario: Handle cases where no path exists
    Given there is no path between node 'X' and node 'Y' matching the criteria
    When I execute a Cypher query for the shortest path between 'X' and 'Y'
    Then the system should return an empty result or indicate no path found