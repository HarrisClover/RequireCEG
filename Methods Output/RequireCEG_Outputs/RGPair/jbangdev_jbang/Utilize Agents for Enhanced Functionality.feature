Feature: Utilize Agents for Enhanced Functionality

  As a user of the command-line interface
  I want to ensure compatibility with the Java version before executing scripts
  So that I can avoid errors due to version conflicts

  Background:
    Given the user has the jbang command-line interface installed
    And the user is aware of the Java version in use

  Scenario: Check Java Version Compatibility
    Given the user attempts to use an agent with the jbang command
    When the system checks for compatibility with the Java version
    Then the system should allow execution if compatible
    And the system should prevent script execution and display a version conflict message if incompatible

  Scenario: Initiate Dependency Resolution
    Given the agent is compatible with the Java version
    When the user executes the script
    Then the system should initiate dependency resolution for the script being executed

  Scenario: Handle Missing or Incorrect Parameters
    Given the script requires specific parameters
    When the user does not provide the correct parameters
    Then the system should alert the user with an error message detailing the required parameters

  Scenario: Output Execution Details
    Given the script is running
    When the script outputs execution details
    Then the details should be displayed to stdout
    And any warnings related to dependency utilization should be presented in stderr

  Scenario: Complete Execution Announcement
    Given all dependencies have been correctly resolved
    When the script execution completes
    Then the system announces the completion of execution only if all dependencies are correctly resolved

  Scenario: Handle Incorrect Dependency Resolution
    Given the user attempts to execute a script with unresolved dependencies
    When the system identifies missing dependencies
    Then the system should alert the user to resolve dependencies before script execution
