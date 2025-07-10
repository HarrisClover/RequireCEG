Feature: API Endpoint Testing Framework
  As a developer,
  I want to ensure all API endpoints function correctly
  So that the system meets the expected performance and response criteria

  Scenario: API endpoints return expected status codes and payloads
    Given the API endpoints are defined for the system
    When a request is made to each endpoint
    Then each response should have the correct status code
    And the payload should match the specified format

