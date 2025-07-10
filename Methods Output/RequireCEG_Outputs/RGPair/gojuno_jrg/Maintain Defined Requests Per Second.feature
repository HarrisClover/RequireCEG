Feature: Maintain Defined Requests Per Second

  As a geocoding service provider
  I want to monitor incoming requests and handle them efficiently
  So that I can ensure accurate responses even under high load conditions

  Background:
    Given there is a predefined threshold of requests per second
    And the system is operational

  Scenario: Scenario 1: Process requests below threshold
    Given the number of incoming requests is below the predefined threshold
    When the system processes each request
    Then the corresponding city, county, and state information is returned
    And the service operates normally

  Scenario: Scenario 2: Excess requests
    Given the number of incoming requests exceeds the predefined threshold
    When the system receives excess requests
    Then the system implements a prioritization mechanism based on administrative boundaries
    And returns appropriate HTTP status code for excess requests

  Scenario: Scenario 3: Invalid input coordinates
    Given the input coordinates are non-numeric
    When the system processes the input
    Then the system responds with an error message
    And indicates 'Invalid Input: Coordinates must be numeric.'

  Scenario: Scenario 4: Multiple potential matches but no valid match
    Given the number of incoming requests exceeds the predefined threshold
    And there are multiple potential matches for a given location
    And no valid location can be identified
    When the system evaluates results by balancing proximity and administrative boundaries
    Then the most precise location is not returned
    And the user is notified that no valid location could be returned

  Scenario: Scenario 5: Fallback strategy for complex addressing
    Given there are multiple potential matches for a given location
    And a fallback strategy is needed for complex addressing scenarios
    When the system processes the inputs and applies fallback strategies
    Then the best match possible is ascertained based on available data
