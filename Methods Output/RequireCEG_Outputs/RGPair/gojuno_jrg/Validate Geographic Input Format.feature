Feature: Validate Geographic Input Format

  As a system user
  I want to ensure that geographic coordinates are properly validated before processing
  So that I can receive accurate location data and avoid processing errors

  Background:
    Given the system is ready to validate geographic coordinates
    And the user inputs geographic coordinates

  Scenario: Scenario 1: Invalid Non-Numeric Input
    Given the input geographic coordinates are non-numeric
    When the system validates the input format
    Then the system should return 'Invalid input format for geographic coordinates'
    And the status code should be 400

  Scenario: Scenario 2: Coordinates Out of Bounds
    Given the input geographic coordinates are numeric but out of valid range
    When the system checks the latitude and longitude values
    Then the system should return 'Coordinates are out of bounds'
    And the status code should be 422

  Scenario: Scenario 3: Valid Coordinates with Multiple Matches
    Given the input geographic coordinates are valid
    And multiple potential matches exist for the location
    When the system initiates the geocoding process
    Then the closest valid address should be returned

  Scenario: Scenario 4: Valid Coordinates with No Defined Address
    Given the input geographic coordinates are valid
    And no defined addresses are found
    When the system processes the coordinates
    Then the nearest city, county, and state information should be returned as a 'point of interest'

  Scenario: Scenario 5: Coordinates Valid but not Strictly Defined
    Given the input geographic coordinates are valid
    When the system checks if any of the coordinates exceed their defined bounds
    Then the system should return 'Coordinates are out of bounds'
    And the status code should be 422

  Scenario Outline: Scenario Outline: Validate Geographic Coordinates with Different Inputs
    Given the input geographic coordinates are <coordinates>
    When the system validates the input
    Then the system should return <expected-message>
    And the status code should be <expected-status>
    Examples:
      | coordinates | expected-message | expected-status |
      | abc, 123 | Invalid input format for geographic coordinates | 400 |
      | 91, 100 | Coordinates are out of bounds | 422 |
      | 45.0, 90.0 | Valid coordinates, processing... | 200 |
      | -91, 10 | Coordinates are out of bounds | 422 |
      | 50, -200 | Coordinates are out of bounds | 422 |

