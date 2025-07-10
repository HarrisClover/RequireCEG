Feature: Managing Environments and Clusters
  As a system administrator,
  I want to manage environments and clusters effectively,
  So that I can ensure smooth deployment, updates, and tracking of resources.

Scenario: List environments for an existent cluster
  Given that the cluster "Cluster A" exists
  When listing environments for "Cluster A"
  Then the system should return a list of environments for "Cluster A"

Scenario: List environments for a non-existent cluster
  Given that the cluster "Cluster B" does not exist
  When listing environments for "Cluster B"
  Then the system should return an empty list

Scenario: Create a new environment
  Given that the cluster "Cluster A" exists
  When creating a new environment "Environment X" in "Cluster A"
  Then the system should return a success message indicating that "Environment X" has been created

Scenario: Attempt to create an environment that already exists in the same cluster
  Given that the environment "Environment X" already exists in "Cluster A"
  When trying to create "Environment X" in "Cluster A"
  Then the system should return an error message indicating that the environment already exists

Scenario: Create an environment in a different cluster
  Given that the environment "Environment X" does not exist in "Cluster B"
  When creating "Environment X" in "Cluster B"
  Then the system should return a success message indicating that "Environment X" has been created in "Cluster B"

Scenario: Update an existing environment
  Given that the environment "Environment X" exists in "Cluster A"
  When updating the configuration of "Environment X"
  Then the system should return a success message indicating that "Environment X" has been updated

Scenario: Attempt to update a non-existent environment
  Given that the environment "Environment Y" does not exist in "Cluster A"
  When trying to update "Environment Y" in "Cluster A"
  Then the system should return an error message indicating that the environment does not exist

Scenario: Delete an existing environment
  Given that the environment "Environment X" exists in "Cluster A"
  When deleting "Environment X" from "Cluster A"
  Then the system should return a success message indicating that "Environment X" has been deleted

Scenario: Attempt to delete a non-existent environment
  Given that the environment "Environment Y" does not exist in "Cluster A"
  When trying to delete "Environment Y" from "Cluster A"
  Then the system should return an error message indicating that the environment does not exist

Scenario: List all clusters
  Given that multiple clusters exist
  When listing all clusters
  Then the system should return a list of all clusters

Scenario: Deploy system task with up-to-date instance
  Given that a task is already up-to-date
  When attempting to replace the task
  Then the system should prevent the replacement and return a message indicating the task is already up-to-date

Scenario: Handle failure during deployment
  Given that a deployment task fails
  When the system detects the failure
  Then the system should handle the failure efficiently and provide an error message detailing the failure

Scenario: Capture environment revisions
  Given that an environment "Environment X" has been updated
  When tracking the revisions of "Environment X"
  Then the system should record and provide the revision details of "Environment X"

Scenario: Support daemon deployments with Replace After Terminate strategy
  Given that a daemon deployment is requested
  When scheduling the deployment with the Replace After Terminate strategy
  Then the system should ensure the task replaces only after termination and follows the correct strategy
