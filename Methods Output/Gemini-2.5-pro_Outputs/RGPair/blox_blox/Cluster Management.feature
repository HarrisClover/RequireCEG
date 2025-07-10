Feature: Cluster Management
  As a System User/Operator,
  I want to manage clusters,
  So that I can organize environments logically or geographically.

  Scenario: List all clusters when none exist
    Given no clusters exist in the system
    When I list all clusters
    Then the response should be an empty list

  Scenario: List all clusters when multiple exist
    Given the following clusters exist:
      | name             |
      | prod-us-east-1   |
      | dev-eu-west-1    |
      | staging-asia-1   |
    # Optional: Add environments to show association if listing clusters includes them
    # And environment "api-gateway" exists in cluster "prod-us-east-1"
    # And environment "user-service" exists in cluster "dev-eu-west-1"
    When I list all clusters
    Then the list should contain cluster "prod-us-east-1"
    And the list should contain cluster "dev-eu-west-1"
    And the list should contain cluster "staging-asia-1"
    # Optional: Verify associated environments if applicable
    # And the cluster details for "prod-us-east-1" should indicate association with "api-gateway"

