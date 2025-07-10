Feature: Geocoding Accuracy and Prioritization

  As a client application,
  I want the geocoding service to prioritize proper addresses and use administrative boundaries correctly
  So that I receive the most relevant and accurate location information.

  Scenario: Prioritize street address over nearby Point of Interest (POI)
    Given the geocoding service is available
    And coordinate <lat_near_address_and_poi> <lon_near_address_and_poi> is physically closer to a POI but clearly belongs to a street address parcel
    When I request geocoding for latitude <lat_near_address_and_poi> and longitude <lon_near_address_and_poi>
    Then the system should return the details corresponding to the street address
    And the response type should indicate 'address' or similar (See Response Categorization Feature)

  Scenario: Correctly identify location based on administrative boundaries
    Given the geocoding service is available
    And coordinate <lat_near_boundary> <lon_near_boundary> falls clearly within "County A" but is very close to the boundary of "County B"
    When I request geocoding for latitude <lat_near_boundary> and longitude <lon_near_boundary>
    Then the system should return "County A" as the county
    And the system should return the correct city and state for that location

  Scenario: Use proximity for ambiguous points
    Given the geocoding service is available
    And coordinate <lat_ambiguous> <lon_ambiguous> is equidistant from two potential address matches
    When I request geocoding for latitude <lat_ambiguous> and longitude <lon_ambiguous>
    Then the system should apply proximity rules (or other defined tie-breaking rules) to return the most likely match