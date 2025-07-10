Feature: Custom Predicate Support for Paths

  As a system administrator
  I want to evaluate paths based on specific predicates related to nodes and their relationships
  So that I can ensure path connections are valid and maintain data integrity

  Background:
    Given a graph database containing nodes with various relationships
    And each node may have properties affecting path evaluations

  Scenario: Scenario 1: Valid FRIEND relationship
    Given node A has a FRIEND relationship with node B
    And both nodes have the active property set to true
    When evaluating the path between node A and node B
    Then the path should be included in the results
    And the connection is considered valid

  Scenario: Scenario 2: Ignoring co-worker relationship in HR
    Given node A has a CO-WORKER relationship with node B
    And node B's department property is set to HR
    When evaluating the path between node A and node B
    Then the path should be ignored
    And the evaluation continues to the next path

  Scenario: Scenario 3: Validating optional match with location
    Given node A connected to node B
    And an optional match for node C exists
    When node C has a location property set to NY
    Then the path should be considered valid
    And returned as part of the results

  Scenario: Scenario 4: Handling merging conflict
    Given a merging operation is attempted involving node D
    When a conflict arises due to an existing node with the same identifier
    Then an error message indicating a merging conflict should be raised

  Scenario: Scenario 5: Must validate active properties
    Given node A has a FRIEND relationship with node B
    And node A's active property is true
    And node B's active property is true
    When evaluating the conditions
    Then both active properties must be verified

  Scenario: Scenario 6: Communication of errors
    Given a path evaluation is processed
    And there are syntactic or semantic errors in the predicates
    When errors are identified during evaluation
    Then the evaluation should communicate specific error messages

  Scenario Outline: Scenario Outline: Path Evaluation
    Given a relationship type is '<relationship-type>'
    And both nodes have active property set to '<active>'
    When evaluating path with node C having property '<property>'
    Then the path should be '<path-status>'
    And return results should include '<results>'
    Examples:
      | relationship-type | active | property | path-status | results |
      | FRIEND | true | NY | valid | path included |
      | CO-WORKER | false | HR | ignored | path excluded |
      | FRIEND | true | LA | invalid | no results |

