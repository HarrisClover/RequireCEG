Feature: Prevent Creation of Already Managed Repository

  As a user trying to create a repository
  I want to receive feedback when a repository name is already in use
  So that I can choose a different name and avoid conflicts

  Background:
    Given a system that manages repository names
    And the current repositories include names like 'my-repo' and 'test-repo'

  Scenario: Scenario 1: Attempt to create a repository with a duplicate name
    Given a user attempts to create a repository named 'my-repo'
    When the user submits the request
    Then the system responds with a '409 Conflict' status
    And the response includes a JSON object indicating that the repository name is already in use

  Scenario: Scenario 2: Attempt to create a repository with an unused name
    Given a user attempts to create a repository named 'new-repo'
    When the user submits the request
    Then the system responds with a '200 OK' status
    And the response includes the details of the newly created repository in both XML and JSON formats

  Scenario: Scenario 3: Attempt to create a repository with the parent directory while using an existing name
    Given a user attempts to create a repository named 'my-repo'
    And the user provides a parent directory 'parent-dir'
    When the user submits the request
    Then the system responds with a '409 Conflict' status
    And the response includes a JSON object indicating that the repository name is already in use

  Scenario Outline: Scenario Outline: Repository Creation with Configuration
    Given a user attempts to create a repository named '<repo-name>'
    And the user provides a parent directory '<parent-directory>'
    When the user submits the request
    Then the system responds with a '409 Conflict' status
    Examples:
      | repo-name | parent-directory |
      | existing-repo | parent-dir |
      | my-repo | another-dir |

