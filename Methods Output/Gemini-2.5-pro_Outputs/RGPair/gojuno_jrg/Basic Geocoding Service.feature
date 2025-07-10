Feature: Basic Geocoding Service

  As a client application,
  I want to get accurate city, county, and state information for geographic coordinates
  So that I can identify the location details for points within New York and neighboring states.

  Scenario Outline: Successfully geocode coordinates within supported regions
    Given the geocoding service is available
    When I request geocoding for latitude <latitude> and longitude <longitude>
    Then the system should return a successful status code
    And the response should contain the city "<city>"
    And the response should contain the county "<county>"
    And the response should contain the state "<state>"

    Examples: Supported Locations
      | latitude | longitude | city         | county      | state | description              |
      | 40.7128  | -74.0060  | New York     | New York    | NY    | New York City            |
      | 42.6526  | -73.7562  | Albany       | Albany      | NY    | Albany, NY               |
      | 40.7357  | -74.1724  | Newark       | Essex       | NJ    | Neighboring State (NJ)   |
      | 41.7658  | -72.6734  | Hartford     | Hartford    | CT    | Neighboring State (CT)   |
      # Add more examples for other neighboring states and edge cases within NY

  Scenario: Attempt to geocode coordinates outside supported regions
    Given the geocoding service is available
    When I request geocoding for latitude 34.0522 and longitude -118.2437 # Los Angeles coordinates
    Then the system should return an appropriate status code indicating location not supported or not found
    And the response should indicate that the location is outside the service area