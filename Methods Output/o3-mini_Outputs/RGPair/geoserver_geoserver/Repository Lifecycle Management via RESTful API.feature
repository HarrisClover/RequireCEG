Feature: Repository Lifecycle Management via RESTful API
  As an administrator of the GeoGig Plugin,
  I want to manage repository initialization, configuration, and import
  So that I can handle repository creation, updates, and error handling robustly

  @create-repository
  Scenario: Creating a repository that already exists
    Given the repository "SampleRepo" already exists in the system
    When a client attempts to create a repository named "SampleRepo"
    Then the system should respond with a "409 Conflict" status code
    And the JSON response should indicate that the repository name is already in use

  @create-repository-config
  Scenario: Creating a repository with a specified parent directory when the name is in use
    Given a parent directory is specified for repository creation
    And the repository name "ConfiguredRepo" is already in use under the given parent directory
    When a client attempts to create a repository "ConfiguredRepo" in the specified parent directory
    Then the system should respond with a "409 Conflict" status code
    And the response must include an error message indicating that the repository name is already in use

  @unsupported-command
  Scenario: Attempting an unsupported command such as renaming a repository
    Given a repository "OldRepo" exists in the system
    When a client sends a request to rename "OldRepo" to "NewRepo"
    Then the system should respond with a "400 Bad Request" status code
    And the response must clearly indicate that renaming repositories is not supported by the plugin

  @import-disabled-backend
  Scenario: Importing an existing repository when necessary resolvers are disabled
    Given the backend resolvers are disabled
    And a repository import is attempted for "ExistingRepo" with an unsupported URI type
    When a client sends an import request for "ExistingRepo"
    Then the system should respond with a "400 Bad Request" status code
    And the response must explain that the URI type is unhandled due to disabled resolvers

  @successful-import
  Scenario: Successfully importing an existing repository
    Given an unmanaged repository "UnmanagedRepo" exists on the backend
    When a client sends a valid import request for "UnmanagedRepo"
    Then the system should respond with a "200 OK" status code
    And the response should confirm the import by providing the new repository's details in both XML and JSON formats

  @import-nonexistent
  Scenario: Attempting to import a non-existent repository
    Given no repository exists with the name "NonExistentRepo"
    When a client sends an import request for "NonExistentRepo"
    Then the system should respond with an appropriate error message indicating that the repository does not exist

  @prevent-duplicate-management
  Scenario: Preventing creation of a repository that is already managed
    Given the repository "ManagedRepo" is already under management
    When a client attempts to create or import a repository named "ManagedRepo"
    Then the system should respond with a "409 Conflict" or a relevant error status code
    And the response must clearly state that the repository is already managed
