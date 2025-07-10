Feature: Handling Unsupported Commands

  As a system user
  I want to understand the limitations of the system regarding unsupported commands
  So that I can avoid receiving errors and use the functionality correctly

  Background:
    Given the user attempts to issue a command through the plugin
    And the command is to rename an existing repository

  Scenario: Scenario 1: Attempt to Rename Repository
    Given the user is logged into the system
    And the user issues a rename command for a repository
    When the system processes the unsupported command
    Then the system responds with '400 Bad Request'
    And the detailed error message is 'Error: Renaming repositories is not permitted through this plugin.'

  Scenario: Scenario 2: Valid Command Execution
    Given the user issues a command supported by the system
    When the system processes the command
    Then the system responds with '200 OK'
    And the details of the import operation are provided

  Scenario: Scenario 3: Unsupported Command Error Handling
    Given the user is logged into the system
    And the user attempts to rename an existing repository through the plugin
    When the system processes the unsupported rename command
    Then the system issues a '400 Bad Request' status
    And the detailed error message is 'Error: Renaming repositories is not permitted through this plugin.'

  Scenario: Scenario 4: Attempt to Delete Repository
    Given the user is logged into the system
    And the user issues a delete command for a repository
    When the system processes the unsupported delete command
    Then the system responds with '400 Bad Request'
    And the error message is 'Error: Deletion of repositories is not permitted through this plugin.'

  Scenario Outline: Scenario Outline: Various Unsupported Commands
    Given the user attempts to execute an unsupported command '<command>'
    When the system processes the command
    Then the system returns '<status>'
    And the error message is '<error-message>'
    Examples:
      | command | status | error-message |
      | rename repository | 400 Bad Request | Error: Renaming repositories is not permitted through this plugin. |
      | delete repository | 400 Bad Request | Error: Deletion of repositories is not permitted through this plugin. |
      | move repository | 400 Bad Request | Error: Moving repositories is not permitted through this plugin. |

