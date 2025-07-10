Feature: Filtering Based on Node Properties

  As a system user
  I want to query nodes based on specific properties and relationships
  So that I can retrieve accurate data that meets my criteria

  Background:
    Given the system is connected to a database with multiple nodes
    And each node has specific properties and relationships defined

  Scenario: Scenario 1: Retrieve matching nodes by property
    Given a user specifies a property 'category' with value 'electronics'
    When the user executes the query
    Then the system returns all nodes matching 'category' as 'electronics'
    And the nodes returned must only include those with the specified property

  Scenario: Scenario 2: Filter by multiple properties
    Given a user specifies properties 'type' as 'gadget' and 'available' as 'true'
    When the user executes the query
    Then the system returns nodes that satisfy both properties

  Scenario: Scenario 3: Handle non-existent properties
    Given a user specifies a property 'notExist' with any value
    When the user executes the query
    Then the system returns an error message indicating the property is invalid
    And the nodes returned must indicate the specified property does not exist

  Scenario: Scenario 4: Retrieve related nodes with conditions and relationships applied successfully if all properties are valid and relationships exist, ensuring no errors are thrown if otherwise,
    Given a user specifies a property 'location' as 'New York' and applies a relationship filter 'connected_to' with value 'Store'
    When the user executes the retrieval request
    Then the system returns nodes related to 'New York' filtered by 'connected_to' as 'Store', and must accurately reflect the filters applied

  Scenario Outline: Scenario Outline: Retrieve related nodes with filters
    Given a user specifies a property 'location' as <location>
    And the user applies a relationship filter 'connected_to' with value <filter-value>
    When the user executes the retrieval request
    Then the system returns nodes related to <location> filtered by 'connected_to' as <filter-value>
    Examples:
      | location | filter-value |
      | New York | Store |
      | Los Angeles | Warehouse |
      | Chicago | Supplier |

