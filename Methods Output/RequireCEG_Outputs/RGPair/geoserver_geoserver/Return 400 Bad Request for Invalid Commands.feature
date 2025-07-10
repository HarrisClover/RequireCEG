Feature: Return '400 Bad Request' for Invalid Commands

  As a system user
  I want to receive appropriate error messages for invalid commands
  So that I can understand what went wrong and correct my input

  Background:
    Given the system supports a list of valid command types
    And commands must be formatted correctly to be accepted

  Scenario: Scenario 1: Invalid Command Format
    Given a user inputs an unsupported command
    When the system validates the command
    Then the response should be '400 Bad Request'
    And the response message should clearly explain the unsupported command format

  Scenario: Scenario 2: Command Conflicts
    Given a user tries to create a resource that already exists
    When the system processes the command
    Then the response should be '409 Conflict'
    And the response message should indicate that the resource already exists

  Scenario: Scenario 3: Successful Command Execution
    Given the user issues a supported command that pertains to an existing resource
    When the system processes the command
    Then the response should confirm successful execution
    And the response message should indicate the command executed successfully

  Scenario: Scenario 4: Unsupported Command Format Handling
    Given the user issues a command that does not pertain to any existing resource
    When the system processes the command
    Then the response should be '400 Bad Request'
    And the response message should state that the command is unsupported

  Scenario Outline: Scenario Outline: Command Validation
    Given the command entered is <command>
    And the command type is <command-type>
    When the system validates the command
    Then the response should be <http-status>
    And the response message should be <message>
    Examples:
      | command | command-type | http-status | message |
      | CREATE ITEM | valid | 200 OK | Command executed successfully |
      | DELETE NON_EXISTENT_ITEM | invalid | 400 Bad Request | Unsupported command format |
      | UPDATE ITEM | existing | 409 Conflict | Resource already exists |

