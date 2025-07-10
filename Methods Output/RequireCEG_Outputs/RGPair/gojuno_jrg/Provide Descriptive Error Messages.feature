Feature: Provide Descriptive Error Messages

  As a user of the geocoding system
  I want to receive descriptive error messages for various input scenarios
  So that I can understand the reasons for unsuccessful geocoding attempts

  Background:
    Given the system is ready to process geocoding requests
    And the user has valid coordinates for testing

  Scenario: Invalid Numeric Input
    Given the user inputs a non-numeric coordinate
    When the system processes the input
    Then the system should return 'Input must be numeric coordinates.'

  Scenario: Coordinates Out of Bounds
    Given the user provides coordinates outside the valid range
    When the system checks the coordinates
    Then the system should return 'Coordinates are out of bounds for geocoding services.'

  Scenario: No Geocoding Match Found
    Given the user inputs coordinates not matching any recognized area
    When the system performs the geocoding lookup
    Then the system should return 'No geocoding match found for the provided coordinates.'

  Scenario: Multiple Geocoding Matches Found
    Given the user inputs coordinates that correspond to multiple locations
    When the system checks for matches
    Then the system should return 'Multiple matches found; please refine your search.'

  Scenario: System Under Load
    Given the geocoding requests exceed system capacity
    When the user submits their request
    Then the system should return 'System under load; please retry later.'

  Scenario: Point of Interest Instead of Address
    Given the user provides coordinates for a point of interest
    When the system identifies the input as a point of interest
    Then the system should return 'Identified as point of interest; consider using a full address for better accuracy.'

  Scenario: Invalid Address
    Given the user inputs incomplete or non-specific address coordinates
    When the system identifies a point of interest instead of a full address
    Then the system should return 'Identified as point of interest; consider using a full address for better accuracy.'

  Scenario: Multiple Potential Matches
    Given the user inputs coordinates that correspond to multiple cities or areas
    When the system processes the input
    Then the system should return 'Multiple matches found; please refine your search.'
