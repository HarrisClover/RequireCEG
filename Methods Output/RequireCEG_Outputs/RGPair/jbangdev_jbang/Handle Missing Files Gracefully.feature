Feature: Handle Missing Files Gracefully

  As a system user
  I want the system to provide clear error messages for missing files and libraries
  So that I can quickly identify and resolve issues related to file execution

  Background:
    Given the user has a script file to execute
    And the user has defined a file path for the required library

  Scenario: Scenario 1: Missing Script File
    Given the specified script file path is incorrect
    When the user attempts to execute the script
    Then the system should display 'Error: The specified script file does not exist. Please check the file path and try again.'

  Scenario: Scenario 2: Missing Required Library
    Given the user has a valid script but the required library is missing
    When the user attempts to execute the command
    Then the system should present the message 'Error: Required library not found. Ensure the library is properly installed.'

  Scenario: Scenario 3: Incorrect JAR File Path
    Given the user has an execution command for a JAR file with an incorrect path
    When the user attempts to launch the JAR file
    Then the system should notify the user with 'Error: The JAR file could not be found. Please verify the provided path.'

  Scenario: Scenario 4: Corrupted File During Execution
    Given the user has a valid script file that is corrupted
    When the user executes the script
    Then the system should trigger a warning stating 'Warning: The file appears to be corrupted. Please check the file for integrity issues.'

  Scenario: Scenario 5: Missing Library and Script File
    Given the specified script file path is incorrect
    And the required library is absent
    When the user attempts to execute the script
    Then the system should display 'Error: The specified script file does not exist. Please check the file path and try again.'

  Scenario: Scenario 6: Missing Library and Incorrect JAR File Path
    Given the user has a valid script file
    And the required library is absent
    When the user attempts to launch a JAR file with an incorrect path
    Then the system should notify the user with 'Error: The JAR file could not be found. Please verify the provided path.'

  Scenario Outline: Scenario Outline: Multiple Error Checks
    Given the user attempts to execute a script with a specified script file path '<script-file-path>'
    And the user checks for library '<library>'
    When the execution is attempted
    Then the system should return '<error-message>'
    Examples:
      | script-file-path | library | error-message |
      | invalid_script.sh | example_lib | Error: The specified script file does not exist. Please check the file path and try again. |
      | valid_script.sh | missing_lib | Error: Required library not found. Ensure the library is properly installed. |
      | invalid_path/jar_file.jar |  | Error: The JAR file could not be found. Please verify the provided path. |
      | corrupted_file.sh |  | Warning: The file appears to be corrupted. Please check the file for integrity issues. |

