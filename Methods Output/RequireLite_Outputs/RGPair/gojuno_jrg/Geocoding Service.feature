Feature: Geocoding Service

  As a system user
  I want accurate geocoding services for cities and counties
  So that I can efficiently identify locations based on geographic coordinates

  Background:
    Given the system is capable of handling geographic coordinates
    And the system has access to administrative boundary data

  Scenario: Return accurate city, county, and state information
    Given a valid geographic coordinate
    When a request is made to geocode the coordinate
    Then the system should return the correct city, county, and state
    And the response should include the type of location identified

  Scenario: Handle non-numeric input
    Given a non-numeric input is provided
    When a request is made to geocode the input
    Then the system should return an appropriate error message indicating 'Input must be numeric'
    And the status code should be 400

  Scenario: Handle valid coordinates with no corresponding address
    Given a valid geographic coordinate that does not correspond to any address
    When a request is made to geocode the coordinate
    Then the system should return a message saying 'No address found for these coordinates'
    And the status code should indicate the absence of a matching address

  Scenario Outline: Identify addresses with multiple matches
    Given the input coordinate is <coordinate>
    When a request is made to geocode the coordinate
    Then the system should return the most relevant address for <context>
    And the system has multiple potential addresses within proximity
    Examples:


  Scenario: Update administrative boundaries
    Given the system has up-to-date administrative boundary data
    When there are changes in the geographic coordinates or administrative boundaries
    Then the system should accurately reflect these changes in the geocoding results
    And provide a notification to users about the updated data
