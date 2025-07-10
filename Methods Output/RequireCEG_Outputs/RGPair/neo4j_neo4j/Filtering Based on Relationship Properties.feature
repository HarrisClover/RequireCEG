Feature: Filtering Based on Relationship Properties

  As a user querying relationships
  I want to filter relationships based on type and specific properties
  So that I can retrieve only the relevant connections in my dataset

  Background:
    Given the system contains multiple relationships with different types and properties
    And the user has specified the relationship type and filtering criteria

  Scenario: Scenario 1: Filter Friends by Year
    Given the user selects the relationship type as 'FRIENDS'
    And specifies a filter for the property 'since' as 2015
    When the user executes the query
    Then only friends whose relationship started after 2015 are returned
    And no relationships with 'active' property set to false are included in the results

  Scenario: Scenario 2: Filter Colleagues by Role
    Given the user selects the relationship type as 'COLLEAGUES'
    When the user specifies a filter for the property 'role' as 'manager'
    Then only colleagues with the manager role are displayed

  Scenario: Scenario 3: Active Relationships Only
    Given the user specifies a filter to exclude inactive relationships
    When the query is executed with any relationship type
    Then no relationships with 'active' property set to false are included in the results

  Scenario Outline: Scenario Outline: Multiple Filters
    Given the user selects the relationship type as <relationship-type>
    And applies filters for <filter-property> with value <filter-value>
    When the user executes the query
    Then only relationships that meet all criteria are returned
    Examples:
      | relationship-type | filter-property | filter-value | outcome |
      | FRIENDS | since | 2015 | friends established after 2015 |
      | COLLEAGUES | role | manager | managers are shown |
      | FRIENDS | active | false | no inactive friends are included |

