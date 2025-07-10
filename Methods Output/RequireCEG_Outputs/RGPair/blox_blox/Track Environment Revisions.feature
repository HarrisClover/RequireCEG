Feature: Track Environment Revisions

  As a system administrator
  I want to log environment creation, updates, and deletions with detailed revisions
  So that I can maintain a clear audit trail of all actions performed on environments

  Background:
    Given a user is logged into the system
    And the user has permissions to manage environments

  Scenario: Scenario 1: Creating a new environment
    Given the user creates a new environment
    When the environment is successfully created
    Then a revision should be logged with the creation timestamp and user identifier
    And the environment setup details should be included in the revision log

  Scenario: Scenario 2: Updating an existing environment
    Given the user updates an existing environment
    When the update is successful
    Then a new revision should be created with the update timestamp and user identifier
    And the specific changes made to the environment should be documented in the log

  Scenario: Scenario 3: Deleting an environment
    Given the user requests to delete an environment
    When the deletion is successful
    Then the system should log the deletion action with the deletion timestamp and user identifier

  Scenario: Scenario 4: Attempting to update a non-existent environment
    Given the user attempts to update an environment that does not exist
    When the system processes the update request
    Then the system should throw an exception message indicating that the operation cannot be completed

  Scenario: Scenario 5: Attempting to create an environment with an error
    Given the system encounters an error during the creation of an environment
    When the error occurs
    Then an error revision should be logged with the nature of the error, timestamp, and user details

  Scenario: Scenario 6: Attempting to update an environment with a system error
    Given the system encounters an error during the update of an environment
    When the error occurs
    Then an error revision should be logged with the nature of the error, timestamp, and user details

  Scenario: Scenario 7: Attempting to delete an environment with a permission error
    Given the system encounters an error during the deletion of an environment
    When the error occurs
    Then an error revision should be logged with the nature of the error, timestamp, and user details

  Scenario Outline: Scenario Outline: Handling errors during environment operations
    Given the system encounters an error during the <operation> of an environment
    When the error occurs
    Then an error revision should be logged with the error details and timestamp
    And the user details should be captured in the error log
    Examples:
      | operation | error type |
      | creation | validation error |
      | update | system error |
      | deletion | permission error |

