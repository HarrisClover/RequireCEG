Feature: Graph Query Operations
  As a user of the graph database,
  I want to execute Cypher queries efficiently with flexible conditions and aggregation,
  So that I can retrieve, manipulate, and analyze data from the graph.

  Scenario: Querying graph data with conditions on nodes and relationships
    Given that I have a graph database with nodes and relationships
    When I execute a Cypher query with conditions on node properties and relationships
    Then the system should return the correct nodes and relationships that meet the specified conditions

  Scenario: Efficient data retrieval using indexes and constraints
    Given that there are indexes and constraints set on certain node properties
    When I query the graph using those indexed properties
    Then the system should retrieve the data quickly and accurately

  Scenario: Using aggregate functions and optional matches
    Given that I have a query with aggregate functions or optional matches
    When I run the query
    Then the system should correctly aggregate the results and handle optional matches as expected

  Scenario: Working with list comprehensions
    Given that I have a list of nodes or relationships
    When I apply list comprehension in my query
    Then the system should return a manipulated or tested collection of nodes as requested

  Scenario: Merging nodes and relationships
    Given that I have nodes and relationships to merge
    When I attempt to merge them
    Then the system should either merge them correctly or provide a clear error message if there is a conflict

  Scenario: Error handling for incorrect queries
    Given that I input a query with syntactic or semantic errors
    When I execute the query
    Then the system should return an error message indicating the issue with the query

