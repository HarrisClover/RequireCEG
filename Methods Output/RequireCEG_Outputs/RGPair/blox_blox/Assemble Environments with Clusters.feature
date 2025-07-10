Feature: Assemble Environments with Clusters

  As a system administrator
  I want to manage and list environments under clusters
  So that I can ensure efficient deployment and management of resources

  Background:
    Given the system has a predefined set of clusters and environments
    And the user is authenticated and authorized to manage environments

  Scenario: Scenario 1: List environments in an existing cluster
    Given the user requests to list environments under cluster 'ClusterA'
    Then the system should return all environments associated with 'ClusterA'

  Scenario: Scenario 2: Attempt to list environments in a non-existing cluster
    Given the user provides a cluster identifier 'NonExistentCluster'
    Then the system should respond with an empty list indicating no environments are found

  Scenario: Scenario 3: Create an environment that already exists
    Given the user attempts to create an environment 'DevEnvironment' in 'ClusterA'
    And the environment 'DevEnvironment' already exists in 'ClusterA'
    Then the system should reject the creation attempt
    And display a message stating 'Error: Environment already exists in this cluster.'

  Scenario: Scenario 4: Create a new environment in a cluster
    Given the user attempts to create a new environment 'TestEnvironment' in 'ClusterB'
    When the environment does not exist in 'ClusterB'
    Then the system should successfully add the new environment
    And log the creation event with a revision number

  Scenario: Scenario 5: Update an existing environment
    Given the user submits an update request for 'DevEnvironment' in 'ClusterA'
    When the environment exists
    Then the system should process the update
    And confirm the action with a success message

  Scenario: Scenario 6: Attempt to update a non-existing environment
    Given the user tries to update an environment 'NonExistentEnvironment'
    Then the system shall throw an exception
    And provide the message 'Exception: Environment does not exist.'

  Scenario: Scenario 7: List all clusters
    Given the user requests to list all clusters
    Then the system should return a comprehensive list of available clusters

  Scenario: Scenario 8: Schedule a deployment task that is already up-to-date
    Given the user schedules a deployment task 'DeployTask1'
    When the task is already up-to-date
    Then the system should prevent the task from being replaced

  Scenario: Scenario 9: Handle a failed deployment task gracefully
    Given the user schedules a deployment task that fails
    Then the system should provide the user with a relevant error message

  Scenario: Scenario 10: Daemon deployment with Replace After Terminate strategy
    Given the user schedules a daemon deployment with the flag set for Replace After Terminate
    When there are existing processes associated with that deployment
    Then the system should terminate those existing processes before proceeding with the new deployment

  Scenario: Scenario 11: Retrieve all environments for a given cluster
    Given the user requests to retrieve all environments for cluster 'ClusterA'
    Then the system should return all environments associated with 'ClusterA'

  Scenario: Scenario 12: Show error for invalid cluster identifier
    Given the user provides a cluster identifier 'InvalidCluster'
    Then the system should respond with an empty list indicating no environments are found
