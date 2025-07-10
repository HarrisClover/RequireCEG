Feature: List Environments

  As a user
  I want to retrieve a list of environments linked to a specific cluster
  So that I can manage my operational settings effectively

  Background:
    Given the user has a valid cluster identifier
    And the system is operational

  Scenario: Scenario 1: Retrieve environments for a valid cluster
    Given the cluster identifier corresponds to an existing cluster
    When the user requests to list environments
    Then the system should return a list of environments linked to the cluster
    And the list should include all relevant environment details

  Scenario: Scenario 2: No environments found for a valid cluster with prefix
    Given the cluster identifier corresponds to an existing cluster
    When the user requests to filter environments by a specific prefix
    Then the system should return an empty result set
    And the user is informed that no environments meet the filter criteria

  Scenario: Scenario 3: Invalid cluster identifier
    Given the cluster identifier does not correspond to any existing clusters
    When the user requests to list environments
    Then the system should return an empty response
    And the user is informed that no environments exist in the specified cluster

  Scenario: Scenario 4: Retrieval process errors due to database connectivity issues
    Given the cluster identifier is a valid cluster identifier
    And the database connectivity is down
    When the user requests to list environments
    Then the system should produce an informative error message stating 'Database connectivity issue'

  Scenario: Scenario 5: Retrieval process errors due to invalid cluster identifier
    Given the cluster identifier is an invalid cluster identifier
    And the database connectivity is up
    When the user requests to list environments
    Then the system should produce an informative error message stating 'Cluster does not exist'
