Feature: Pattern Predicate Filtering
  As a Data Analyst,
  I want to use pattern predicates in WHERE clauses,
  So that I can filter results based on the existence or properties of related nodes and relationships.

  Background:
    Given a graph database with 'Customers', 'Orders', and 'Products'

  Scenario: Filter nodes based on the existence of a relationship pattern
    When I execute a Cypher query to find 'Customers' WHERE exists((customer)-[:PLACED]->(:Order))
    Then the result should only include 'Customers' who have placed at least one 'Order'

  Scenario: Filter nodes based on properties within a pattern predicate
    When I execute a Cypher query to find 'Products' WHERE exists((:Order {status: 'Shipped'})-[:CONTAINS]->(product))
    Then the result should only include 'Products' that are part of an 'Order' with status 'Shipped'

  Scenario: Use NOT EXISTS in pattern predicate
    When I execute a Cypher query to find 'Customers' WHERE NOT exists((customer)-[:PLACED]->(:Order {status: 'Returned'}))
    Then the result should include 'Customers' who have never placed an order that was 'Returned'