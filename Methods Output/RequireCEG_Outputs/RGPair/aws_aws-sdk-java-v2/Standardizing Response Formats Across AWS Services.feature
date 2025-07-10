Feature: Standardizing Response Formats Across AWS Services

  As a developer using AWS APIs
  I want to receive consistent and predictable responses from different AWS services
  So that I can integrate and handle responses efficiently across the various services

  Background:
    Given the need for uniformity in API responses across AWS services
    And the requirement for clear error reporting

  Scenario: Listing topics in Amazon SNS
    Given a user issues a request to list topics in Amazon SNS
    When the request is processed successfully
    Then the system responds with a standardized JSON format that includes an array of topic ARNs and their respective attributes
    And the structure of the response ensures consistency

  Scenario: Accessing a non-existent SQS queue
    Given a user attempts to access an SQS queue
    When the specified queue does not exist
    Then the system returns an error message formatted in a standardized way including an error code '404-QUEUE-NOT-FOUND'
    And the message states 'The specified SQS queue does not exist'

  Scenario: Providing incorrect parameters while interacting with AWS IAM
    Given a user provides incorrect parameters while interacting with AWS IAM
    When the system processes the request
    Then it issues a structured error response with error code '400-INVALID-PARAMETER' detailing the specific parameter issue
    And the response includes a description of what is wrong with the provided parameters

  Scenario: Describing a non-existent RDS database instance
    Given a user tries to describe an RDS database instance that does not exist
    When the system processes this request
    Then the system responds with an error message stating 'The specified RDS database instance does not exist'
    And the response includes an appropriate error code

  Scenario: Attempting to access an SQS queue that does not exist
    Given a user attempts to access an SQS queue
    When the specified queue does not exist
    Then the system returns an error message '404-QUEUE-NOT-FOUND' with a description stating 'The specified SQS queue does not exist.'
