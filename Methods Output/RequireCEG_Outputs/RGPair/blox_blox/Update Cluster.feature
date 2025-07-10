Feature: Update Cluster

  As a user
  I want to update existing clusters in the system
  So that I can ensure that my clusters are current and reflect the necessary changes

  Background:
    Given a cluster exists in the system
    And the user is logged into the system

  Scenario: Scenario 1: Update a non-existent cluster
    Given the user attempts to update a cluster that does not exist
    Then the system returns an error message stating 'Cluster not found.'

  Scenario: Scenario 2: Update with invalid data
    Given the user provides invalid data for an existing cluster
    Then the system displays detailed error messages to inform the user of the validation issues

  Scenario: Scenario 3: Update an up-to-date cluster
    Given the user attempts to update an up-to-date cluster with no changes
    Then the system responds with 'No updates necessary, cluster is already up-to-date.'

  Scenario: Scenario 4: Insufficient permissions
    Given the user does not have sufficient permissions to perform the update
    Then the system issues a message indicating 'Insufficient permissions to update the cluster.'

  Scenario: Scenario 5: Valid Data Update
    Given the user attempts to update an existing cluster with valid data
    And the user has sufficient permissions to update
    When the user submits the update request
    Then the system updates the cluster successfully.

  Scenario: Scenario 6: Insufficient Permissions Validation
    Given the user attempts to update an existing cluster with valid data
    And the user has insufficient permissions to update
    When the user submits the update request
    Then the system returns 'Insufficient permissions to update the cluster.'

  Scenario Outline: Scenario Outline: Update Cluster Validations
    Given the user attempts to update an existing cluster with <data>
    And the user has <permissions> to update
    When the user submits the update request
    Then the system returns <response>
    Examples:
      | data | permissions | response |
      | valid data | sufficient permissions | Update successful. |
      | invalid data | sufficient permissions | Validation errors encountered. |
      | valid data | insufficient permissions | Insufficient permissions to update the cluster. |

