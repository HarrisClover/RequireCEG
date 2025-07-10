Feature: Conduct Load Testing without Administrative Data

  As a geocoding service provider
  I want to efficiently manage incoming requests for geographic coordinates without administrative data
  So that I can ensure accurate location retrieval and maintain service performance

  Background:
    Given the defined maximum number of requests per second
    And the ability to validate incoming coordinate pairs

  Scenario: Valid coordinates provided
    Given the coordinates are valid and numeric
    When a request for location data is received
    Then the service should retrieve and return the corresponding city, county, and state information in a structured format

  Scenario: Invalid coordinates provided
    Given the coordinates are invalid or non-numeric
    When a request is made with invalid coordinates
    Then the service must respond with an appropriate error message indicating invalid or non-numeric coordinates, including a status code 400

  Scenario: Multiple matches found
    Given the coordinates provided result in multiple location matches
    When a request is made for location data
    Then the service should prioritize and return the nearest and most contextually appropriate response from multiple matches

  Scenario: Request load exceeds threshold
    Given the incoming request load exceeds the established maximum requests per second
    When the service is under high load
    Then the system should implement graceful degradation by informing users of current load conditions and potential delays while maintaining core functionalities

  Scenario: Load handling with no response
    Given the coordinates provided are valid and numeric
    And the incoming request load exceeds the established maximum requests per second
    When the service is under high load
    Then the service should not return multiple matches for the coordinates

  Scenario Outline: Handle different types of coordinates
    Given the coordinates are <coordinates>
    When the service processes the coordinates
    Then the output should be <output>
    And the status code should be <status-code>
    Examples:
      | coordinates | output | status-code |
      | 40.7128,-74.0060 | New York City, NY, USA | 200 |
      | invalid_coord | Coordinate format error | 400 |
      | 34.0522,-118.2437 | Los Angeles, CA, USA | 200 |
      |  | No coordinates provided | 400 |

