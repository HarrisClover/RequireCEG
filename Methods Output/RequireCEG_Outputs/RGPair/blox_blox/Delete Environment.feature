Feature: Delete Environment

  As a user
  I want to delete an environment within a specified cluster
  So that I can manage the resources effectively and free up space

  Background:
    Given the user is authenticated and authorized to delete environments
    And the cluster management system is operational

  Scenario: Scenario 1: Delete an existing environment
    Given the cluster 'TestCluster' exists
    And the environment 'TestEnvironment' exists within 'TestCluster'
    When the user initiates the deletion of 'TestEnvironment'
    Then the environment should be successfully removed
    And the system logs the revision details of 'TestEnvironment'

  Scenario: Scenario 2: Attempt to delete a non-existent cluster
    Given the cluster 'NonExistentCluster' does not exist
    When the user attempts to delete any environment
    Then the system should return an error message stating 'Cluster does not exist.'

  Scenario: Scenario 3: Attempt to delete an environment that does not exist
    Given the cluster 'TestCluster' exists
    And the environment 'NonExistentEnvironment' does not exist within 'TestCluster'
    When the user attempts to delete 'NonExistentEnvironment'
    Then the system should throw an exception and display 'Environment not found in the specified cluster.'

  Scenario: Scenario 4: Attempt to delete environment when the cluster exists but not the environment
    Given the cluster 'TestCluster' exists
    And the environment 'AnotherNonExistentEnvironment' does not exist within 'TestCluster'
    When the user attempts to delete 'AnotherNonExistentEnvironment'
    Then the system should throw an exception and display 'Environment not found in the specified cluster.'

  Scenario Outline: Scenario Outline: Delete Environment based on cluster and environment existence
    Given the cluster '<cluster>' exists
    And the environment '<environment>' does <existence>
    When the user attempts to delete '<environment>'
    Then the system should <response>
    Examples:
      | cluster | environment | existence | response |
      | TestCluster | TestEnvironment | exist | successfully remove the environment and log details |
      | TestCluster | NonExistentEnvironment | not exist | throw an exception and display 'Environment not found in the specified cluster.' |
      | NonExistentCluster | AnyEnvironment | any | return an error message stating 'Cluster does not exist.' |

