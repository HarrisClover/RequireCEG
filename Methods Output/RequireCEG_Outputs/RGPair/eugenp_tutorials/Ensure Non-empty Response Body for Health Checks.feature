Feature: Ensure Non-empty Response Body for Health Checks

  As a system administrator
  I want to ensure the health check API provides accurate status information
  So that users are informed about the operational status of the system

  Background:
    Given the system is operational
    And the health check API is accessible

  Scenario: Scenario 1: Successful Health Check Response
    Given the system is operational
    When a health check API request is made
    Then the response status code should be 200
    And the response body should contain relevant information

  Scenario: Scenario 2: System Under Maintenance
    Given the system is under maintenance
    When a health check API request is made
    Then the response status code should be 503
    And the response body should contain the message 'Service temporarily unavailable due to maintenance.'

  Scenario: Scenario 3: System not Functioning
    Given the system is non-functioning
    When a health check API request is made
    Then the response status code should be 500
    And the response body should contain the message 'System is not functioning correctly.'

  Scenario Outline: Scenario Outline: Health Check with Custom Conditions
    Given the system is <status>
    When a health check API request is made
    Then the response status code should be <status-code>
    And the response body should <body-condition>
    Examples:
      | status | status-code | body-condition |
      | operational | 200 | contain relevant information |
      | under maintenance | 503 | contain the message 'Service temporarily unavailable due to maintenance.' |
      | non-functioning | 500 | contain the message 'System is not functioning correctly.' |

