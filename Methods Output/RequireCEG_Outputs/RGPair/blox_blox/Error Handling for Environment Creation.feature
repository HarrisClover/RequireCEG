Feature: Error Handling for Environment Creation

  As a user
  I want the system to prevent creation of environments with duplicate names within the same cluster
  So that I can avoid confusion and ensure unique identification of environments

  Background:
    Given the user is logged into the system
    And the user has cluster access

  Scenario: Creating an Environment with Existing Name
    Given an existing environment named 'TestEnv'
    And the user attempts to create an environment also named 'TestEnv' in 'ClusterA'
    When the system checks for existing environments in 'ClusterA'
    Then the system should respond with 'Environment already exists in this cluster.'

  Scenario: Creating an Environment in a Different Cluster
    Given the user attempts to create an environment named 'NewEnv'
    And specifies a different cluster 'ClusterB' that exists
    When the environment creation request is submitted
    Then the system should confirm successful creation of 'NewEnv' in 'ClusterB'.

  Scenario: Creating an Environment in a Non-Existent Cluster
    Given the user attempts to create an environment named 'AnotherEnv'
    And specifies a cluster 'InvalidCluster' that does not exist
    When the environment creation request is submitted
    Then the system should respond with 'Cluster cannot be found.'

  Scenario: Creating an Environment with Empty Name
    Given the user attempts to create an environment with an empty name
    When the system checks the validity of the creation request
    Then the system should respond with 'Environment name cannot be empty.'

  Scenario Outline: Scenario Outline: Multiple Errors on Environment Creation
    Given the user specifies an environment name '<env-name>'
    And the user specifies a cluster '<cluster-name>'
    When the system checks the validity of the environment creation request
    Then the system should respond with '<error-message>'
    Examples:
      | env-name | cluster-name | error-message |
      | TestEnv | ClusterA | Environment already exists in this cluster. |
      | AnotherEnv | InvalidCluster | Cluster cannot be found. |
      |  | ClusterA | Environment name cannot be empty. |

