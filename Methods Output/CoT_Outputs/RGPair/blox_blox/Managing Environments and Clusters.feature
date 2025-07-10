Feature: Managing Environments and Clusters
As a user,
I want to manage environments and clusters
So that I can efficiently list, create, update, delete environments and clusters, while ensuring revisions are tracked and errors are properly handled.

Scenario Outline: List environments in a cluster
  Given that I have access to the <cluster-name>
  When I list the environments in the cluster
  Then the system should return environments with the name starting with <prefix>
  And the system should return an empty list if no environments exist for a non-existent cluster

Examples:
  | cluster-name   | prefix | 
  | Cluster-1      | Env    | 
  | NonExistent    | Env    | 

Scenario Outline: Create environment in a cluster
  Given that I have access to the <cluster-name>
  When I create an environment with the name <env-name> in the cluster
  Then the environment should be created successfully in the <cluster-name>
  And the system should return an error if the environment already exists in the same cluster

Examples:
  | cluster-name   | env-name   |
  | Cluster-1      | Env1       |
  | Cluster-2      | Env2       |

Scenario Outline: Update environment in a cluster
  Given that I have access to the <cluster-name>
  And the environment <env-name> exists in the cluster
  When I update the environment's configuration
  Then the environment should be updated successfully
  And the system should throw an error if the environment does not exist

Examples:
  | cluster-name   | env-name   |
  | Cluster-1      | Env1       |
  | Cluster-2      | Env2       |

Scenario Outline: Delete environment from a cluster
  Given that I have access to the <cluster-name>
  And the environment <env-name> exists in the cluster
  When I delete the environment from the cluster
  Then the environment should be deleted successfully
  And the system should throw an error if the environment does not exist

Examples:
  | cluster-name   | env-name   |
  | Cluster-1      | Env1       |
  | Cluster-2      | Env2       |

Scenario Outline: Track environment revisions
  Given that I have access to the <cluster-name>
  When I create, update, or delete the environment <env-name>
  Then the system should capture a revision of the environment change
  And the revision should include the timestamp and operation type

Examples:
  | cluster-name   | env-name   |
  | Cluster-1      | Env1       |
  | Cluster-2      | Env2       |

Scenario Outline: Deploy system task
  Given that I have access to the <cluster-name>
  When I schedule a task for environment <env-name>
  Then the task should be deployed successfully if it is not up-to-date
  And the system should not replace tasks that are already up-to-date
  And the system should handle task failures efficiently

Examples:
  | cluster-name   | env-name   |
  | Cluster-1      | Env1       |
  | Cluster-2      | Env2       |
