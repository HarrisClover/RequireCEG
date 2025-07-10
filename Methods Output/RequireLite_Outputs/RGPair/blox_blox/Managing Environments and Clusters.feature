Feature: Managing Environments and Clusters

  As a system administrator
  I want to manage environments and clusters effectively
  So that I can maintain a robust system for deployment and resource management

  Background:
    Given the service is available
    And the user has administrative privileges

  Scenario: Scenario 1: Listing existing environments
    Given there are existing environments named 'Test Environment 1', 'Dev Environment' in the cluster
    When the user lists the environments
    Then the user should see 'Test Environment 1' and 'Dev Environment'
    And the environments should be displayed as 'Available', with their details

  Scenario: Scenario 2: Listing environments in a non-existent cluster
    Given the cluster with ID 'cluster-123' does not exist
    When the user tries to list environments in that cluster
    Then an empty response should be returned

  Scenario: Scenario 3: Creating a new environment
    Given the user is attempting to create a new environment named 'New Test Environment'
    When the user submits the creation request with specific resources '2 vCPUs, 4GB RAM'
    Then the environment should be created successfully
    And the user should receive a success message confirming 'New Test Environment has been created'

  Scenario: Scenario 4: Error on creating an existing environment
    Given an environment named 'Test Environment 1' already exists in the cluster
    When the user attempts to create an environment with the same name 'Test Environment 1'
    Then the system should reject the creation request
    And the user should receive an informative error message stating 'An environment with this name already exists'

  Scenario Outline: Scenario Outline: Updating an existing environment
    Given the environment named '<env-name>' exists in the cluster
    When the user submits the update request
    Then the environment should be updated successfully
    And the revision history should reflect the change to '<update-thing>'
    Examples:
      | env-name | update-thing |
      | Test Environment 1 | configuration details including version updates |
      | Dev Environment | resource limits increasing to 4 vCPUs |


  Scenario: Scenario 5: Error on updating a non-existent environment
    Given the environment named 'Non-existent Environment' does not exist
    When the user tries to update it
    Then the update request should be rejected
    And the user should receive an appropriate error message stating 'The specified environment does not exist'

  Scenario: Scenario 6: Managing Clusters
    Given the user wants to list all clusters
    When the user requests the cluster list
    Then all the clusters should be displayed
    And the user can see which environments are associated with each cluster alongside the resource allocation
