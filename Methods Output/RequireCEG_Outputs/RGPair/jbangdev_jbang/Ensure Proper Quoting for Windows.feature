Feature: Ensure Proper Quoting for Windows

  As a system administrator
  I want to ensure all parameters are properly quoted and validated
  So that the system executes scripts without errors due to parameter issues

  Background:
    Given that parameters may contain spaces or special characters
    And that the system is configured to handle Windows path formatting

  Scenario: Scenario 1: Unquoted parameters result in error
    Given a script is provided with unquoted parameters
    When the user attempts to execute the script
    Then the system displays an error message indicating that 'The command cannot be parsed due to unquoted parameters.'

  Scenario: Scenario 2: Mixed quoted and unquoted parameters
    Given a script contains both quoted and unquoted parameters
    When the script is executed
    Then the system automatically wraps the unquoted parameters in quotes before executing the script.

  Scenario: Scenario 3: Escaping backslashes
    Given a script contains parameters with backslashes
    When the script is executed
    Then the system ensures that all backslashes are properly escaped within the parameters.

  Scenario: Scenario 4: Validating quoting after parameter modification
    Given a user modifies the script to include additional parameters
    When the script is executed again
    Then the system verifies that all parameters maintain correct quoting after modifications.

  Scenario Outline: Scenario Outline: Re-evaluating parameters
    Given a user modifies the script to include additional parameters
    And the existing parameters are '<quoted-parameter>'
    When the script is executed again
    Then the system verifies that all parameters maintain correct quoting
    Examples:
      | quoted-parameter |
      | "C:\Program Files\Example Folder" |
      | "D:\My Documents\Work" |
      | "E:\Data\Projects\Scripts" |

