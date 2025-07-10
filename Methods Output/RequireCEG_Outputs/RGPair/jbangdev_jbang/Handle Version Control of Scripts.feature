Feature: Handle Version Control of Scripts

  As a user of the script management system
  I want to effectively manage different versions of my scripts
  So that I can maintain a clear history of changes and revert if necessary

  Background:
    Given the user has initialized a script
    And the system has created an initial version in version control

  Scenario: Save changes as new version
    Given the user edits the script
    When the user is prompted to save the changes
    Then the user can select to save as a new version
    And the current timestamp is logged marking it as versioned

  Scenario: Overwrite existing version
    Given the user edits the script
    When the user selects to overwrite the existing version
    Then the existing version is updated with the new changes

  Scenario: Execute script with uncommitted changes
    Given the user has uncommitted changes in the script
    When the user attempts to execute the script
    Then the system prompts the user to commit changes or run the last committed version

  Scenario: View version history
    Given the user requests to view version history
    Then the system displays all saved versions along with their timestamps
    And the user can choose to revert to any selected version

  Scenario: Delete non-latest version
    Given the user attempts to delete a version that is not the latest
    When the system requires confirmation for deletion
    Then the user is informed about any dependencies linked to the version slated for deletion

  Scenario: Conflict during version management
    Given the system detects a conflict during a version operation
    Then the system presents clear error messages detailing the conflict
    And proposes actionable steps to resolve the issue

  Scenario: Log action when saving a new version
    Given the user selects to save changes as a new version
    Then the system logs the current timestamp and marks it as versioned

  Scenario: Prompt user for action on uncommitted changes
    Given the user has uncommitted changes in the script
    When the user attempts to execute the script
    Then the system will inform the user to commit changes before executing
    And the system also provides the option to run the last committed version
