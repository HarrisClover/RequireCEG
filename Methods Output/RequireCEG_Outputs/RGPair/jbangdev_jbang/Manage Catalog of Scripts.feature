Feature: Manage Catalog of Scripts

  As a user
  I want to manage scripts effectively in the catalog
  So that I can easily create, edit, and execute scripts without errors

  Background:
    Given the user has access to the script management system
    And there are existing scripts in the catalog

  Scenario: Scenario 1: Initialize a new script
    Given the user attempts to create a script with a name that already exists in the catalog
    Then the error message 'The script already exists' should be displayed

  Scenario: Scenario 2: Edit an existing script
    Given the user opts to edit an existing script
    When validating the script path for the existing script
    Then if the validation fails, the error message 'Invalid script path or corrupted file' should be shown

  Scenario: Scenario 3: Execute a script with missing dependencies
    Given the user attempts to execute a script with missing dependencies
    When the system checks for necessary dependencies
    Then the system will attempt to fetch them automatically
    And if the fetch is successful, display a success message upon retrieval, otherwise display an error if the fetch fails

  Scenario: Scenario 4: Clear cache confirmation
    Given the user initiates a request to clear the cache
    When the system requests confirmation to clear the cache
    Then upon confirmation, the message 'Cache has been cleared successfully.' should be displayed

  Scenario: Scenario 5: Add a new catalog item with format validation
    Given the user adds a new catalog item with an incorrect format
    Then the system should generate error messages detailing the specific format issues

  Scenario: Scenario 6: Filter and sort scripts in the catalog
    Given there are multiple scripts in the catalog
    When the user chooses to filter and sort the scripts by creation date
    Then the results should be presented in a neatly organized format

  Scenario: Scenario 7: Attempt to execute script with missing dependencies
    Given the user attempts to execute a script and the necessary dependencies are missing
    Then the system should attempt to fetch missing dependencies automatically and show success or failure messages based on the outcome

  Scenario: Scenario 8: Ensure only one cache clearing action occurs
    Given the user has requested to clear the cache and confirmed the action
    When another request to clear the cache is made before the first action has completed
    Then the system should enforce that only one cache clearing action occurs at a time
