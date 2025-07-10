Feature: AWS API Error Handling
  As a user
  I want to receive informative error messages when interacting with AWS services incorrectly
  So that I can understand and correct issues with my requests

  Background:
    Given the system is configured for AWS integration

  Scenario: Attempting to get URL for a non-existent SQS queue
    When the user requests the URL for a non-existent SQS queue named "non-existent-queue-123"
    Then the system should return an error response
    And the error response should include an appropriate error code indicating the queue does not exist (e.g., "AWS.SimpleQueueService.NonExistentQueue")
    And the error response should include an informative error message

  Scenario: Attempting to describe a non-existent RDS database instance
    When the user requests to describe a non-existent RDS database instance with identifier "non-existent-db-instance-456"
    Then the system should return an error response
    And the error response should include an appropriate error code indicating the instance was not found (e.g., "DBInstanceNotFound")
    And the error response should include an informative error message

  Scenario Outline: Performing an operation with invalid parameters or identifiers
    When the user attempts to perform an operation on <AWSService> with <InvalidInputDescription>
    Then the system should return an error response
    And the error response should include an appropriate error code like <ExpectedErrorCode>
    And the error response should include an informative error message indicating the input was invalid

    Examples:
      | AWSService   | InvalidInputDescription                      | ExpectedErrorCode        |
      | AWS IAM      | attaching a policy with an invalid ARN format | InvalidInput             |
      | Amazon RDS   | describing instances with a malformed filter | InvalidParameterValue    |
      | API Gateway  | deploying an API with an invalid stage name   | BadRequestException      |
      | Amazon SQS   | sending a message with invalid attributes     | InvalidAttributeName     |
      | Amazon SES   | verifying an email identity with invalid characters | InvalidParameterValue    |