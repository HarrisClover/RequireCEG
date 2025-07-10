Feature: Optional Matches Functionality

  As a system user
  I want to retrieve data based on primary paths with optional matches
  So that I can gain insights while maintaining flexibility in my queries

  Background:
    Given the primary path structure exists in the system
    And the appropriate nodes and relationships are defined

  Scenario: Scenario 1: Primary Path Confirmation
    Given a user queries a primary path exists
    When the system evaluates the path with specified nodes
    Then the system confirms the existence of the primary path
    And the user receives a valid response

  Scenario: Scenario 2: Optional Matches Evaluated
    Given a user includes an optional match clause
    When the system checks for additional nodes and relationships
    Then the system includes optional matches in the results if they exist

  Scenario: Scenario 3: No Optional Matches Available
    Given a user queries with optional matches that do not exist
    When the system evaluates the query
    Then the system returns the primary path without generating errors

  Scenario: Scenario 4: Optional Match Conditions Met
    Given the query has conditions on optional matches
    And the conditions applied to nodes are met
    When the user executes the query
    Then the system includes optional matches that meet the specified conditions

  Scenario: Scenario 5: Conditions Not Present
    Given a user queries without including optional match conditions
    When the system executes the query
    Then the system confirms that the optional matches are not included

  Scenario: Scenario 6: Optional Matches with Property Predicates
    Given a user queries with optional matches that include property predicates
    When the system evaluates the optional matches
    Then the system respects the property predicates when filtering results
    And the results are coherent and accurate
