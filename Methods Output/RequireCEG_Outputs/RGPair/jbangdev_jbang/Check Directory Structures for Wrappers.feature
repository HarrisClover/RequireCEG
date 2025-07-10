Feature: Check Directory Structures for Wrappers

  As a system administrator
  I want to ensure the directory structure is correct for wrapper creation
  So that the users can successfully create wrappers without errors

  Background:
    Given the user has the necessary permissions
    And the required directories are predefined in the system

  Scenario: Scenario 1: Missing Directory Structure
    Given the user attempts to create a wrapper
    And one or more required directories are missing
    When the system checks for the directory structure
    Then an error message is displayed indicating which specific directories need to be created
    And the user is prompted to create the missing directories

  Scenario: Scenario 2: Wrapper Already Exists
    Given the necessary directory structure exists
    And the wrapper already exists in the system
    When the user tries to create the wrapper
    Then a notification informs the user that the wrapper already exists
    And suggests renaming or modifying the existing wrapper

  Scenario: Scenario 3: Clear Cache and Re-evaluate
    Given the user clears the cache
    When the user attempts to create a wrapper
    Then the system re-evaluates the directory structure
    And the user can proceed if the structure is correct

  Scenario: Scenario 4: Directory Path Validation
    Given the system checks the directory path for Windows
    And the path contains quoted elements
    When the system confirms the path format
    Then the execution success status is successful

  Scenario: Scenario 5: Invalid Directory Path on Windows
    Given the system checks the directory path for Windows
    And the path contains unquoted elements
    When the system confirms the path format
    Then the execution success status is failure

  Scenario: Scenario 6: Valid Unix Directory Path
    Given the system checks the directory path for Unix
    And the path contains unquoted elements
    When the system confirms the path format
    Then the execution success status is successful
