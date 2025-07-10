Feature: Return 200 Status Code for Operational Checks

  As a system administrator
  I want to ensure that the health check API is operational
  So that I can monitor and confirm that the system is running smoothly

  Background:
    Given the health check API is properly deployed
    And the server is fully operational

  Scenario: Scenario 1: API is accessible
    Given the health check API is running
    When a GET request is sent to the health check endpoint
    Then the response status code should be 200
    And the response body should not be empty

  Scenario: Scenario 2: API is down
    Given the health check API is not operational
    When a GET request is sent to the health check endpoint
    Then the response status code should not be 200

  Scenario: Scenario 3: Incorrect HTTP method
    Given the health check API is running
    When a POST request is sent to the health check endpoint
    Then the response status code should be 405 Method Not Allowed

  Scenario: Scenario 4: Health Check API Operational - Not Accessible
    Given the health check API is operational and accessible
    When a GET request is sent to the health check endpoint
    Then the response status code should be 200
    And the response body should not be empty

  Scenario: Scenario 5: Health Check API Not Operational - Accessible
    Given the health check API is not operational or accessible
    When a GET request is sent to the health check endpoint
    Then the response status code should indicate an issue
