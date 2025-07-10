Feature: System Information API Endpoints
  As a System Administrator or Developer
  I want to retrieve system version and server response information via designated API endpoints
  So that I can verify deployment details and check server status conforme requirements

  Scenario: Retrieve System Version Information
    When I send a GET request to the "/version" API endpoint
    Then the response status code should be 200 (OK)
    And the response body should contain the system version (e.g., {"version": "1.0.0-beta"})

  Scenario: Retrieve Basic Server Response Information
    When I send a GET request to a designated server info endpoint (e.g., "/server-status")
    Then the response status code should be 200 (OK)
    And the response body should contain relevant server information as specified (e.g., {"status": "OK", "timestamp": "..."})