Feature: Handling Complex Geocoding Scenarios

  As a client application,
  I want the geocoding service to handle complex addressing situations correctly
  So that I get accurate information even for non-standard locations.

  Scenario: Geocode point within a building without a specific assigned address
    Given the geocoding service is available
    And coordinate <lat_in_building> <lon_in_building> falls within the footprint of a known building (e.g., a large shed in a park) that lacks its own street address
    When I request geocoding for latitude <lat_in_building> and longitude <lon_in_building>
    Then the system should return the location information associated with the building or the containing parcel (e.g., the park's address or name)
    And the response type should indicate 'building' or 'point_of_interest' as appropriate

  Scenario: Geocode point near overlapping geographical constraints
    Given the geocoding service is available
    And coordinate <lat_overlapping> <lon_overlapping> falls within an area affected by overlapping boundaries (e.g., a special tax district overlapping a city boundary)
    When I request geocoding for latitude <lat_overlapping> and longitude <lon_overlapping>
    Then the system should return the primary administrative location (city, county, state) based on defined precedence rules
    # Further 'And' steps could specify expected handling of the overlapping feature if required

  Scenario: Handle multiple potential address matches
    Given the geocoding service is available
    And coordinate <lat_multi_match> <lon_multi_match> could plausibly map to multiple nearby addresses
    When I request geocoding for latitude <lat_multi_match> and longitude <lon_multi_match>
    Then the system should return the single most likely address based on proximity and confidence scoring
