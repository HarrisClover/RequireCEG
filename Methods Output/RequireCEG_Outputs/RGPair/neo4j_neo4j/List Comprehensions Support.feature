Feature: List Comprehensions Support

  As a user of the system
  I want to filter and manipulate a collection of nodes based on specific properties or relationship types
  So that I can effectively retrieve and transform data according to my requirements

  Background:
    Given the system enables filtering of nodes through specific criteria
    And the user has access to a collection of nodes with defined properties

  Scenario: Filter nodes by property value
    Given a user specifies a filter criterion where the 'status' property equals 'active'
    When the user applies the filter
    Then the system should generate a new collection of filtered nodes that match the 'active' status
    And the user can view the filtered list

  Scenario: Transform node data
    Given a user wants to transform node data through mapping functions
    When the user applies a transformation
    Then the system should return a collection with the transformed node data

  Scenario: Handle conflicting filters
    Given a user applies conflicting filter criteria
    When the user attempts to execute the query
    Then the system should present a clear error message indicating the nature of the conflicts

  Scenario: Filter by relationship type
    Given a user specifies a filter criterion based on the relationship type between nodes
    When the user applies the filter
    Then the system should generate a new collection of nodes based on the specified relationship type
    And the user can view the resulting collection

  Scenario: Ensure proper data manipulation
    Given a user manipulates data within the comprehension using mapping functions
    When the user applies the mapping functions
    Then the system should transform node data according to the mapping functions applied by the user

  Scenario: Prevent contradictory filters
    Given a user attempts to filter nodes that contradict the defined constraints
    When the user executes the filter
    Then the system should present an error message indicating a conflict due to contradiction in specified constraints
    And the error message details the nature of the conflict and guides the user in adjusting their query

  Scenario Outline: Scenario Outline: Complex Query Operations
    Given the user has a collection of nodes with various properties
    And the filter criterion is <filter-criterion>
    When the user applies the filter and transformation
    Then the system returns the resulting collection matching <expected-result>
    Examples:
      | filter-criterion | expected-result |
      | status = 'active' | collection of active nodes |
      | type = 'product' | collection of product nodes |
      | category = 'electronics' | collection of electronic items |

