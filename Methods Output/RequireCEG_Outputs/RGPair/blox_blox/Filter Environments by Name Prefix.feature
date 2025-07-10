Feature: Filter Environments by Name Prefix

  As a user
  I want to list environments within a specified cluster by providing a name prefix
  So that I can easily find the environments that match specific criteria

  Background:
    Given the system contains a list of environments within specific clusters
    And the user has access to the environments

  Scenario: Scenario 1: Return environments matching prefix
    Given the user specifies a prefix 'prod'
    And the cluster 'Cluster A' has the environments 'prod-db', 'prod-api', and 'staging-api'
    When the user requests to list environments with the prefix 'prod'
    Then the system should return a list of environments matching the prefix
    And the returned list should include 'prod-db' and 'prod-api'

  Scenario: Scenario 2: Return no matches for prefix
    Given the user specifies a prefix 'dev'
    And the cluster 'Cluster B' has no environments starting with 'dev'
    When the user requests to list environments with the prefix 'dev'
    Then the system should return an empty response
    And the message should indicate that no matches were found

  Scenario: Scenario 3: Return all environments without prefix
    Given the user does not specify any prefix
    And the cluster 'Cluster C' has the environments 'staging-db', 'prod-api', 'test-service'
    When the user requests to list all environments for 'Cluster C'
    Then the system should return the complete list of environments
    And the returned list should include 'staging-db', 'prod-api', and 'test-service'

  Scenario: Scenario 4: Cluster does not exist
    Given the user specifies the cluster 'Cluster D'
    When the cluster does not exist in the system
    Then the system should generate an error message
    And the message should state that no environments are available for that cluster

  Scenario: Scenario 5: Validate environments by prefix with existing cluster
    Given the user provides a cluster name 'Cluster A'
    And the user provides a name prefix 'prod'
    And the specified cluster exists
    When the user requests to filter environments by the given prefix
    Then the system should ensure that only valid and accessible environments are considered in the response
    And the system should return environments matching the prefix 'prod'

  Scenario: Scenario 6: Check for absence of environments that match prefix
    Given the user provides a cluster name 'Cluster B'
    And the user provides a name prefix 'dev'
    And the specified cluster exists
    And the cluster has no environments associated with it
    When the user requests to filter environments by the name prefix 'dev'
    Then the system should return an empty response
    And the message should indicate that no environments are available for the specified cluster
