Feature: Query Syntax Validation

  As a database administrator
  I want to ensure that Cypher queries are syntactically correct
  So that I can prevent runtime errors and ensure smooth query execution

  Background:
    Given the system is ready to validate Cypher queries
    And the queries need to adhere to defined syntactical standards

  Scenario: Scenario 1: Valid Cypher query
    Given a valid Cypher query is submitted
    When the system parses the query
    Then the system returns a success message for valid query components
    And no errors are reported

  Scenario: Scenario 2: Invalid Cypher query with a syntax error
    Given a Cypher query with a missing keyword is submitted
    When the system parses the query
    Then the system returns an error message indicating the location of the syntax error

  Scenario: Scenario 3: Undefined property type in predicate
    Given a Cypher query with incorrect property type usage is submitted
    When the system checks the predicates
    Then the system returns clear feedback regarding incorrectly formatted optional patterns

  Scenario: Scenario 4: Conflicts in merge conditions
    Given a Cypher query with conflicting merge conditions is submitted
    When the system validates the query
    Then the system returns detailed error messages for conflicts in merge conditions

  Scenario: Scenario 5: Invalid operators used in predicates
    Given a Cypher query that uses invalid operators for predicates
    When the system checks the query
    Then the system returns clear feedback on misuse of operators in predicates

  Scenario Outline: Scenario Outline: Validating optional matches
    Given a Cypher query with optional matches formatted as '<optional-pattern>'
    And an expected output for formatted optional matches <formatting-status>
    When the system validates the optional patterns
    Then the outcome is <validation-result>
    Examples:
      | optional-pattern | formatting-status | validation-result |
      | MATCH (n:Label) OPTIONAL MATCH (m:Label) | correctly formatted | validation successful |
      | MATCH (n:Label) OPTIONA MATCH (m:Label) | incorrectly formatted | error: unexpected token at line 1, column 35 |

