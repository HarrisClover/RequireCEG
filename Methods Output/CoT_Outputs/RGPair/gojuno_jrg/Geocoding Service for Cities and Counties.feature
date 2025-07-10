Feature: Geocoding Service for Cities and Counties

  As a user,
  I want the system to accurately return city, county, and state information for given geographic coordinates
  So that I can identify locations based on the geographic data.

  Scenario Outline: Geocoding Locations in New York and Neighboring States
    Given the geographic coordinates are <latitude> and <longitude>
    When the system performs geocoding for these coordinates
    Then the system should return the correct city, county, and state information for the location
    And the system should prioritize administrative boundaries over points of interest
    And the system should handle proximity to improve accuracy

    Examples:
      | latitude  | longitude  |
      | 40.7128   | -74.0060   |  # Example for New York City
      | 42.3601   | -71.0589   |  # Example for Boston

  Scenario: Error Handling for Non-Numeric Inputs
    Given the input coordinates are non-numeric or invalid
    When the system attempts to process the geocoding request
    Then the system should return an appropriate error message
    And the system should return a relevant error status code

  Scenario Outline: Geocoding Efficiency under Load
    Given that the system is handling <request-count> geocoding requests per second
    When the system processes these requests
    Then the system should maintain efficiency and handle all requests within the target threshold

    Examples:
      | request-count |
      | 1000          |
      | 5000          |

  Scenario Outline: Geocoding Complex Address Scenarios
    Given that multiple possible matches exist for the coordinates <latitude> and <longitude>
    When the system performs geocoding
    Then the system should resolve the correct address considering the proximity and administrative boundaries
    And the system should categorize the response type as either building, address, or point of interest

    Examples:
      | latitude  | longitude  |
      | 40.7580   | -73.9855   |  # Example near Times Square (complex match)

  Scenario Outline: Handling Buildings Without Assigned Addresses
    Given the geographic coordinates of a building without a known address <latitude> and <longitude>
    When the system performs geocoding
    Then the system should resolve the closest possible address or location based on proximity

    Examples:
      | latitude  | longitude  |
      | 40.748817 | -73.985428 |  # Example near a famous building, but without an official address
