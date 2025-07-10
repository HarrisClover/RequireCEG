Feature: List Comprehensions
  As a Developer,
  I want to use list comprehensions in Cypher queries,
  So that I can efficiently manipulate and filter collections of nodes or values within a query.

  Background:
    Given a graph database where 'Users' have a list property 'interests'

  Scenario: Filter elements within a list property using list comprehension
    When I execute a Cypher query using list comprehension to return 'Users' and only their 'interests' that start with 'Tech'
    Then the result should include users with their filtered list of interests

  Scenario: Transform elements within a list using list comprehension
    Given 'Product' nodes connected by 'CONTAINS' relationships to 'Component' nodes with 'cost' property
    When I execute a Cypher query that collects 'Component' costs for each 'Product' and uses list comprehension to calculate a 10% markup for each cost
    Then the result should include each 'Product' and a list of marked-up costs for its components