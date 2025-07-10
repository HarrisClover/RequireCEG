Feature: Prioritize Major Addresses Over Points of Interest

  As a user seeking location information
  I want the system to return the nearest major address when provided with coordinates
  So that I can get accurate and relevant location details

  Background:
    Given the input coordinates are numeric and within valid geographic bounds
    And the system has access to major addresses and points of interest in the area

  Scenario: Scenario 1: Major Address Found
    Given the coordinates correspond to a major address
    When the user queries the system with those coordinates
    Then the system should return the major address along with city, county, and state information
    And the input coordinates are valid

  Scenario: Scenario 2: Point of Interest But Close to Major Address
    Given the coordinates correspond to a point of interest near a major address
    When the user queries the system with those coordinates
    Then the system should prioritize and return the information for the nearest major address

  Scenario: Scenario 3: Multiple Major Addresses in Proximity
    Given the coordinates are within proximity of multiple major addresses
    When the user queries the system with those coordinates
    Then the system should return the nearest major address information

  Scenario: Scenario 4: No Major Addresses Found
    Given the coordinates do not correspond to any major addresses
    When the user queries the system with those coordinates
    Then the system should return the closest point of interest with relevant city, county, and state information

  Scenario: Scenario 5: Invalid Input
    Given the input coordinates are non-numeric or outside of valid geographic bounds
    When the user queries the system with those coordinates
    Then the system should generate an error message indicating invalid input along with the appropriate status code
