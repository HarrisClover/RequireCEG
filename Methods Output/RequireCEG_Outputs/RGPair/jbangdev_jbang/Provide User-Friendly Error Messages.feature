Feature: Provide User-Friendly Error Messages

  As a system user
  I want clear and actionable error messages
  So that I can efficiently diagnose and resolve issues during script execution

  Background:
    Given a user interacts with the system
    And the system is processing commands and scripts

  Scenario: Scenario 1: Nonexistent Script Path
    Given a user attempts to initialize a script with an invalid path
    When the system checks the script path
    Then the system should return 'Error: The specified script path does not exist. Please check your input and try again.'

  Scenario: Scenario 2: Editing Running Script
    Given a user tries to edit a script that is currently executing
    When the system detects the running state of the script
    Then the system should return 'Error: Cannot edit the script while it is in execution. Please stop the script first.'

  Scenario: Scenario 3: Unable to Fetch Dependencies
    Given the system encounters network issues while fetching dependencies
    When the user attempts to execute the command
    Then the system should return 'Error: Unable to fetch dependencies. Please check your network connection and try again.'

  Scenario: Scenario 4: Permission Denied for Cache Clearing
    Given a user without permissions attempts to clear caches
    When the system verifies user permissions
    Then the system should return 'Error: Permission denied. You do not have the required access to clear caches.'

  Scenario: Scenario 5: Invalid Catalog Identifier
    Given a user provides an invalid catalog identifier
    When the system processes the catalog management request
    Then the system should return 'Error: Invalid catalog identifier. Please provide a valid catalog and try again.'

  Scenario: Scenario 6: Deprecated Command Usage
    Given a user executes a deprecated command
    When the system recognizes the command
    Then the system should return 'Warning: The command you used is deprecated and may not work as expected. Please refer to the documentation for alternative options.'

  Scenario: Scenario 7: Missing Input Parameters for JAR File
    Given a user tries to launch a JAR file without necessary parameters
    When the system checks for required parameters
    Then the system should return 'Error: Missing input parameters. Please provide all required parameters to launch the JAR file.'

  Scenario: Scenario 8: Incorrect Directory Structure for Wrappers
    Given a user tries to create wrappers with an incorrect directory structure
    When the system evaluates the directory setup
    Then the system should return 'Error: The directory structure is incorrect. Please ensure that the required directories are set up correctly before creating a wrapper.'

  Scenario: Scenario 9: Output Directory Not Specified
    Given a user attempts to export scripts without specifying an output directory
    When the system checks for an output directory
    Then the system should return 'Error: Output directory not specified. Please provide an output directory for script export.'

  Scenario: Scenario 10: Command Execution Failed Due to Missing Files
    Given a user executes a command that requires certain files
    When the system checks for the necessary files
    Then the system should return 'Error: Command execution failed due to missing files. Please check your inputs and try again.'

  Scenario: Scenario 11: Incompatible Java Version
    Given a user is attempting to run a script with an incompatible Java version
    When the system validates the Java version
    Then the system should return 'Error: The current Java version is incompatible. Please ensure you are using the correct Java version for execution.'

  Scenario: Scenario 12: Use of Deprecated Command
    Given a user issues a deprecated command
    When the system checks the command's validity
    Then the system should return 'Warning: The command you used is deprecated and may not work as expected. Please refer to the documentation for alternative options.'
