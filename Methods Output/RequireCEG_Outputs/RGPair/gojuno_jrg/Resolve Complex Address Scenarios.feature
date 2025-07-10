Feature: Resolve Complex Address Scenarios

  As a user seeking location information
  I want to input coordinates and receive accurate address information
  So that I can find the location without confusion or error

  Background:
    Given the user has a set of input coordinates
    And the system is operational and ready to process requests

  Scenario: Scenario 1: Invalid Coordinates
    Given the user enters non-numeric coordinates
    When the system processes the input
    Then the system returns an error message
    And the status code is 400

  Scenario: Scenario 2: Valid Coordination with Single Address
    Given the user inputs valid numeric coordinates
    And the system finds only one address matching the coordinates
    When the system retrieves the address
    Then the system returns the matching address

  Scenario: Scenario 3: Valid Coordination with Multiple Addresses
    Given the user inputs valid numeric coordinates that match multiple addresses
    When the system determines the closest address
    Then the system returns the closest address as the primary result

  Scenario: Scenario 4: Point of Interest Nearby
    Given the user inputs valid coordinates near a point of interest
    When the system finds an address of the building
    Then the system returns the address of the building instead of the point of interest

  Scenario: Scenario 5: Overlapping Administrative Boundaries
    Given the user inputs coordinates that fall within multiple county boundaries
    When the system analyzes population density data
    Then the system determines the primary county and returns corresponding city, county, and state information

  Scenario: Scenario 6: Building Without Assigned Address
    Given the user inputs coordinates near a building without a formal address
    When the system identifies landmarks and finds the nearest valid address
    Then the system returns the nearest valid address
    And flags the output as 'building without assigned address'

  Scenario: Scenario 7: Coordinates With Identifiable Markers but Without Assigned Address
    Given the user inputs coordinates of a building that has identifiable markers but lacks a formally assigned address
    When the system finds the nearest valid address
    Then it returns the formally assigned address if available, otherwise returns an error
