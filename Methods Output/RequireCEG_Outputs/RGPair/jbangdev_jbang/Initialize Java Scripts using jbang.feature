Feature: Initialize Java Scripts using jbang

  As a user
  I want to initialize a script with required parameters
  So that I can successfully execute the script without errors

  Background:
    Given the required parameters (Java version and script source) are set
    And the environment is correctly configured

  Scenario: Valid Initialization with All Parameters
    Given the user properly initializes the script with parameters
    When the user attempts to run the script
    Then the script executes successfully
    And standard output is displayed

  Scenario: Error on Missing Parameters
    Given the user initializes the script without required parameters
    When the user attempts to run the script
    Then an error message is displayed detailing missing inputs

  Scenario: Error on Incorrect Directory Structure
    Given the user attempts to clear caches or manage catalogs after initialization
    When the directory structure is incorrect
    Then the user is informed that the directory structure is incorrect

  Scenario: Avoid Duplicate Wrapper Creation
    Given the user tries to initialize a script with an existing wrapper
    When the system detects the existing wrapper
    Then the user is notified without creating a duplicate wrapper

  Scenario Outline: Error Handling for Missing Files
    Given the script is initialized with valid parameters
    And a file is missing or there are incorrect inputs
    When the user runs the script
    Then an appropriate error message is displayed
    Examples:
      | scenario | missing_file | outcome |
      | File Not Found | config.properties | Error: Config file not found. |
      | Invalid Input Error | script.java | Error: Invalid input provided. |


  Scenario: Initialization with Invalid Java Version
    Given the user initializes the script with an invalid Java version
    When the user attempts to run the script
    Then an error message stating 'Invalid Java version' is displayed

  Scenario: Invalid Script Source
    Given the user initializes the script with an invalid script source
    When the user attempts to run the script
    Then an error message stating 'Invalid script source' is displayed

  Scenario: Handling Missing Directories
    Given the user attempts to run the script
    When the required directories are missing
    Then an error message indicating the missing directories is displayed

  Scenario: Notify User for Existing Wrapper
    Given the user tries to run a script that already has a wrapper
    When the user attempts to run the script
    Then the user is notified that the wrapper already exists and no action is taken
