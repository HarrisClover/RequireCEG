Feature: Return Error for Conflicting Repository Name

  As a user submitting a repository creation request
  I want to receive appropriate error messages for conflicting repository names
  So that I can correct my request and proceed without issues

  Background:
    Given the user is logged into the system
    And the repository name 'existing-repo' already exists in the system

  Scenario: Scenario 1: Create repository with existing name
    Given the user attempts to create a repository with the name 'existing-repo'
    When the request is submitted
    Then the response should be a '409 Conflict' HTTP status code
    And the response should include a JSON object detailing the reason for the conflict

  Scenario: Scenario 2: Create repository with unique name
    Given the user attempts to create a repository with a unique name 'new-repo'
    When the request is submitted
    Then the response should be a '201 Created' HTTP status code
    And the response should include the details of the newly created repository in JSON format

  Scenario: Scenario 3: Unsupported command like renaming a repository
    Given the user attempts to rename the repository 'existing-repo'
    When the request is made
    Then the response should be a '400 Bad Request' HTTP status code
    And the response should indicate the unsupported command with a JSON error message

  Scenario: Scenario 4: Attempt to import existing repository with resolvers disabled
    Given the user tries to import an existing repository 'existing-repo'
    And the necessary resolvers are disabled
    When the import request is made
    Then the response should be a '400 Bad Request' HTTP status code
    And the response should include an explanation in JSON format

  Scenario: Scenario 5: Attempt to import a non-existent repository
    Given the user attempts to import a repository with the name 'non-existent-repo'
    When the import request is submitted
    Then the response should be a '400 Bad Request' HTTP status code
    And the response should indicate the issue with importing a non-existent repository

  Scenario: Scenario 6: Successful import of a managed repository
    Given the user attempts to import a managed repository 'managed-repo'
    When the import request is submitted
    Then the response should be a '200 OK' HTTP status code
    And the response should include details of the newly imported repository in both XML and JSON formats
