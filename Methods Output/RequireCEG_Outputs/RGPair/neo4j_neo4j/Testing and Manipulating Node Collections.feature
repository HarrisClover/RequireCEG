Feature: Testing and Manipulating Node Collections

  As a system administrator
  I want to process a collection of nodes to identify specific node types and apply defined predicates to filter them according to their properties
  So that I can effectively manage and analyze node data for better decision making

  Background:
    Given a predefined threshold for filtering nodes
    And a collection of nodes containing various types and properties

  Scenario: Identify and filter nodes by properties
    Given the system is ready to process a collection of nodes
    When I apply filters to the nodes based on their properties
    Then the system should return the filtered nodes
    And the count of filtered nodes should exceed the predefined threshold

  Scenario: Summarize aggregated attributes of filtered nodes
    Given the filtered nodes exceed the predefined threshold
    When I request a summary of the aggregated attributes
    Then the system should generate a summary with the appropriate counts or averages

  Scenario: Handle node conflicts during merge
    Given two mergeable nodes with conflicting properties
    When I attempt to merge those nodes
    Then the system should present an error message detailing the conflicting properties

  Scenario: Return message for no matching nodes
    Given a query with optional match criteria that yields no results
    When I run the query
    Then the system should return a message indicating 'No matching nodes found.'

  Scenario: Provide feedback for incompatible node types
    Given a user attempts to manipulate nodes of incompatible types
    When the user executes the manipulation
    Then the system should provide feedback detailing the type mismatch
    And suggest compatible types for manipulation

  Scenario: Validate that no relevant nodes are found for the executed query
    Given the user runs a query with specific optional match criteria
    When the query yields no matching nodes
    Then the system should acknowledge with a message that no relevant nodes were found

  Scenario: Assess the presence of property discrepancies in existing nodes
    Given a set of existing nodes
    When the discrepancies are assessed according to specified constraints
    Then the system should identify any nodes exhibiting property discrepancies

  Scenario Outline: Transform and iterate through node data
    Given a collection of nodes with property values of '<property>'
    And a transformation rule that applies to '<threshold>' nodes
    When I execute the transformation on the collection
    Then the system should return a newly created collection reflecting the changes
    Examples:
      | property | threshold |
      | price | 100 |
      | quantity | 5 |
      | status | active |

