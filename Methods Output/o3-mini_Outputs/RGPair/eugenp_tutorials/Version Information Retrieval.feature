Feature: Version Information Retrieval
  As a system administrator,
  I want to retrieve version information and server responses
  So that I can verify the correct deployment and operational status

  Scenario: Retrieving system version information
    Given the system exposes a version information endpoint
    When a GET request is made to the version endpoint
    Then the response should contain the current version details
    And the response should be formatted according to the API specifications