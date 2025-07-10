Feature: Handle Disabled Resolvers on Import

  As a system user
  I want to ensure the system handles import requests properly
  So that I can receive appropriate responses based on repository status

  Background:
    Given the required resolvers are disabled
    And an import request is initiated

  Scenario: Scenario 1: Import with Disabled Resolvers
    Given the URI type is unhandled
    When an import request is made
    Then the system must respond with '400 Bad Request'
    And the response should indicate that the supplied URI type is unhandled

  Scenario: Scenario 2: Importing Existing Unmanaged Repository
    Given the import request is made for an existing repository with supported resolver
    And the repository's status is 'unmanaged'
    When the import process is executed
    Then the system must respond with '200 OK'
    And the response should include details of the newly imported repository in XML and JSON formats

  Scenario: Scenario 3: Importing Managed Repository
    Given the import request is made for an existing repository with supported resolver
    And the repository's status is 'managed'
    When an attempt is made to import it again
    Then the system must emit '409 Conflict'
    And the response should clearly state the message that the repository already exists

  Scenario: Scenario 4: Importing Non-existent Repository
    Given the import request is made for a repository that does not exist
    When the request is processed
    Then the system must respond with '404 Not Found'
    And the response should provide a clear message indicating that the repository cannot be found

  Scenario: Scenario 5: Import Request for Existing Repository
    Given the import request is made for an existing repository where the resolver is supported
    And the repository's status is 'unmanaged'
    When the import process is executed
    Then the system must respond with '200 OK'
    And the response should include details of the imported repository in XML and JSON formats

  Scenario: Scenario 6: Attempt to Import Already Existing Repository
    Given the import request is made for an existing repository where the resolver is supported
    And the repository's status is 'managed'
    When an attempt is made to import it again
    Then the system must emit '409 Conflict'
    And the response clearly indicates that the repository already exists
