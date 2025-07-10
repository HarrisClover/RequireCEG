Feature: Support Daemon Deployments

  As a system administrator
  I want to manage daemon deployment tasks effectively
  So that I can ensure the integrity and availability of system resources

  Background:
    Given the system has deployment management capabilities
    And a deployment task can be scheduled by the user

  Scenario: Scenario 1: Reject New Deployment if Up-to-Date
    Given the current daemon deployment task is up-to-date
    When the user attempts to schedule a new deployment
    Then the system should reject the new deployment
    And generate a notification message that the new deployment is rejected.

  Scenario: Scenario 2: Allow Deployment if Outdated
    Given the current daemon deployment task is outdated
    When the user schedules a new deployment
    Then the system should allow the new deployment to proceed.

  Scenario: Scenario 3: Allow Deployment if Failed
    Given the current daemon deployment task has failed
    When the user schedules a new deployment
    Then the system should allow the new deployment to proceed.

  Scenario: Scenario 4: Handle Deployment Failure
    Given a new deployment is in progress
    When a failure occurs during deployment
    Then the system should display an informative error message indicating the nature of the failure.

  Scenario: Scenario 5: Log Successful Deployment
    Given a new deployment is successfully completed
    When the system logs the revision details
    Then the log should indicate successful creation of the new daemon deployment.

  Scenario Outline: Scenario Outline: Replace After Terminate Strategy
    Given the deployment follows the Replace After Terminate strategy
    And the previous deployment is not fully terminated
    When a new deployment is initiated
    Then the system must ensure the previous deployment is fully terminated before proceeding
    Examples:
      | Deployment Status | Action | Outcome |
      | Previous deployment running | Initiate new deployment | Terminate previous deployment before new deployment |
      | Previous deployment terminated | Initiate new deployment | Proceed with new deployment |

