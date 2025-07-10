Feature: Create Cluster

  As a user
  I want to create a unique cluster with valid parameters
  So that I can manage my resources effectively

  Background:
    Given the user is authenticated
    And the system has specific rules for cluster creation

  Scenario: Scenario 1: Successfully create a unique cluster
    Given a valid cluster name that does not exist
    And valid parameters including a valid region and size
    When the user submits the cluster creation request
    Then the cluster should be created successfully
    And a success message stating the cluster has been successfully created should be returned

  Scenario: Scenario 2: Attempt to create a cluster with an existing name
    Given a cluster name that already exists in the system
    When the user submits the cluster creation request
    Then the cluster should not be created
    And an error message stating the cluster cannot be created because it already exists should be returned

  Scenario: Scenario 3: Attempt to create a cluster with missing parameters
    Given a unique cluster name
    When the user submits the cluster creation request without a required parameter
    Then the cluster should not be created
    And an informative error message stating that one or more required parameters are missing or invalid should be returned

  Scenario: Scenario 4: Attempt to create a cluster while deletion is pending
    Given a unique cluster name
    And the cluster is currently in a deletion state
    When the user submits the cluster creation request
    Then the cluster should not be created
    And a message stating the cluster is currently in a deletion state should be returned

  Scenario Outline: Scenario Outline: Validate cluster creation requirements
    Given the cluster name is '<cluster-name>'
    And the parameters are '<region>' and '<size>'
    When the user attempts to create the cluster
    Then the outcome should be '<result>'
    Examples:
      | cluster-name | region | size | result |
      | UniqueCluster1 | us-west-1 | small | created successfully |
      | ExistingCluster | us-east-1 | medium | error: cluster already exists |
      | NewCluster |  | large | error: missing region |
      | ClusterInDeletion | eu-central-1 | large | error: cluster is in deletion state |

