Feature: Evaluate Proximity to Enhance Address Match Accuracy

  As a user of the address verification system
  I want to validate coordinates and find the closest address or point of interest
  So that I can receive accurate location information

  Background:
    Given the user provides a set of coordinates
    And the system has a database of addresses and points of interest

  Scenario: Invalid coordinates provided
    Given the coordinates are non-numeric or invalid
    When the user submits the coordinates
    Then an error message should be returned
    And the status code should be 400

  Scenario: Valid coordinates with multiple addresses found
    Given the coordinates are numeric and valid
    And multiple addresses are located within the specified radius
    When the user submits the coordinates for address search
    Then the system should return the closest address as the primary address

  Scenario: Closest address is not in the same administrative boundary
    Given two addresses are found and the closest is outside the administrative boundary
    When the system processes the addresses
    Then the address with the highest relevance should be returned

  Scenario: No addresses meet proximity criteria
    Given no addresses are found within the specified radius
    When the user requests locations around the coordinates
    Then the system should return the nearest point of interest

  Scenario Outline: Valid coordinates with varying results
    Given the coordinates are valid <coordinates>
    And the system has <number> addresses available
    When the user searches for addresses within <radius> of the coordinates
    Then the system should return <expected-result>
    Examples:
      | coordinates | number | radius | expected-result |
      | 40.7128, -74.0060 | 5 | 1 mile | closest address found |
      | 34.0522, -118.2437 | 0 | 2 miles | nearest point of interest |
      | 51.5074, -0.1278 | 3 | 500 meters | address with highest relevance |

