Feature: GeoGig Plugin Repository Management

  As a plugin developer
  I want to provide functionality for repository initialization and management through a RESTful API
  So that I can effectively handle repository lifecycles with clear error handling

  Background:
    Given the system is available
    And the required configurations are set

  Scenario: Create a Repository that Already Exists
    Given a repository with the name 'test-repo' already exists
    When a user tries to create the repository 'test-repo' with payload {"name": "test-repo"}
    Then the response status should be '409 Conflict'
    And the response body should indicate the failure reason as 'repository already exists'

  Scenario: Create a Repository Successfully
    Given a user wants to create a new repository 'new-repo'
    When the user submits the creation request with payload {"name": "new-repo", "description": "A new test repository."}
    Then the response status should be '200 OK'
    And the response body should contain the details of 'new-repo'

  Scenario: Import an Existing Repository Successfully
    Given the necessary resolver for importing is enabled
    When a user imports an existing repository 'existing-repo' with payload {"repo_name": "existing-repo"}
    Then the response status should be '200 OK'
    And the response should include the details of 'existing-repo' in both XML and JSON formats

  Scenario Outline: Handle Unsupported Commands
    Given the user wants to perform an unsupported command <command>
    When the user executes the command
    Then the response status should be '400 Bad Request'
    And the response should indicate that <command> is not available through the plugin
    Examples:
      | command |
      | rename repository |
      | delete repository |
      | move repository |


  Scenario: Handle Attempt to Import Non-Existent Repository
    Given the user attempts to import a repository named 'non-existent-repo'
    When the user submits the import request with payload {"repo_name": "non-existent-repo"}
    Then the response status should be '400 Bad Request'
    And the response should indicate that 'non-existent-repo' does not exist
