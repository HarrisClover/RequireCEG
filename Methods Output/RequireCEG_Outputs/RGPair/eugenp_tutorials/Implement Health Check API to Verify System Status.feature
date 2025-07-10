Feature: Implement Health Check API to Verify System Status

  As a system administrator
  I want to check the operational state of the system through an API
  So that I can monitor the health and functionality of all components

  Background:
    Given the health check API is available
    And the system has multiple components

  Scenario: Scenario 1: Verify system is fully operational
    Given the system is fully functional
    When a health check request is made to the API
    Then the response should have a 200 status code
    And the response body should indicate the system is in a normal state

  Scenario: Scenario 2: Verify system is in degraded state
    Given the system has some components degraded
    When a health check request is made to the API
    Then the response should have a 200 status code
    And the response body should list the affected components

  Scenario: Scenario 3: Verify health check when system components are down
    Given the system has one or more components down
    When a health check request is made to the API
    Then the response should have a 200 status code
    And the response body should include a detailed message listing the affected components

  Scenario Outline: Scenario Outline: Check health status with varying components
    Given the system has <component-status> components
    When a health check request is made to the API
    Then the response should have a <status-code> status code
    And the response body should contain <response-message>
    Examples:
      | component-status | status-code | response-message |
      | all operational | 200 | System is fully operational |
      | some degraded | 200 | System is operational but with some issues with components A and B |
      | one down | 200 | System is operational with component C down |

