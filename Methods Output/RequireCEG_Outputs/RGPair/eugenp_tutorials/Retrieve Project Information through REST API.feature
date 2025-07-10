Feature: Retrieve Project Information through REST API

  As a user
  I want to retrieve information about a specific project
  So that I can view details concerning its status and timeline

  Background:
    Given the user has valid project identifiers
    And the API is accessible

  Scenario: Scenario 1: Valid Project Identifiers
    Given a user sends a GET request to the endpoint with valid project identifiers
    When the server processes the request
    Then the server responds with a 200 status code
    And the response contains the project's information in JSON format

  Scenario: Scenario 2: Invalid Project Identifiers
    Given a user sends a GET request to the endpoint with invalid project identifiers
    When the server processes the request
    Then the server responds with a 404 status code
    And the response body states 'Project not found.'

  Scenario: Scenario 3: Malformed Request Parameters
    Given a user sends a malformed GET request to the endpoint
    When the server processes the request
    Then the server responds with a 400 status code
    And the response body indicates 'Invalid input.'

  Scenario: Scenario 4: Server Maintenance
    Given the server is undergoing maintenance
    When a user attempts to send a GET request to the endpoint
    Then the server responds with a 503 status code
    And the response body states 'Service is temporarily unavailable. Please try again later.'

  Scenario: Scenario 5: Project Not Found
    Given a user sends a GET request to the endpoint with project identifiers that do not correspond to any existing project
    When the server processes the request
    Then the server responds with a 404 status code
    And the response body states 'Project not found.'

  Scenario Outline: Scenario Outline: Retrieve Project Information
    Given the user has project identifiers <project-id>
    When the user sends a GET request
    Then the server responds with a <status-code>
    And the response contains <expected-message>
    Examples:
      | project-id | status-code | expected-message |
      | valid-id | 200 | project information in JSON |
      | invalid-id | 404 | 'Project not found.' |
      | malformed-input | 400 | 'Invalid input.' |
      | maintenance | 503 | 'Service is temporarily unavailable. Please try again later.' |

