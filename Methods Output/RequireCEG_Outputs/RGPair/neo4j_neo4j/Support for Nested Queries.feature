Feature: Support for Nested Queries

  As a database user
  I want the system to execute Cypher queries with nested match operations
  So that I can retrieve comprehensive results that align with my complex querying needs

  Background:
    Given the system is configured to handle nested queries
    And the user has access rights to execute queries

  Scenario: Scenario 1: Valid Nested Match Query
    Given a primary match query that encodes specific node relationships
    And a nested match that filters nodes based on properties
    When the user executes the nested match query
    Then the system returns results satisfying the primary and nested conditions
    And all relevant nodes are included in the output

  Scenario: Scenario 2: Optional Match Inclusion
    Given a primary query that has an optional match component
    When the user executes the query
    Then the system includes results for all nodes regardless of the optional condition
    And the system indicates which results were conditional

  Scenario: Scenario 3: Conflicting Predicates
    Given a nested query with predicates conflicting with the main query
    When the user executes the query
    Then the system communicates which criteria take precedence

  Scenario: Scenario 4: Syntax Error Handling
    Given the user inputs a query with a syntax error
    When the user submits the query
    Then the system manages request syntax errors with precise, helpful messages

  Scenario: Scenario 5: Constraint Error Handling
    Given the user inputs a query that causes a constraint error
    When the user submits the query
    Then the system manages constraint errors with precise, helpful messages, facilitating user debugging

  Scenario Outline: Scenario Outline: Query with Multiple Conditions
    Given the user specifies a <primary-condition> in the primary match
    And the user includes <nested-condition> in the nested query
    When the user submits the nested query for execution
    Then results are returned that meet <expected-criteria>
    Examples:
      | primary-condition | nested-condition | expected-criteria |
      | condition1 | filter1 | results1 |
      | condition2 | filter2 | results2 |
      | condition3 | filter3 | results3 |

