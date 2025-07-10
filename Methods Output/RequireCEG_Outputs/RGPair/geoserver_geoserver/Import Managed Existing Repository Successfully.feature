Feature: Import Managed Existing Repository Successfully

  As a system administrator
  I want to import an existing managed repository
  So that I can ensure the repository is accessible and operational

  Background:
    Given the backend services are operational
    And the requested repository exists in the system

  Scenario: Successful repository import
    Given the backend services are operational
    And the requested repository exists
    When a request is made to import the existing managed repository
    Then the system responds with '200 OK'
    And the repository's details are returned in both XML and JSON formats

  Scenario: Repository not found
    Given the backend services are operational
    And the requested repository does not exist
    When a request is made to import a repository that doesn't exist
    Then the system responds with '400 Bad Request'
    And an error message indicates the repository cannot be located for import

  Scenario: Unsupported URI type
    Given the backend services are operational
    And the requested repository exists
    When the system receives a request with a URI type that has its necessary resolvers disabled
    Then the system responds with '400 Bad Request'
    And an informative message explains that the URI type is unsupported for import operations

  Scenario: Repository already managed
    Given the backend services are operational
    And the requested repository already exists in the system
    When a request is made to create a repository that is already being managed by the system
    Then the system responds with '409 Conflict'
    And a JSON response details that the repository is already in use, thus preventing any duplication of managed repositories

  Scenario: Successful repository import with all conditions met
    Given the backend services are operational
    And the requested repository exists
    And no issues with URI type
    When a request is made to import the existing managed repository
    Then the system responds with '200 OK'
    And the repository's details are returned in both XML and JSON formats
