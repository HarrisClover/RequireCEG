Feature: Edit Existing Java Scripts

  As a user of the script editing system
  I want to load, edit, run, and save JavaScript files
  So that I can modify scripts and execute them while managing modifications effectively

  Background:
    Given the user is in a Windows environment
    And the user has an existing JavaScript file to edit

  Scenario: Loading an existing script
    Given the user selects an existing JavaScript file
    When the system loads the script for editing
    Then the script should be displayed in the editor

  Scenario: Modifying and running the script with syntax errors
    Given the user modifies the script with syntax errors
    When the user attempts to run the script
    Then the system should validate the script syntax
    And an appropriate error message indicating the nature of the syntax errors should be displayed

  Scenario: Running the script successfully
    Given the user modifies the script without syntax errors
    When the user runs the script
    Then the system should execute the script
    And the system should capture and return both standard output and standard error outputs

  Scenario: Saving modified script
    Given the user modifies the JavaScript file
    When the user chooses to save the changes
    Then a confirmation prompt should appear
    And if confirmed, the existing script should be overwritten

  Scenario: Discarding changes
    Given the user has unsaved modifications
    When the user opts to discard changes
    Then the system should present an option to exit without saving
    And any unsaved modifications should be discarded

  Scenario: Attempting to edit a non-existent script
    Given the user attempts to edit a script that does not exist
    When the system searches for the file
    Then the system should notify them with an error message indicating that the file cannot be found

  Scenario: Ensuring clean output
    Given the user edits a script
    When the application prepares to execute the script
    Then the application should ensure the script meets all parameter requirements
    And the output should be cleanly formatted

  Scenario: Checking for validation on execution
    Given the script passes validation for execution
    When the user runs the script
    Then the system should execute the script successfully without syntax errors

  Scenario: Displaying syntax error message
    Given the script contains syntax errors
    When the user attempts to run the script
    Then the system should display an error message indicating the nature of the syntax errors

  Scenario: Confirming save action
    Given the user has modifications to the script
    When the user saves the changes
    Then a confirmation prompt should be displayed for saving
    And the user must confirm the action to proceed
