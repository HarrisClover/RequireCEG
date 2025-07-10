Feature: Follow Best Practices during Command Execution

  As a system user
  I want to ensure proper execution of scripts and commands
  So that I can avoid errors and streamline my workflow

  Background:
    Given the system is initialized correctly
    And the user has the required permissions

  Scenario: Scenario 1: Incompatible Java Version
    Given the Java version is not compatible
    When the user attempts to run a script
    Then the script initialization process will be halted
    And an error message will indicate the specific version constraints

  Scenario: Scenario 2: Missing Files
    Given the user tries to run a script
    When any required files are missing
    Then a clear error message will inform the user of the missing files

  Scenario: Scenario 3: Parameter Parsing Issues
    Given the user specifies parameters for a command with incorrect formatting on Windows
    When the command involves quotes
    Then the system will ensure parameters are correctly parsed

  Scenario: Scenario 4: Script Execution Failure
    Given a script execution results in a failure
    When the user checks the output
    Then the system will log the stderr output for debugging
    And provide a friendly error message summarizing the nature of the error

  Scenario: Scenario 5: Incorrect Directory Structure for Wrapper Creation
    Given the user attempts to create a wrapper
    When the directory structure is incorrect
    Then the user will be notified with specific details about the required directory structure

  Scenario: Scenario 6: Exporting Scripts
    Given the user attempts to export a script
    When exporting for local use
    Then the system will manage the output ensuring it remains clean and organized

  Scenario: Scenario 7: Deprecated Commands
    Given a user invokes deprecated commands
    When the commands are executed
    Then the system will execute them while issuing a warning
    And suggest modern alternatives

  Scenario: Scenario 8: Running a JAR file or Agent
    Given the user attempts to run a JAR file or utilize an agent
    When there are prerequisites to satisfy
    Then the system will verify all prerequisites are satisfied
    And provide clear instructions if any steps are incomplete
