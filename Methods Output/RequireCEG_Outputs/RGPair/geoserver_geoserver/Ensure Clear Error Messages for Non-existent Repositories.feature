Feature: Ensure Clear Error Messages for Non-existent Repositories

  As a system user
  I want to receive clear error messages when I attempt to import a non-existent repository or use an unsupported URI type
  So that I can understand my errors and correct them efficiently

  Background:
    Given that the system requires a valid repository name
    And the user has access to the repository management feature

  Scenario: Scenario 1: Non-existent Repository
    Given the user attempts to import a repository named 'invalid-repo'
    When the repository does not exist in the backend
    Then the system should respond with a '400 Bad Request' status
    And the error message should state 'Repository not found' with instructions on verifying valid repository names

  Scenario: Scenario 2: Incorrect Repository Name
    Given the user provides an incorrect repository name
    When the repository name does not match any active repository
    Then the system should return a '400 Bad Request' status
    And the error message should include 'Repository not found' along with guidance on correct naming

  Scenario: Scenario 3: Unsupported URI Type
    Given the user attempts to import a repository with an unsupported URI type
    When the URI type is unrecognized by the system
    Then the system should respond with a '400 Bad Request' status
    And the message should detail the unhandled URI type and prompt the user to check their input

  Scenario: Scenario 4: Attempt Import When Repository Exists
    Given the user attempts to import a repository named 'existent-repo'
    When the repository exists in the backend
    Then the system should respond with a '200 OK' status
    And there should be no error message returned

  Scenario Outline: Scenario Outline: Importing a Repository with Variations
    Given the user attempts to import a repository named <repo-name>
    When the system checks for <repo-name> in the backend
    Then the status should be <status>
    And the error message should be <error-message>
    Examples:
      | repo-name | status | error-message |
      | existent-repo | 200 OK | None |
      | non-existent-repo | 400 Bad Request | Repository not found |
      | unsupported-uri | 400 Bad Request | Unhandled URI type: unsupported |
      | incorrect-repo-name | 400 Bad Request | Repository not found |

