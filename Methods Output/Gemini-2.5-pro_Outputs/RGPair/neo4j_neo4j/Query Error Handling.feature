Feature: Query Error Handling
  As a Developer,
  I want the system to provide clear feedback on query errors,
  So that I can easily debug my Cypher queries.

  Scenario: Execute a query with incorrect syntax
    When I execute a Cypher query with a syntax error (e.g., misspelled keyword 'MACTH' instead of 'MATCH')
    Then the system should reject the query
    And provide a clear error message indicating a syntax error and its approximate location

  Scenario: Execute a query with a semantic error
    When I execute a Cypher query referencing a non-existent label 'Usser' instead of 'User'
    Then the system should reject the query
    And provide a clear error message indicating an unknown label or semantic issue

  Scenario: Execute a query violating a constraint (covered in Merge/Constraint features, but important for error handling)
    Given a unique constraint on 'User.email'
    When I execute a CREATE query attempting to create a User with a duplicate email
    Then the operation should fail
    And the system should report a specific constraint violation error message