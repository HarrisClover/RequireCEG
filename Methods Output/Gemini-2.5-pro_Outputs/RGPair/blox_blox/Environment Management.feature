Feature: Environment Management
  As a System User/Operator,
  I want to manage environments within clusters via a data service,
  So that I can configure and maintain application deployments.

  Scenario: List environments in an existing cluster with no environments
    Given cluster "prod-us-east-1" exists
    And cluster "prod-us-east-1" has no environments
    When I list environments for cluster "prod-us-east-1"
    Then the response should be an empty list

  Scenario: List environments in a non-existent cluster
    Given cluster "non-existent-cluster" does not exist
    When I list environments for cluster "non-existent-cluster"
    Then the response should be an empty list

  Scenario: List multiple environments in an existing cluster
    Given cluster "dev-eu-west-1" exists
    And the following environments exist in cluster "dev-eu-west-1":
      | name        | config          |
      | api-gateway | {"port": 8080}  |
      | user-service| {"replicas": 3} |
    When I list environments for cluster "dev-eu-west-1"
    Then the list should contain environment "api-gateway"
    And the list should contain environment "user-service"

  Scenario Outline: Filter environments by name prefix
    Given cluster "staging-asia-1" exists
    And the following environments exist in cluster "staging-asia-1":
      | name          | config          |
      | backend-main  | {"version": "1.2"} |
      | backend-cache | {"size": "10G"}  |
      | frontend-app  | {"theme": "dark"}  |
    When I list environments for cluster "staging-asia-1" with name prefix "<prefix>"
    Then the list should contain environments <expected_environments>
    And the list should not contain environments <excluded_environments>

    Examples:
      | prefix    | expected_environments        | excluded_environments |
      | "backend-"| "backend-main", "backend-cache" | "frontend-app"        |
      | "front"   | "frontend-app"               | "backend-main", "backend-cache" |
      | "nonmatch"|                              | "backend-main", "backend-cache", "frontend-app" |

  Scenario: Create a new environment successfully
    Given cluster "prod-us-east-1" exists
    And environment "new-app" does not exist in cluster "prod-us-east-1"
    When I create an environment named "new-app" with configuration '{"deploy": "blue-green"}' in cluster "prod-us-east-1"
    Then the operation should be successful
    And environment "new-app" should exist in cluster "prod-us-east-1"

  Scenario: Attempt to create an environment that already exists in the same cluster
    Given cluster "prod-us-east-1" exists
    And environment "existing-app" exists in cluster "prod-us-east-1"
    When I attempt to create an environment named "existing-app" with configuration '{"deploy": "canary"}' in cluster "prod-us-east-1"
    Then the operation should fail
    And an informative error message indicating "environment already exists" should be returned

  Scenario: Create environments with the same name in different clusters
    Given cluster "prod-us-east-1" exists
    And cluster "dev-eu-west-1" exists
    And environment "shared-service" does not exist in cluster "prod-us-east-1"
    And environment "shared-service" does not exist in cluster "dev-eu-west-1"
    When I create an environment named "shared-service" with configuration '{"region": "us"}' in cluster "prod-us-east-1"
    And I create an environment named "shared-service" with configuration '{"region": "eu"}' in cluster "dev-eu-west-1"
    Then the operation for cluster "prod-us-east-1" should be successful
    And the operation for cluster "dev-eu-west-1" should be successful
    And environment "shared-service" should exist in cluster "prod-us-east-1"
    And environment "shared-service" should exist in cluster "dev-eu-west-1"

  Scenario: Describe an existing environment
    Given cluster "staging-asia-1" exists
    And environment "config-service" exists in cluster "staging-asia-1" with configuration '{"timeout": 5000}'
    When I describe environment "config-service" in cluster "staging-asia-1"
    Then the response should contain the configuration '{"timeout": 5000}'
    And the response should contain the cluster "staging-asia-1"

  Scenario: Attempt to describe a non-existent environment
    Given cluster "staging-asia-1" exists
    And environment "ghost-service" does not exist in cluster "staging-asia-1"
    When I attempt to describe environment "ghost-service" in cluster "staging-asia-1"
    Then the operation should fail
    And an informative error message indicating "environment not found" should be returned

  Scenario: Update an existing environment successfully
    Given cluster "dev-eu-west-1" exists
    And environment "user-service" exists in cluster "dev-eu-west-1" with configuration '{"replicas": 3}'
    When I update environment "user-service" in cluster "dev-eu-west-1" with configuration '{"replicas": 5, "memory": "2Gi"}'
    Then the operation should be successful
    And describing environment "user-service" in cluster "dev-eu-west-1" should return the configuration '{"replicas": 5, "memory": "2Gi"}'

  Scenario: Attempt to update a non-existent environment
    Given cluster "dev-eu-west-1" exists
    And environment "vanished-service" does not exist in cluster "dev-eu-west-1"
    When I attempt to update environment "vanished-service" in cluster "dev-eu-west-1" with configuration '{"replicas": 1}'
    Then the operation should fail
    And an informative error message indicating "environment not found" should be returned

  Scenario: Delete an existing environment successfully
    Given cluster "staging-asia-1" exists
    And environment "temp-job" exists in cluster "staging-asia-1"
    When I delete environment "temp-job" from cluster "staging-asia-1"
    Then the operation should be successful
    And environment "temp-job" should not exist in cluster "staging-asia-1"

  Scenario: Attempt to delete a non-existent environment
    Given cluster "staging-asia-1" exists
    And environment "already-gone" does not exist in cluster "staging-asia-1"
    When I attempt to delete environment "already-gone" from cluster "staging-asia-1"
    Then the operation should fail
    And an informative error message indicating "environment not found" should be returned

