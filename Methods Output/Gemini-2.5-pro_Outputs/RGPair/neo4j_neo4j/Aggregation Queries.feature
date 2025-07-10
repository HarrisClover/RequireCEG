Feature: Aggregation Queries
  As a Data Scientist,
  I want to perform aggregation operations using Cypher,
  So that I can summarize graph data effectively.

  Background:
    Given a graph database containing 'Product' nodes with 'price' properties and 'Order' relationships

  Scenario: Count nodes matching a pattern
    When I execute a Cypher query to count the number of 'Product' nodes with 'category' = 'Electronics'
    Then the system should return the correct count of matching nodes

  Scenario: Calculate aggregate values from properties
    When I execute a Cypher query to calculate the average 'price' of all 'Product' nodes
    Then the system should return the correct average value

  Scenario: Group results and aggregate per group
    When I execute a Cypher query to count the number of 'Products' per 'category'
    Then the system should return each 'category' along with its corresponding product count

  Scenario: Collect values into a list
    When I execute a Cypher query to collect all 'productID's for 'Products' in the 'Clothing' category
    Then the system should return a list containing the correct 'productID's