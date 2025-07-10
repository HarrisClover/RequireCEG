Feature: Prevent Task Replacement for Up-to-Date Instances

  As a deployment manager
  I want to ensure tasks are not replaced if the instance is up-to-date
  So that the deployment process is efficient and avoids unnecessary actions

  Background:
    Given the instance status is available
    And the cluster and associated environment are defined

  Scenario: Scenario 1: Instance is Up-to-Date
    Given the instance is confirmed to be up-to-date
    When attempting to deploy the task
    Then the system should display 'The task is up-to-date, no action necessary.'

  Scenario: Scenario 2: Instance is Not Up-to-Date
    Given the instance is determined to be not up-to-date
    And the specified cluster exists
    And the environment associated with the task is available
    When initiating the deployment process
    Then the system should begin the replacement process for the instance

  Scenario: Scenario 3: Cluster Does Not Exist
    Given the specified cluster does not exist
    When attempting to deploy the task
    Then the system should present an error message 'Error: The specified cluster does not exist.'

  Scenario: Scenario 4: Environment is Not Available
    Given the environment associated with the task is missing
    When attempting to deploy the task
    Then the system should present an error message 'Error: The environment associated with the task is not available.'

  Scenario: Scenario 5: Deployment Failure with Cluster Not Existing
    Given the instance is confirmed to be not up-to-date
    And the specified cluster does not exist
    When attempting to deploy the task
    Then the system should present an error message 'Error: The specified cluster does not exist.'

  Scenario: Scenario 6: Deployment Failure with Environment Not Available
    Given the instance is confirmed to be not up-to-date
    And the environment associated with the task is missing
    When attempting to deploy the task
    Then the system should present an error message 'Error: The environment associated with the task is not available.'

  Scenario Outline: Scenario Outline: Deployment Failure Handling
    Given the deployment process encounters a failure
    When the system logs the failure details
    Then the user is provided options to either retry the operation or view specific log details regarding the failure
    Examples:
      | failure_type | retry_option | log_details |
      | network error | retry | view network log |
      | timeout | retry | view timeout log |
      | permission denied | retry | view permission log |

