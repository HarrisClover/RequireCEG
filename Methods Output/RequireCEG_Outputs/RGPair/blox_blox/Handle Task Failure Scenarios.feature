Feature: Handle Task Failure Scenarios

  As a system administrator
  I want the system to handle task failures gracefully
  So that users receive clear and actionable messages regarding their requests

  Background:
    Given the system is operational
    And the user has permissions to create, update, or delete environments

  Scenario: Scenario 1: Environment Creation Failure
    Given the user attempts to create an environment that already exists
    When the creation request is processed
    Then the system should log the error details into an error log file
    And the user should receive the message 'Environment already exists in this cluster'

  Scenario: Scenario 2: Environment Update Failure
    Given the user attempts to update a non-existent environment
    When the update request is processed
    Then the system should log the error details into an error log file
    And the user should receive the message 'Cannot update: Environment not found'

  Scenario: Scenario 3: Environment Deletion Failure
    Given the user attempts to delete an environment that does not exist
    When the deletion request is processed
    Then the system should log the error details into an error log file
    And the user should receive the message 'Deletion failed: Environment does not exist'

  Scenario: Scenario 4: Task Up-to-Date Notification
    Given the user requests a scheduling action for an up-to-date task
    When the scheduling request is processed
    Then the system should log that the action was checked
    And the user should be notified with the message 'Task is up-to-date, no action taken'

  Scenario: Scenario 5: Multiple Failures Reporting
    Given multiple operations are performed resulting in different failures
    When the user submits the requests
    Then the system should log all error details
    And the user should receive a consolidated report of all encountered issues

  Scenario Outline: Scenario Outline: Consolidated Error Reporting
    Given multiple operations are performed resulting in different failures
    When the user submits the requests
    Then the system should log all error details
    And the user should receive a consolidated report of all encountered issues
    Examples:
      | operation | error |
      | Create Environment | Environment already exists in this cluster |
      | Update Environment | Cannot update: Environment not found |
      | Delete Environment | Deletion failed: Environment does not exist |

