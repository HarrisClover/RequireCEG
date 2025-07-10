Feature: API Call to List Storage Gateways

  As a system user
  I want to list available storage gateways
  So that I can retrieve information about storage services

  Background:
    Given the system is configured to authenticate users
    And the user has the necessary permissions

  Scenario: Valid API call with valid parameters
    Given the user sends a request with valid parameters
    When the user issues an API call to list storage gateways
    Then the system should return a list of available gateways
    And each gateway should include identifiers, status, and configuration details

  Scenario: Invalid parameters provided
    Given the user sends a request with invalid parameters
    When the user issues an API call to list storage gateways
    Then the system should respond with a 400 Bad Request error
    And a message should indicate which parameter is invalid

  Scenario: Insufficient permissions
    Given the user does not have sufficient permissions
    When the user issues an API call to list storage gateways
    Then the system should return a 403 Forbidden error
    And the message should state the permission issues encountered

  Scenario: AWS service unreachable
    Given the service is down or unreachable
    When the user issues an API call to list storage gateways
    Then the system should return a standardized error response
    And the user should be guided to check inputs or permissions before retrying

  Scenario: Valid API call with missing permissions
    Given the user sends a request with valid parameters
    And the user does not have sufficient permissions
    When the user issues an API call to list storage gateways
    Then the system should return a 403 Forbidden error
    And the message should state the permission issues encountered

  Scenario: API call with invalid gateway identifier
    Given the user sends a request with an invalid gateway identifier
    When the user issues an API call to list storage gateways
    Then the system should respond with a 400 Bad Request error
    And a message should indicate that the parameter is invalid
