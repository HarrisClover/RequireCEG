Feature: Indexing Features for Fast Retrieval

  As a database administrator
  I want to enforce unique constraints on node properties and utilize indexing for fast retrieval
  So that the system can perform efficient searches and ensure data integrity

  Background:
    Given that multiple unique constraints are defined across various properties
    And the system is configured to prioritize the most selective index

  Scenario: Creating a new node without violating unique constraints
    Given a user attempts to create a node with a unique property
    When the creation does not conflict with existing nodes
    Then the node is successfully created
    And the system implements a feedback mechanism to alert users about constraints involved in operations

  Scenario: Attempting to create a node that breaches a unique constraint
    Given a user tries to create a node with an existing unique property value
    When the system detects the conflict
    Then the system raises an error message indicating the nature of the conflict

  Scenario: Querying nodes without engaging indexes
    Given a query retrieves nodes without utilizing defined indexes
    And the query includes optional matches on indexed relationships
    When the query is executed
    Then the execution time significantly increases

  Scenario: Optimizing indexed query execution time
    Given a user runs a query that employs aggregate functions on indexed nodes
    When the query is executed
    Then the system responds quickly with accurate results
    And the system utilizes indices to enhance efficiency for queries with aggregate functions

  Scenario: Attempting an operation that compromises integrity of constraints
    Given an operation that risks violating unique constraints
    When the operation is attempted
    Then the system alerts the user about the constraints involved

  Scenario Outline: Querying nodes with and without engaging indexes
    Given a query retrieves nodes without utilizing defined indexes
    And the query includes optional matches on indexed relationships
    When the query is executed
    Then the execution time significantly increases
    Examples:
      | Query Type | Index Usage | Expected Outcome |
      | Non-indexed query | No | Increased execution time |
      | Indexed query | Yes | Fast response time |
      | Query with aggregate function | Yes | Efficient execution and accurate results |

