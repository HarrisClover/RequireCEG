Feature: Geocoding Response Categorization

  As a client application,
  I want the geocoding response to categorize the type of match found
  So that I can better understand the nature of the identified location.

  Scenario Outline: Verify response type categorization
    Given the geocoding service is available
    When I request geocoding for a coordinate known to represent a <location_description> at latitude <latitude> and longitude <longitude>
    Then the system should return a successful status code
    And the response should include a category field with the value "<expected_category>"

    Examples: Location Types
      | latitude | longitude | location_description        | expected_category    |
      | 40.7580  | -73.9855  | Specific Street Address     | address              |
      | 40.7829  | -73.9654  | Point within Central Park   | point_of_interest  | # Assuming park is POI
      | 40.7484  | -73.9857  | Empire State Building       | building             | # Assuming it's categorized as building
      | 42.6511  | -73.7549  | NY State Capitol Building   | building             |
      | 40.7128  | -74.0060  | Generic City Center point   | address              | # Or potentially 'locality' if more granular types exist