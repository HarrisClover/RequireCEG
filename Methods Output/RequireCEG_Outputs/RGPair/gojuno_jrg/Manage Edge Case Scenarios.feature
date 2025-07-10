Feature: Manage Edge Case Scenarios

  As a system user
  I want to ensure that coordinates input are validated correctly
  So that the system provides accurate geocoding information

  Background:
    Given the user has coordinates to input
    And the system is operational

  Scenario: Invalid Coordinates Input
    Given the input coordinates are non-numeric
    When the user submits the coordinates
    Then the system should return an error message 'Invalid input: Coordinates must be numeric.'
    And the status code should be 400

  Scenario: Coordinates Out of Range
    Given the input coordinates are valid but lie outside the defined geocoding area
    When the user submits the coordinates
    Then the system should return an error message 'Coordinates are out of range for geocoding services.'
    And the status code should be 404

  Scenario: Multiple Location Matches
    Given the coordinates match multiple potential locations
    When the user queries the geocoding service
    Then the system should return the closest valid address based on proximity rules

  Scenario: Building without Assigned Address
    Given the coordinates pertain to a building without an assigned address
    When the geocoding service processes the coordinates
    Then the system should respond with 'Building without assigned address.'

  Scenario: Tie-Breaker Logic for Address Selection
    Given two potential addresses are found to be equally valid
    When the system applies tie-breaker logic based on administrative boundaries
    Then the most relevant address should be selected

  Scenario: Filtering Results by Points of Interest
    Given a flag indicating a preference for points of interest is set
    When the user submits coordinates with a specific radius
    Then the system should filter results to show only points of interest within that radius
    And the relevant contextual information should still be delivered

  Scenario: Coordinates Match Multiple Locations
    Given the coordinates correspond to multiple potential locations
    When the user queries the geocoding service
    Then the system should prioritize valid addresses over points of interest

  Scenario: Prefer Points of Interest
    Given a flag indicating preference for points of interest is set and valid coordinates are received
    When the user submits the coordinates
    Then the system should return filtered results showing only points of interest
