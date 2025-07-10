Feature: Delete Cluster

  As a user
  I want to delete a specified cluster
  So that I can manage the resources in the system effectively

  Background:
    Given the user is logged into the system
    And the user has a list of clusters available

  Scenario: Cluster exists and is deleted successfully
    Given the user specifies a valid cluster identifier
    When the user requests to delete the cluster
    Then the system confirms that the deletion process commences
    And the operation is logged for tracking purposes including the deletion initiation

  Scenario: Cluster does not exist
    Given the user specifies an invalid cluster identifier
    When the user requests to delete the cluster
    Then the system generates and displays an error message stating that the specified cluster cannot be found

  Scenario: Cluster has associated environments
    Given the user specifies a cluster identifier that has associated environments
    When the user requests to delete the cluster
    Then the system presents a warning message informing the user of the existing associations
    And the user is required to confirm whether to proceed with the deletion

  Scenario: User declines deletion after warning
    Given the user specifies a cluster identifier that has associated environments
    When the user chooses to decline the deletion after being warned about the associations
    Then the system does not delete the cluster or its associated environments

  Scenario Outline: Delete cluster with confirmation on associations
    Given the user specifies a cluster identifier with associated environments
    When the user confirms the deletion after being warned about the associations
    Then the system deletes the cluster and all associated environments
    And the operation is logged detailing both the original cluster deletion and associated environment deletions
    Examples:
      | Cluster Identifier | Has Environments | User Confirmation |
      | ClusterA | Yes | Confirmed |
      | ClusterB | No | Not Confirmed |
      | ClusterC | Yes | Declined |

