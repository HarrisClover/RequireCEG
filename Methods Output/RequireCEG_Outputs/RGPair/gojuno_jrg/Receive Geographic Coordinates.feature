Feature: Receive Geographic Coordinates

  As a user of the location service
  I want to submit geographic coordinates to retrieve location information
  So that I can obtain relevant city, county, and state data based on my input

  Background:
    Given the system is ready to validate input coordinates
    And the system has access to geographic data

  Scenario: Valid numeric input coordinates
    Given the input coordinates are valid numeric values
    When the user submits the coordinates to the system
    Then the system performs a lookup to identify corresponding location information
    And the location details are returned to the user

  Scenario: Non-numeric input coordinates
    Given the user inputs non-numeric coordinates
    When the user submits the coordinates to the system
    Then the system returns an error message indicating that the input must be numeric

  Scenario: Out-of-range input coordinates
    Given the input coordinates exceed the geographical boundaries of New York and its neighboring states
    When the user submits the coordinates to the system
    Then the system returns a status code indicating an out-of-range error

  Scenario: Multiple addresses found near coordinates
    Given the input coordinates yield multiple addresses
    When the user submits the coordinates to the system
    Then the system prioritizes and returns the most relevant residential address
    And the response is based on administrative boundaries

  Scenario: Ambiguity in proximity calculations
    Given proximity calculations yield ambiguity in the identified location
    When the user submits the coordinates to the system
    Then the system provides a categorized response type to clarify the nature of the location

  Scenario: High traffic scenarios
    Given the system experiences high traffic and exceeds the requests per second threshold
    When the user submits the coordinates to the system
    Then the system responds with a service unavailable status code until the load is mitigated

  Scenario: Valid numeric input but multiple potential matches
    Given the input coordinates are valid numeric values
    And multiple addresses are found near the coordinates
    When the user submits the coordinates to the system
    Then the system prioritizes and returns the most relevant residential address based on administrative boundaries

  Scenario: Invalid non-numeric input
    Given the user inputs non-numeric coordinates
    When the user submits the coordinates to the system
    Then the system returns an error message indicating that the input must be numeric
