Feature: System Health Check API
  As a System Operator or Monitoring Service
  I want to check the health of the system via an API endpoint
  So that I can verify its operational status

  Scenario: Requesting system health status
    When I send a GET request to the health check API endpoint "/health"
    Then the response status code should be 200
    And the response body should not be empty
    And the response body should indicate an operational status (e.g., {"status": "UP"})
