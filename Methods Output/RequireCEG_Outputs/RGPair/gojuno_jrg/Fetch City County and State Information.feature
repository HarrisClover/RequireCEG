Feature: Fetch City, County, and State Information

  As a system user
  I want to receive accurate geographical information based on input coordinates
  So that I can understand the location context effectively

  Background:
    Given the input coordinates are provided
    And the coordinates are expected to be valid and numeric

  Scenario: Scenario 1: Valid Numeric Coordinates
    Given the coordinates are valid and numeric
    When the user submits the coordinates
    Then the system returns the nearest valid address
    And returns the geographical context as 'address'

  Scenario: Scenario 2: Coordinates with Multiple Boundaries
    Given the coordinates correspond to multiple administrative boundaries
    When the user queries the system
    Then the system prioritizes and returns the closest valid address
    And if no address exists, the system returns nearby points of interest as fallback options and classifies the context as 'point of interest'

  Scenario: Scenario 3: Invalid Coordinates
    Given the coordinates are invalid or not numeric
    When the user submits the invalid coordinates
    Then the system responds with an error message
    And returns a 400 status code

  Scenario: Scenario 4: High Load on System
    Given the system is experiencing high load
    When the user submits a request for coordinates
    Then the system returns a 503 'Service Unavailable' status code

  Scenario: Scenario 5: No Valid Address but Nearby Points of Interest
    Given the coordinates correspond to nearby points of interest but no valid address
    When the user queries the system
    Then the system returns nearby points of interest
    And returns the geographical context as 'point of interest'

  Scenario Outline: Scenario Outline: Edge Case Classification
    Given the system classifies the identified location based on input coordinates
    And the coordinates correspond to a building without a specific address
    When the user submits the coordinates
    Then the system identifies and returns the nearest registered address
    Examples:
      | coordinates | type |
      | 34.0522, -118.2437 | building |
      | 40.7128, -74.0060 | point of interest |
      | 37.7749, -122.4194 | address |

