Feature: Process Supported Commands

  As a user
  I want to manage repositories effectively
  So that I can avoid conflicts and ensure proper operations within the GeoGig Plugin

  Background:
    Given the GeoGig Plugin is properly configured
    And the user has the necessary permissions

  Scenario: Repository Creation Conflict
    Given the user attempts to create a repository that already exists
    Then the system should return a '409 Conflict' status
    And the response should include a JSON detailing the reason for the conflict

  Scenario: Creating Repository in Managed Directory
    Given the user specifies a parent directory that is already managed
    Then the system should return a '409 Conflict' status
    And the response should include a JSON explanation of the conflict

  Scenario: Renaming a Repository
    Given the user attempts to rename a repository
    Then the system should respond with a '400 Bad Request'
    And the message should state that renaming is not supported

  Scenario: Importing with Disabled Resolvers
    Given the user attempts to import an existing repository
    When the necessary resolvers are disabled
    Then the system should return a '400 Bad Request'
    And the message should explain that the URI type cannot be handled

  Scenario: Successful Import of Repository
    Given the user successfully imports a managed repository
    Then the system should respond with '200 OK'
    And the details of the new repository should be presented in both XML and JSON formats

  Scenario: Importing Non-Existent Repository
    Given the user attempts to import a non-existent repository
    Then the system should provide a '404 Not Found' status
    And the response should contain an error message indicating that the repository cannot be found

  Scenario: Importing with Disabled Resolvers - Not Condition
    Given the user attempts to import an existing repository
    When the necessary resolvers are enabled
    Then the system should respond with a '200 OK'
    And the details of the new repository should be presented in both XML and JSON formats
