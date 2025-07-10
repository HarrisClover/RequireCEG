Feature: Return JSON Error for Existing Repository

  As a user
  I want to create a repository or import an existing one with proper error handling
  So that I am informed about any conflicts or issues encountered

  Background:
    Given the user is logged into the system
    And there exists a repository with the same name in the system

  Scenario: Scenario 1: Creating an Existing Repository
    Given the user attempts to create a repository with the name 'my-repo'
    When the user submits the creation request
    Then the response status should be '409 Conflict'
    And the response body should be { 'error': 'Repository already exists' }

  Scenario: Scenario 2: Creating a Repository in a Valid Parent Directory
    Given the user has a valid parent directory
    And the user attempts to create a repository with the name 'my-repo'
    When the user submits the creation request
    Then the response status should be '409 Conflict'
    And the response body should be { 'error': 'Repository already exists' }

  Scenario: Scenario 3: Importing a Non-existent Repository
    Given the user tries to import a repository named 'unknown-repo'
    When the user submits the import request
    Then the response status should be '400 Bad Request'
    And the response body should be { 'error': 'Specified repository not found' }

  Scenario: Scenario 4: Importing an Existing Repository
    Given the user tries to import an existing repository named 'existing-repo'
    When the system successfully imports the repository
    Then the response status should be '200 OK'
    And the response body should include repository details in both XML and JSON formats, including 'name', 'created_at', and 'owner'.

  Scenario: Scenario 5: Attempting to Import with a Non-existent Repository
    Given the user tries to import a repository named 'nonexistent-repo'
    When the user submits the import request
    Then the response status should be '400 Bad Request'
    And the response body should be { 'error': 'Specified repository not found' }

  Scenario Outline: Scenario Outline: Repository Operations
    Given the user attempts to create or import a repository with <repository-name>
    And there is <existence-status> for that repository
    When the user submits the <request-type> request
    Then the response status should be <expected-status>
    And the response body should be <expected-response>
    Examples:
      | repository-name | existence-status | request-type | expected-status | expected-response |
      | my-repo | exists | create | 409 Conflict | { 'error': 'Repository already exists' } |
      | existing-repo | exists | import | 200 OK | repository details in XML and JSON |
      | unknown-repo | does not exist | import | 400 Bad Request | { 'error': 'Specified repository not found' } |

