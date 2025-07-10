Feature: Find Shortest Path with Node Conditions

  As a database user
  I want to find the shortest path between two nodes with specified conditions
  So that I can efficiently navigate and retrieve relationships within the database

  Background:
    Given the database contains nodes with predefined properties
    And the nodes must meet specific conditions to be considered in the search

  Scenario: Valid path with existing nodes
    Given Node A and Node B exist in the database
    And Node A and Node B meet the required property conditions
    When I request the shortest path between Node A and Node B
    Then the system should return all valid shortest paths found between Node A and Node B
    And the paths should include only valid relationships

  Scenario: Invalid path due to missing Node A
    Given Node A does not exist in the database
    When I request the shortest path between Node A and Node B
    Then the system should return an error message indicating that Node A is missing

  Scenario: Invalid path due to missing Node B
    Given Node A exists but Node B does not exist in the database
    When I request the shortest path between Node A and Node B
    Then the system should return an error message indicating that Node B is missing

  Scenario: Invalid path due to failing conditions
    Given Node A and Node B exist in the database
    And Node A does not meet the required property conditions
    When I request the shortest path between Node A and Node B
    Then the system should return an error message indicating that the conditions are not met

  Scenario: Unique constraints violation
    Given Node A and Node B exist in the database
    And there are unique constraints that are being violated
    When I request the shortest path between Node A and Node B
    Then the system should return an error message detailing unique constraints violation, including nature of conflict

  Scenario: Syntax error in query
    Given Node A and Node B exist in the database
    When I submit a syntactically incorrect query to find the shortest path
    Then the system should return an error message detailing syntax error location with recommendations

  Scenario: Semantic error in query
    Given Node A and Node B exist in the database
    When I submit a semantically incorrect query to find the shortest path
    Then the system should return an error message detailing semantic error location with recommendations

  Scenario: Multiple shortest paths exist
    Given Node C and Node D exist in the database
    And there are multiple valid paths between Node C and Node D
    When I request the shortest path between Node C and Node D
    Then the system should return all valid shortest paths
