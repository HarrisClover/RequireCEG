Feature: Command-Line Interface for Java Script Management

As a user of the jbang CLI,
I want to initialize, edit, and run Java scripts,
So that I can manage my scripts, dependencies, and output effectively.

Scenario: Initializing and Running a Script
Given the user has installed the jbang CLI
When the user runs a Java script with the command "jbang run <script-name>"
Then the system should execute the script and display both stdout and stderr outputs

Scenario: Clearing Cache
Given the user has executed a script previously
When the user clears the cache using the "jbang cache clear" command
Then the system should clear all cached files and notify the user of the cache clearance

Scenario: Handling Missing Files
Given the user attempts to run a script with missing files
When the user runs "jbang run <script-name>"
Then the system should display an appropriate error message for the missing file

Scenario: Managing Dependencies
Given the user has a script with dependencies
When the user runs "jbang run <script-name>"
Then the system should fetch the necessary dependencies automatically

Scenario: Handling Quotes and Parameter Passing
Given the user runs a command on Windows
When the user passes parameters with quotes
Then the system should correctly handle the quotes and parameters

Scenario: Wrapper Creation and Management
Given the user wants to create a wrapper for a script
When the user runs "jbang wrapper create <script-name>"
Then the system should create a wrapper, ensuring the directory structure is correct, and notify the user if the wrapper already exists

Scenario: Version Control and Compatibility
Given the user runs a script on a specific version of Java
When the user executes a script with "jbang run <script-name>"
Then the system should ensure compatibility with the selected Java version and manage execution paths accordingly

Scenario: Error Handling for Invalid Inputs
Given the user enters invalid inputs in a command
When the user runs the command
Then the system should provide a relevant error message for the invalid input

Scenario: Exporting Scripts
Given the user wants to export a script
When the user runs "jbang export <script-name>"
Then the system should export the script, ensuring both local and portable options are available
