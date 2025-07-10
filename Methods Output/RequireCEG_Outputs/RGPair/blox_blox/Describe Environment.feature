Feature: Describe Environment

  As a user
  I want to retrieve detailed descriptions of environments within validated clusters
  So that I can understand their current settings and revision history

  Background:
    Given a valid cluster identifier exists in the database
    And the user is authenticated

  Scenario: Scenario 1: Valid Cluster and Existing Environment
    Given the cluster identifier is valid
    And the environment specified exists within the cluster
    When the user requests the environment's details
    Then the system should present a detailed description of the environment
    And the current settings and revision history should be included

  Scenario: Scenario 2: Valid Cluster and Non-existing Environment
    Given the cluster identifier is valid
    When the user requests details for an environment that does not exist within the cluster
    Then the system should return a message stating that the specified environment could not be found

  Scenario: Scenario 3: Invalid Cluster Identifier
    Given the cluster identifier does not exist
    When the user attempts to retrieve environment details
    Then the system should provide an error message indicating that the provided cluster is invalid
    And the user cannot retrieve any environment information

  Scenario: Scenario 4: Existing Environment in Invalid Cluster
    Given the cluster identifier exists
    And the environment specified does not exist within the valid cluster
    When the user requests the environment's details
    Then the system should return a message indicating that the specified environment could not be found

  Scenario Outline: Scenario Outline: Invalid Environment Requests
    Given the cluster identifier is <cluster-id>
    And the environment requested is <environment-name>
    When the user makes a request for the environment
    Then the system should respond with <response>
    Examples:
      | cluster-id | environment-name | response |
      | valid-cluster | existing-environment | the environment details |
      | valid-cluster | non-existing-environment | environment not found message |
      | invalid-cluster | any-environment | invalid cluster error message |

