Feature: Find Shortest Path with Relationship Conditions

  As a user searching for paths in a graph
  I want to find the shortest path considering specific node properties and relationship types
  So that I can obtain accurate and relevant results based on my constraints

  Background:
    Given a graph with nodes and relationships defined
    And the user has specific conditions for the path search

  Scenario: Scenario 1: Shortest path with valid conditions
    Given a user requests a path with specific node properties
    And the properties are compatible with existing nodes
    When the user specifies the desired relationship types
    Then the system returns the shortest valid path
    And the path fulfills all specified criteria

  Scenario: Scenario 2: No valid path found
    Given the user requests a path with conflicting predicates
    When the conditions contradict each other
    Then the system provides a message stating that no valid path was found

  Scenario: Scenario 3: Invalid node property predicates
    Given the user includes node property predicates with contradictions
    When the system evaluates the request
    Then the system generates an error message indicating conflicting node property predicates

  Scenario: Scenario 4: Incompatible relationship types
    Given the user specifies relationship types with contradictions
    When the system processes the request
    Then the system generates an error message indicating incompatible relationship types

  Scenario: Scenario 5: No valid path found with non-existent path conditions
    Given the user requests a path with no valid connections
    When the conditions searched do not match any valid paths
    Then the system provides a message stating that no valid path was found
