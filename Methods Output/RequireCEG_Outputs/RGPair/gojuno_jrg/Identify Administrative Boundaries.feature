Feature: Identify Administrative Boundaries

  As a system user
  I want to validate geographic coordinates and identify administrative boundaries
  So that I can retrieve accurate location information for the given coordinates

  Background:
    Given the input coordinates are provided
    And the system is ready to validate the format and numeric value

  Scenario: Valid coordinates within New York
    Given the coordinates (40.7128, -74.0060)
    When validating the geographic coordinates
    Then the system should return the city as 'New York', county as 'New York', and state as 'NY'
    And the geographic coordinates are numeric and in the correct format

  Scenario: Valid coordinates outside New York but within neighboring state
    Given the coordinates (41.6005, -74.2003)
    When validating the geographic coordinates
    Then the system should return the city as 'Newark', county as 'Essex', and state as 'NJ'
    And the geographic coordinates are numeric and in the correct format

  Scenario: Invalid coordinates format
    Given the coordinates ('abc', 'xyz')
    When validating the geographic coordinates
    Then the system should return an error status code indicating a bad request

  Scenario: Coordinates not falling within recognized boundaries
    Given the coordinates (39.9999, -74.9999)
    When validating the geographic coordinates
    Then the system should return an error message indicating the location is invalid
    And the geographic coordinates are numeric and in the correct format

  Scenario: Ambiguous coordinates with overlapping boundaries
    Given the coordinates <latitude>, <longitude>
    When validating the geographic coordinates
    Then the system should return the closest valid administrative information for overlapping boundaries
    Examples:
      | latitude | longitude |
      | 40.6782 | -73.9442 |
      | 40.7128 | -74.0060 |
      | 40.7851 | -73.9683 |
      | 41.0170 | -73.2660 |


  Scenario: Identifying coordinates with unclear boundaries
    Given the coordinates (40.1234, -73.5678)
    When validating the geographic coordinates
    Then the system should assess and return the closest valid administrative information
    And the coordinates pertain to an address with unclear boundaries
