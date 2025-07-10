Feature: Ensuring Reliable Feedback Mechanism

  As a user of AWS services
  I want to retrieve a list of resources and receive accurate feedback
  So that I can effectively manage my AWS resources

  Background:
    Given that the user has valid AWS credentials
    And the system is properly configured to access AWS services

  Scenario: Retrieve topics from Amazon SNS
    Given a request to list topics from Amazon SNS
    When the request is processed
    Then a structured list of existing SNS topics is returned

  Scenario: Retrieve available WorkSpaces
    Given a request to list available WorkSpaces
    When the request is processed
    Then a list of available WorkSpaces is returned

  Scenario: Access a non-existent SQS queue
    Given a request to access a non-existent SQS queue
    When the request is processed
    Then the system returns 'Resource not found' with a 404 error code

  Scenario: IAM API call with incorrect parameters
    Given a request to submit an API call to AWS IAM with incorrect parameters
    When the request is processed
    Then the system returns a detailed error message indicating invalid input parameters

  Scenario: Describe non-existent RDS instance
    Given a request to describe an RDS instance that does not exist
    When the request is processed
    Then the system returns 'Instance does not exist' with error code RDS404

  Scenario: Ensure error message for non-existent SQS queue
    Given a request to access a non-existent SQS queue
    When the request fails
    Then the system generates and returns the error message 'Resource not found' with error code 404

  Scenario: Valid IAM API call with correct parameters
    Given a request to submit a valid API call to AWS IAM
    When the request is processed
    Then the system returns a success message indicating valid input parameters

  Scenario Outline: Handle various AWS service requests
    Given a request to <service> with parameters <parameters>
    When the request is processed
    Then the system should return <expected outcome>
    Examples:
      | service | parameters | expected outcome |
      | SNS | list topics | structured list of topics |
      | WorkSpaces | list available workspaces | list of available WorkSpaces |
      | SQS | access non-existent queue | 'Resource not found' with 404 |
      | IAM | invalid api call | detailed error message |
      | RDS | describe non-existent instance | 'Instance does not exist' with RDS404 |

