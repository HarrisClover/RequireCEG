Feature: jbang Script Management System

As a developer using the jbang command-line interface, I want to initialize, edit, run, and manage Java scripts efficiently while receiving clear output and error messages so that my development process remains seamless and robust.

Scenario: Initialize, Edit, and Run a Java Script
Given the user has a Java environment that complies with the version constraints
And the user initializes a new script using the jbang initialization command
And the system creates the necessary files and directory structure
When the user edits the script in a supported text editor
And the user runs the script using the jbang run command
Then the system executes the script and displays both stdout and stderr outputs
And the system handles dependency fetching and version control functionalities

Scenario: Clear Caches and Manage Catalogs
Given the user has executed scripts that have cached dependencies and catalog entries
When the user issues a command to clear caches (for example, via jbang clean)
Then the system successfully clears all caches without errors
And the system updates the available catalogs accordingly

Scenario: Handle Parameter Passing with Quoted Inputs on Windows
Given the user is operating in a Windows environment
And the user has a script that requires command parameters which include quotes
When the script is executed with parameters that include quotes
Then the system correctly processes the quoted parameters
And no errors related to parameter passing or quoting occur

Scenario: Launch JAR Files and Use Agents
Given the user has a precompiled JAR file available
When the user launches the JAR file using the appropriate jbang command (e.g., jbang jar)
Then the system executes the JAR file successfully
And any agent services employed by the system are activated and log their outputs appropriately

Scenario: Provide Robust Error Handling for Incorrect Inputs or Missing Files
Given the user provides an invalid file path or incorrect input parameters
When the user attempts to run a script using these incorrect inputs
Then the system displays an appropriate error message indicating the issue
And the system suggests corrective actions to the user

Scenario: Notify Users of Deprecated Commands and Manage Wrappers
Given the user attempts to execute a command that has been deprecated
When the system detects the use of a deprecated command
Then the system issues a warning and indicates the updated command to use
And if the user is managing a wrapper or if the directory structure is incorrect
Then the system notifies the user about the existence of an existing wrapper or the directory error

Scenario: Export Scripts for Both Local and Portable Options
Given the user has a fully functional script developed using jbang
When the user selects the export option to output the script for local deployment
Then the system exports the script in a clean format that supports local usage
And when the user selects the portable export option
Then the system exports the script in a way that ensures portability across environments