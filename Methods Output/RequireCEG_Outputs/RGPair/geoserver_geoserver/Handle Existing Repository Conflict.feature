Feature: Handle Existing Repository Conflict

  As a user who wants to create or import repositories
  I want to receive appropriate responses when there are conflicts or issues
  So that I can understand the status of my requests and manage repository operations effectively

  Background:
    Given the user is logged into the system
    And the user has a valid session active

  Scenario: Scenario 1: Repository name conflict
    Given the user attempts to create a repository with a name that already exists
    When the user submits the creation request
    Then the system should respond with a '409 Conflict' status code
    And the response body should contain a message indicating 'Repository name is already in use.'

  Scenario: Scenario 2: Repository name conflict in a parent directory
    Given the user specifies a parent directory and a repository name that is already taken in that directory
    When the user submits the creation request
    Then the system should respond with a '409 Conflict' status code
    And the response body should contain a message indicating 'Repository name is already in use.'

  Scenario: Scenario 3: Unsupported rename operation
    Given the user attempts to rename an existing repository
    When the user submits the rename request
    Then the system should respond with a '400 Bad Request' status
    And the response body should contain a message indicating 'Renaming is unsupported.'

  Scenario: Scenario 4: Importing a repository with unavailable backend services
    Given the user attempts to import a repository
    And the required backend services are unavailable
    When the user submits the import request
    Then the system should respond with a '400 Bad Request' status
    And the response body should indicate that the URI type is unhandled by the system.

  Scenario: Scenario 5: Successful import of a repository
    Given the user imports an existing repository that is available
    When the import request is processed
    Then the system should respond with a '200 OK' status
    And the response should provide details about the newly created repository in both JSON and XML formats.

  Scenario: Scenario 6: Importing a non-existent repository
    Given the user attempts to import a repository that does not exist
    When the import request is submitted
    Then the system should return a '404 Not Found' status
    And the response body should clearly state that the repository cannot be found.

  Scenario: Scenario 7: Backend service unavailable during import
    Given the user attempts to import a repository
    When there are required backend services that are unavailable
    Then the system should respond with a '400 Bad Request' status
    And the response body should clearly indicate 'Required backend services are unavailable.'
