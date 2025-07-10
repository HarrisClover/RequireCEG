Feature: Path Value Determination

  As a system analyst
  I want to categorize paths based on their nodes and relationships
  So that I can classify paths accurately for better data analysis and reporting

  Background:
    Given the path contains nodes of various types and relationships
    And the path properties are defined, including distance and population

  Scenario: Scenario 1: Local Path Evaluation
    Given a path with a 'City' node and a 'CONNECTS' relationship
    And the distance is 5 miles
    When evaluating the path value
    Then the path value should be assigned as 'LOCAL'
    And a log entry is made indicating that the distance is under 10 miles

  Scenario: Scenario 2: International Path Evaluation
    Given a path with a 'Country' node and a 'borders' relationship with a 'City' node
    When evaluating the path value
    Then the path value should be assigned as 'INTERNATIONAL'
    And a log entry is made indicating that the 'borders' relationship was found

  Scenario: Scenario 3: Trade Network Evaluation
    Given a path with a node having a population property exceeding 1 million
    And the relationship is of type 'TRADES_WITH'
    When evaluating the path value
    Then the path value should be assigned as 'TRADE_NETWORK'
    And a log entry is made indicating that the population condition was satisfied

  Scenario: Scenario 4: Certified Supply Chain Evaluation
    Given a path involving a 'Factory' node and a 'SUPPLIES' relationship
    And the factory has a 'certification' property set to 'ISO9001'
    When evaluating the path value
    Then the path value should be assigned as 'CERTIFIED_SUPPLY_CHAIN'
    And a log entry is made confirming the factory's certification

  Scenario: Scenario 5: Path Evaluation with Trade Relationship and Population Requirement
    Given a path with a 'City' node that has multiple trade relationships
    And one of these relationships is 'TRADES_WITH' with a population property exceeding 1 million
    When evaluating the path value
    Then the path value should be assigned as 'TRADE_NETWORK'
    And appropriate log messages are generated for decision-making

  Scenario Outline: Scenario Outline: Path Evaluation with Different Conditions
    Given a path includes a node of type '<NodeType>'
    And the relationship type is '<RelationshipType>'
    When the distance is <distance_miles> miles
    Then the path value should be '<expected_value>'
    Examples:
      | NodeType | RelationshipType | distance_miles | expected_value |
      | City | CONNECTS | 5 | LOCAL |
      | Country | borders | 10 | INTERNATIONAL |
      | City | TRADES_WITH | 2 | TRADE_NETWORK |
      | Factory | SUPPLIES | 8 | CERTIFIED_SUPPLY_CHAIN |

