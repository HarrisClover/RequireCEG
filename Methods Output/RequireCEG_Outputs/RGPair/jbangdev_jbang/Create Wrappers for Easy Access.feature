Feature: Create Wrappers for Easy Access

  As a software developer
  I want to create a wrapper for easy access to my scripts
  So that I can streamline the execution of my projects without duplication

  Background:
    Given the user has a valid directory structure
    And the necessary dependencies are specified

  Scenario: Scenario 1: Invalid Directory Structure
    Given the user attempts to create a wrapper with an incorrect directory format
    Then the system should validate the directory format
    And display an error message indicating the specific issue with the directory format

  Scenario: Scenario 2: Wrapper Already Exists
    Given the user specifies a wrapper name that already exists in the location
    Then the system should notify the user that the wrapper is already present
    And prevent duplication of the wrapper

  Scenario: Scenario 3: Successful Wrapper Creation
    Given the user provides valid parameters, including necessary dependencies and version specifications consistent with Java version constraints
    When the user creates the wrapper
    Then the system should confirm successful creation
    And display a message that access to the script via the wrapper has been established

  Scenario: Scenario 4: No Portable Option Specified
    Given the user does not specify a portable option for the wrapper
    When the wrapper is created
    Then the system should default to managing the wrapper locally

  Scenario: Scenario 5: Clear Non-Existent Cache
    Given the user attempts to clear a cache that has not been created
    When the user checks the cache location
    Then the system should inform the user that no caches exist to clear at that location

  Scenario: Scenario 6: Attempt to Clear a Non-Existent Cache Location
    Given the cache location does not exist or is empty
    Then the system should inform the user that no caches exist to clear at the specified location

  Scenario: Scenario 7: Validate Creation Dependencies
    Given the user provided valid parameters, including necessary dependencies and version specifications consistent with Java version constraints
    When the user attempts to create the wrapper
    Then the system should proceed to create the wrapper and display a message confirming successful creation and access to the script via the wrapper
    And the user did not specify a portable option for the wrapper
