Feature: Reject Unsupported Commands with Error

  As a user
  I want to receive accurate error messages when performing unsupported actions
  So that I am informed of the limitations of the GeoGig Plugin and avoid confusion

  Background:
    Given the GeoGig Plugin is set up correctly
    And the user has the required permissions

  Scenario: Scenario 1: Renaming a repository
    Given the user attempts to rename a repository
    When the rename command is executed
    Then the system should respond with a '400 Bad Request' status code
    And an error message should indicate that renaming commands are not supported through the GeoGig Plugin

  Scenario: Scenario 2: Attempting unsupported commands
    Given the user sends a request containing an unsupported command
    When the command is processed
    Then the system should return a '400 Bad Request' status code
    And an error message should clearly specify that the requested command is not available

  Scenario: Scenario 3: Creating an existing repository
    Given the user attempts to create a repository that already exists
    When the create command is executed
    Then the system should return a '409 Conflict' status code
    And a JSON response should include a detailed explanation that the repository already exists

  Scenario: Scenario 4: Renaming with unsupported command
    Given the user attempts to rename a repository
    And a valid command is not executed
    When the command is processed
    Then the system should respond with a '400 Bad Request' status code
    And an error message should indicate that renaming commands are not supported through the GeoGig Plugin

  Scenario: Scenario 5: Attempt to delete repository
    Given the user sends a request containing a delete command
    When the command is processed
    Then the system should return a '400 Bad Request' status code
    And the response should clearly specify that the delete command is not available

  Scenario Outline: Scenario Outline: Multiple unsupported commands
    Given the user sends a request with <unsupported-command>
    When the command is processed
    Then the system should return a '<status-code>' status code
    And the response should contain a message indicating <error-message>
    Examples:
      | unsupported-command | status-code | error-message |
      | rename repository | 400 Bad Request | Renaming commands are not supported |
      | delete repository | 400 Bad Request | The delete command is not available |
      | create existing repository | 409 Conflict | Repository already exists |

