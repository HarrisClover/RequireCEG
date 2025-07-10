Feature: Handle Non-Existent Environment Updates

  As a system administrator
  I want to manage environment updates and deletions effectively
  So that I can ensure correct feedback is provided to users about their actions

  Background:
    Given the system has a list of environments within the cluster
    And the administrator is logged into the management system

  Scenario: Update request for a non-existent environment
    Given the specified environment does not exist
    When an update request for that environment is received
    Then an error message stating 'Error: The specified environment is non-existent.' is displayed
    And the system responds with 'Error: The specified environment is non-existent.' for invalid updates

  Scenario: Correctly formatted update request for an existing environment
    Given the specified environment exists
    When a correctly formatted update request for that environment is received
    Then a success message stating 'Update successful.' is displayed
    And the system processes the update request.

  Scenario: Incorrectly formatted update request for an existing environment
    Given the specified environment exists
    When an incorrectly formatted update request for that environment is received
    Then an error message stating 'Error: Invalid update request format.' is displayed

  Scenario: Delete request for a non-existent environment
    Given the specified environment does not exist
    When a delete request for that environment is received
    Then an error message stating 'Error: The environment cannot be found.' is displayed
    And the system checks for the existence of the environment before deletion.

  Scenario: Successful deletion of an existing environment
    Given the specified environment exists
    When a delete request for that environment is received
    Then a confirmation message stating 'Deletion successful.' is displayed
    And the system responds with 'Deletion successful.' for valid deletions

  Scenario: Incorrectly formatted update request for a non-existent environment
    Given the specified environment does not exist
    When an incorrectly formatted update request for that environment is received
    Then the system responds with 'Error: Invalid update request format.'
