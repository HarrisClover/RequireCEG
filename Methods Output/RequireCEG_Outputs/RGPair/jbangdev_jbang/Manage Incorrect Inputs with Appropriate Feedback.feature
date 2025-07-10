Feature: Manage Incorrect Inputs with Appropriate Feedback

  As a user of the system
  I want to receive clear error messages for incorrect inputs
  So that I can resolve issues quickly and effectively

  Background:
    Given the user is operating the system
    And the user has access to help documentation

  Scenario: Scenario 1: Invalid Script File Path
    Given the user specifies an invalid script file path
    When the user attempts to initialize a script
    Then the system should display 'Error: The specified script file does not exist.'

  Scenario: Scenario 2: Java Version Requirement
    Given the user is running a lower version of Java than required
    When the user executes a command
    Then the system should display 'Error: This command requires Java version X.X or higher.'

  Scenario: Scenario 3: Incorrect Parameters
    Given the user provides incorrect parameters for a command
    When the user runs the command
    Then the system should display 'Error: Invalid parameters. Please refer to the help documentation for the correct usage.'

  Scenario: Scenario 4: Insufficient Permissions
    Given the user attempts to clear caches without the necessary permissions
    When the command is executed
    Then the system should issue a warning: 'Warning: You do not have the necessary permissions to clear caches.'

  Scenario: Scenario 5: Command Conflict with Existing Files
    Given the user runs a command that conflicts with existing files
    When the command is executed
    Then the system should alert them with 'Error: The command failed due to existing files or directories. Please resolve conflicts before proceeding.'

  Scenario: Scenario 6: Deprecated Flags
    Given the user includes a deprecated flag in a command
    When the command is executed
    Then the system should exhibit 'Warning: The flag used is deprecated and may not be supported in future versions. Please update your commands.'

  Scenario: Scenario 7: All Conditions Fulfilling Java Version Constraint
    Given the user executes a command with parameters including Java version checks
    And the Java version is invalid
    When the command is processed
    Then the system should display 'Error: This command requires Java version X.X or higher.'
    And the system must NOT allow continuing execution
