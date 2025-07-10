Feature: Validate Backend Availability for Import

  As a system administrator
  I want to ensure the backend service is available and can import repositories
  So that users can successfully import their repositories without issues

  Background:
    Given the system is ready to perform import operations
    And the backend server must be checked for availability

  Scenario: Scenario 1: Backend Server Unavailable
    Given the backend server is down
    When a user attempts to import a repository
    Then the system should return '503 Service Unavailable'
    And indicate that the import service is currently down

  Scenario: Scenario 2: URI Type Unhandled
    Given the backend server is available
    And the URI type of the repository is unsupported
    When a user tries to import the repository
    Then the system should return '400 Bad Request'
    And provide a message that the URI type is unhandled

  Scenario: Scenario 3: Repository Not Found
    Given the backend server is available
    And the URI type of the repository is supported
    When a user attempts to import a repository that does not exist
    Then the system should return '404 Not Found'
    And state that the repository is not available for import

  Scenario: Scenario 4: Managed Repository Conflict
    Given the backend server is available
    And the URI type of the repository is supported
    And the specified repository exists
    When the user attempts to import a managed repository
    Then the system should return '409 Conflict'
    And indicate that the repository is already managed and cannot be imported

  Scenario: Scenario 5: Successful Import
    Given the backend server is available
    And the URI type of the repository is supported
    And the specified repository exists
    And the repository is not managed
    When the user attempts to import the repository
    Then the system should return '200 OK'
    And provide details of the newly imported repository in both XML and JSON formats

  Scenario: Scenario 6: Repository Import with Resolvers Disabled
    Given the backend server is available
    And the URI type of the repository is supported
    And the specified repository exists
    And the resolvers for the URI type are disabled
    When the user attempts to import the repository
    Then the system should return '404 Not Found'
    And indicate that the repository cannot be imported due to disabled resolvers
