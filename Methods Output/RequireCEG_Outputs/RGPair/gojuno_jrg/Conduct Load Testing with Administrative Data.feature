Feature: Conduct Load Testing with Administrative Data

  As a system administrator
  I want the system to efficiently handle geocoding requests and manage varying load conditions
  So that the user experience remains seamless and accurate even under high traffic

  Background:
    Given the system is operational and capable of processing geocoding requests
    And the predefined requests per second threshold is established

  Scenario: Scenario 1: Handle valid geocoding request under load
    Given the system is receiving requests at the maximum threshold
    When a valid geocoding request for 'Albany, NY' is made
    Then the response should return the accurate address
    And the processing time should be within acceptable limits

  Scenario: Scenario 2: Manage requests beyond the threshold
    Given the system is experiencing over the defined requests per second limit
    When multiple geocoding requests are sent
    Then the system should implement load balancing or queue requests

  Scenario: Scenario 3: Handle invalid input data
    Given the input contains invalid data types
    When the system processes the input data
    Then the system should return an error message 'Invalid input'
    And the response should have an appropriate status code

  Scenario: Scenario 4: Handle out of bounds input data
    Given the input is '999, Somewhere'
    When the system processes the input data
    Then the system should return an error message 'Location out of bounds'
    And the response should have an appropriate status code

  Scenario: Scenario 5: Prioritize address matches
    Given multiple address matches are found
    When the geocoding request is processed
    Then the most accurate address should be returned
    And results should indicate whether it is a building, address, or point of interest

  Scenario: Scenario 6: Process single address match
    Given the geocoding request results in a single address match
    When the request is processed
    Then the system should return the accurate address without further matches
    And the response should clarify that it is a single address match
