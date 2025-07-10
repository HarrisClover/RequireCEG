Feature: Complex Query Patterns
  As a Developer,
  I want to use nested structures and case expressions in Cypher queries,
  So that I can implement sophisticated data retrieval logic.

  Background:
    Given a graph database with 'Employee' nodes having 'level' and 'department' properties

  Scenario: Use CASE expression for conditional results
    When I execute a Cypher query that returns an 'Employee's name and a 'seniority' value based on their 'level' using a CASE expression (e.g., level > 5 -> 'Senior', else 'Junior')
    Then the result should include the correct 'seniority' value for each employee based on the defined logic

  Scenario: Utilize nested matching patterns
    When I execute a Cypher query that finds 'Managers' who manage 'Employees' working on 'Projects' located in 'London' (requiring nested matches)
    Then the system should return only the 'Managers' matching the complete nested pattern