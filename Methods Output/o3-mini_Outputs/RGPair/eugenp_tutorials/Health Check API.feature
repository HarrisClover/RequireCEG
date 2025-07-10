Feature: Health Check API
  As a system administrator,
  I want to check the operational status of the system
  So that I can be assured the system is running correctly

  Scenario: Health check API returns 200 status and non-empty body
    Given the system health check endpoint is available
    When a request is sent to the health check endpoint
    Then the response status code should be 200
    And the response body should not be empty

