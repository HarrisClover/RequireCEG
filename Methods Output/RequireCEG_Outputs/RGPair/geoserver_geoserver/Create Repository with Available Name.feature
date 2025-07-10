Feature: Create Repository with Available Name

  As a user
  I want to create a repository with an available name
  So that I can manage my projects effectively

  Background:
    Given the user is authenticated
    And the system has an existing repository list

  Scenario: Scenario 1: Create a repository with an available name
    Given the user requests to create a repository named 'MyRepo'
    When the system checks for the repository name's availability
    Then the system responds with '200 OK'
    And the response includes the repository details in both XML and JSON formats

  Scenario: Scenario 2: Attempt to create a repository with a taken name
    Given the user requests to create a repository named 'ExistingRepo'
    When the system checks for the repository name's availability
    Then the system responds with '409 Conflict'
    And the response includes a message indicating the repository name is already in use

  Scenario: Scenario 3: Attempt to rename a repository during creation
    Given the user wants to create a repository while attempting to rename it simultaneously
    When the system processes the request
    Then the system responds with '400 Bad Request'
    And the message clarifies that renaming is not an available command

  Scenario: Scenario 4: Importing an existing repository with disabled resolvers
    Given the user attempts to import a repository named 'MyRepo'
    When the necessary resolvers are disabled
    Then the system responds with '400 Bad Request'
    And the response includes a message regarding the unhandled URI type preventing import

  Scenario: Scenario 5: Attempt to import a non-existent repository
    Given the user attempts to import a repository named 'NonExistentRepo'
    When the system checks for the existence of the repository
    Then the system responds with a suitable error message
    And the message indicates that the specified repository cannot be found

  Scenario: Renaming during repository creation is not permitted
    Given the user initiates a request to create a repository
    When the user tries to rename it at the same time
    Then the system responds with '400 Bad Request'
    And the explanation states that renaming is not an allowed action during creation
