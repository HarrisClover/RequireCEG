Feature: System Deployment
  As a System Operator,
  I want to schedule and manage system deployments based on environment configurations,
  So that applications are deployed reliably and efficiently.

  Scenario: Schedule a new deployment task
    Given cluster "deploy-cluster" exists
    And environment "deploy-app-v1" exists in cluster "deploy-cluster" with configuration '{"image": "app:v1", "replicas": 2}'
    And the system "deploy-app" is not currently deployed according to "deploy-app-v1" configuration
    When I schedule a deployment task for environment "deploy-app-v1" in cluster "deploy-cluster"
    Then a deployment task should be created successfully
    And the task status should eventually reflect progress towards deploying '{"image": "app:v1", "replicas": 2}'

  Scenario: Prevent deployment replacement for an up-to-date system
    Given cluster "deploy-cluster" exists
    And environment "deploy-app-v2" exists in cluster "deploy-cluster" with configuration '{"image": "app:v2", "replicas": 3}'
    And the system "deploy-app" is already deployed and up-to-date according to "deploy-app-v2" configuration
    When I schedule a deployment task for environment "deploy-app-v2" in cluster "deploy-cluster"
    Then no new deployment task should be created or the existing task should indicate "no action needed"
    And the system state for "deploy-app" should remain unchanged

  Scenario: Handle deployment task failure
    Given cluster "deploy-cluster" exists
    And environment "failing-app" exists in cluster "deploy-cluster" with configuration '{"image": "invalid:latest"}' which causes deployment failure
    When I schedule a deployment task for environment "failing-app" in cluster "deploy-cluster"
    Then a deployment task should be created
    And the task status should eventually indicate "Failed"
    And the failure reason (e.g., "image pull error", "invalid configuration") should be available

  Scenario: Deploy a daemon service using Replace After Terminate strategy
    Given cluster "daemon-cluster" exists
    And environment "logging-daemon" exists in cluster "daemon-cluster" with configuration '{"type": "daemon", "image": "logger:latest", "update_strategy": "ReplaceAfterTerminate"}'
    And the "logging-daemon" is currently running version "logger:old"
    When I schedule a deployment task to update environment "logging-daemon" to configuration '{"type": "daemon", "image": "logger:new", "update_strategy": "ReplaceAfterTerminate"}'
    Then a deployment task should be created
    And the deployment process should first terminate the old daemon instance ("logger:old")
    And only after termination, start the new daemon instance ("logger:new")