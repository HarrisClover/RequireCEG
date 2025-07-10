Feature: Informative Error Messages for Resource Exceptions

  As a system administrator
  I want to receive informative error messages during environment management tasks
  So that I can effectively resolve issues and maintain cluster environments

  Background:
    Given a cluster managing multiple environments
    And the user has the necessary permissions to manage environments

  Scenario: Creating an existing environment
    Given a user attempts to create an environment that already exists
    When the user submits the creation request
    Then the system should display 'Environment already exists in this cluster.'

  Scenario: Updating a non-existing environment
    Given a user attempts to update an environment that does not exist
    When the user submits the update request
    Then the system should respond with 'Error: Environment not found for update.'

  Scenario: Deleting a non-existing environment
    Given a user attempts to delete an environment that does not exist
    When the user submits the delete request
    Then the system should indicate 'Cannot delete: Environment does not exist.'

  Scenario: Querying environments in a non-existing cluster
    Given a user queries for environments in a cluster that does not exist
    When the user submits the query
    Then the response should be 'No environments found for the specified cluster.'

  Scenario: Deployment failure during environment tasks
    Given a task deployment is initiated for an environment
    When the deployment fails due to an error
    Then the system should present the message 'Deployment failed: please check the task details and try again.'

  Scenario: Checking for non-existing environment conditions
    Given a user attempts to update an environment that does not exist
    When the user submits the update request
    Then the system confirms that the environment is not found for update

  Scenario: Delete operation on a non-existing environment
    Given a user attempts to delete an environment that does not exist
    When the user submits the delete request
    Then the system confirms that deletion cannot occur
