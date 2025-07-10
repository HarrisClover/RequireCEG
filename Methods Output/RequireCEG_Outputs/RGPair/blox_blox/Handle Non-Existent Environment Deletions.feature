Feature: Handle Non-Existent Environment Deletions

  As a user of the system
  I want to delete environments within a cluster
  So that I can manage my resources effectively

  Background:
    Given the user is logged into the system
    And the specified cluster is available

  Scenario: Scenario 1: Cluster does not exist
    Given the user specifies a cluster that does not exist
    When the user attempts to delete an environment
    Then the system should return an error message
    And the message should indicate the cluster is not recognized

  Scenario: Scenario 2: Environment does not exist
    Given the user specifies an existing cluster
    And the user specifies an environment that does not exist
    When the user attempts to delete the environment
    Then the system should return an error message
    And the message should indicate the environment cannot be found

  Scenario: Scenario 3: Empty environment name
    Given the user specifies an existing cluster
    When the user attempts to delete an environment with an empty name
    Then the system should respond with a validation error
    And the error message should indicate that the environment name is required

  Scenario: Scenario 4: Successful deletion
    Given the user specifies an existing cluster
    And the user specifies an existing environment
    When the user attempts to delete the environment
    Then the system should confirm that the environment has been successfully deleted
    And the deletion operation should be logged

  Scenario: Scenario 5: Deletion without a recognized cluster
    Given the user specifies a cluster that does not exist
    When the user attempts to delete an environment
    Then the system should return an error message
    And the message should indicate the cluster is not recognized

  Scenario: Scenario 6: Handling empty environment name properly
    Given the user specifies an existing cluster
    When the user attempts to delete an environment with an empty name
    Then the system should issue a validation error
    And the error message should indicate that the environment name is required
