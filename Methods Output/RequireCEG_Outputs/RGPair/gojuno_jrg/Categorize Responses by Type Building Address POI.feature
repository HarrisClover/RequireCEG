Feature: Categorize Responses by Type (Building, Address, POI)

  As a system administrator
  I want to categorize geocoding data accurately based on its nature
  So that I can provide relevant information to users based on their input

  Background:
    Given that the system receives geocoding data as input
    And the data is formatted correctly

  Scenario: Valid numeric coordinates with unique address
    Given the input coordinates are 40.7128, -74.0060
    When the system processes the geocoding data
    Then the output should be categorized as 'Address'
    And the response should include relevant address details

  Scenario: Valid numeric coordinates with ambiguous address
    Given the input coordinates are 34.0522, -118.2437
    When the system processes the geocoding data
    Then the output should need prioritization based on proximity
    And the response may be categorized as 'Address' or 'Building'

  Scenario: Invalid coordinates format
    Given the input coordinates are 'abc, xyz'
    When the system processes the geocoding data
    Then the output should display 'Invalid coordinates, please provide numeric values.'

  Scenario: Building without a standard address
    Given the input coordinates are 37.7749, -122.4194
    When the system processes the geocoding data and recognizes it as a unique building
    Then the output should be categorized as 'Building'

  Scenario: Valid coordinates leading to ambiguous address
    Given the input coordinates are 40.730610, -73.935242
    When the system processes the geocoding data
    Then the output should require clarification due to ambiguous results
    And the response may need to categorize it as 'Address' or 'Building'

  Scenario Outline: Scenario Outline: Excess Load Handling
    Given that the requests exceed the threshold limits due to high load
    When the system processes the geocoding data
    Then the output should return a status code indicating 'Too Many Requests'
    Examples:
      | Load | Response Type |
      | High | Status: Too Many Requests |
      | Above Threshold | Response: Too Many Requests |

