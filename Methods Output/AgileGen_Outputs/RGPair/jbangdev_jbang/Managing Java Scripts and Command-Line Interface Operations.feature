Feature: Managing Java Scripts and Command-Line Interface Operations
  As a user,
  I want to initialize, edit, and run Java scripts using the jbang command-line interface,
  So that I can manage scripts, dependencies, version control, and handle errors effectively.

  Scenario: Running Java scripts using the jbang CLI
    Given that the user has installed the jbang CLI
    When the user runs a script using the "jbang" command
    Then the system should execute the script and display output on stdout
    And any errors should be displayed on stderr
    And the user should be able to clear caches
    And the system should support version control for scripts

  Scenario: Managing catalogs and dependencies
    Given that the user wants to manage catalogs and dependencies
    When the user adds or removes dependencies using the jbang command
    Then the system should update the catalogs accordingly
    And the system should fetch dependencies as required

  Scenario: Handling quotes on Windows
    Given that the user is running the system on Windows
    When the user executes a command with parameters containing quotes
    Then the system should correctly handle and process the quotes

  Scenario: Launching JAR files with jbang
    Given that the user wants to launch a JAR file
    When the user runs the "jbang" command with the JAR file
    Then the system should successfully launch the JAR file

  Scenario: Using agents and jsh scripting
    Given that the user needs to use agents or jsh scripting
    When the user invokes an agent or jsh script via the CLI
    Then the system should execute the agent or script correctly

  Scenario: Creating and managing wrappers
    Given that the user wants to create a wrapper
    When the user issues the command to create the wrapper
    Then the system should notify the user if the wrapper already exists
    And the system should verify that the directory structure is correct

  Scenario: Exporting scripts for local and portable use
    Given that the user wants to export a script
    When the user exports the script
    Then the system should export the script in a clean format
    And the script should be usable locally or portably as specified

  Scenario: Handling missing files or incorrect inputs
    Given that the user provides incorrect inputs or missing files
    When the system encounters a failure
    Then the system should display an appropriate error message
    And the operation should not proceed until the issue is resolved

  Scenario: Ensuring compatibility with Java version constraints
    Given that the user is working with specific Java version constraints
    When the user runs a script
    Then the system should ensure compatibility with the required Java version
    And the system should follow best practices for the Java execution path
