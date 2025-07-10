Feature: Optional Match Queries
  As a Developer,
  I want to use OPTIONAL MATCH in Cypher queries,
  So that I can retrieve information that might or might not exist without filtering out the primary results.

  Background:
    Given a graph database containing nodes representing 'Users' and 'Orders'
    And some 'Users' have placed 'Orders', while others have not

  Scenario: Retrieve users and their optional orders
    When I execute a Cypher query using OPTIONAL MATCH to find 'Users' and their associated 'Orders'
    Then the result should include all 'Users'
    And for users with orders, the corresponding 'Order' details should be included
    And for users without orders, the order-related fields should be null

  Scenario: Optional match with conditions on the optional part
    When I execute a Cypher query using OPTIONAL MATCH to find 'Users' and their 'Orders' placed after '2023-01-01'
    Then the result should include all 'Users'
    And only 'Orders' matching the date condition should be returned alongside their 'Users'
    And users with no orders or only orders before the date should show null for order details