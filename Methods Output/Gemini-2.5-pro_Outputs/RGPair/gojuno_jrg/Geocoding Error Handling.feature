Feature: Geocoding Error Handling

  As a client application,
  I want the geocoding service to handle invalid inputs gracefully
  So that I can understand when my request is malformed or cannot be processed.

  Scenario Outline: Handle invalid coordinate inputs
    Given the geocoding service is available
    When I request geocoding with latitude "<latitude>" and longitude "<longitude>"
    Then the system should return an error status code indicating invalid input
    And the response should contain an error message explaining the issue "<error_message>"

    Examples: Invalid Inputs
      | latitude   | longitude  | error_message                      | description              |
      | "abc"      | -74.0060   | "Invalid latitude: non-numeric"    | Non-numeric latitude     |
      | 40.7128    | "xyz"      | "Invalid longitude: non-numeric"   | Non-numeric longitude    |
      | 91.0       | -74.0060   | "Invalid latitude: out of range"   | Latitude > 90            |
      | -91.0      | -74.0060   | "Invalid latitude: out of range"   | Latitude < -90           |
      | 40.7128    | 181.0      | "Invalid longitude: out of range"  | Longitude > 180          |
      | 40.7128    | -181.0     | "Invalid longitude: out of range"  | Longitude < -180         |
      |            | -74.0060   | "Missing required parameter: latitude" | Missing latitude         |
      | 40.7128    |            | "Missing required parameter: longitude"| Missing longitude        |