Feature: Integrating with AWS Services

  As a cloud resource manager
  I want to integrate with various AWS services for resource management
  So that I can efficiently retrieve and manage cloud resources

  Background:
    Given the system supports integration with AWS services
    And the user can issue API calls

  Scenario: Scenario 1: List SNS Topics
    Given the user is authenticated
    When the user requests to list available SNS topics
    Then the system should return a list of SNS topics
    And the response format should match the SNS service specifications

  Scenario: Scenario 2: List SQS Queues
    Given the user is authenticated
    When the user requests to list SQS queues
    Then the system should return a list of SQS queues
    And the response format should match the SQS service specifications

  Scenario Outline: Scenario Outline: Handle Error Scenarios
    Given the user requests a resource with ID "<resource-id>"
    When the resource does not exist
    Then the system should return an error code "<error-code>"
    And the error message should be "<error-message>"
    Examples:
      | resource-id | error-code | error-message |
      | non-existent-queue | 404 | Queue not found |
      | invalid-db-instance | 400 | Invalid database instance identifier |
      | unknown-topic | 404 | Topic not found |


  Scenario: Scenario 3: Authentication Error Handling
    Given the user is not authenticated
    When the user requests to list available SNS topics
    Then the system should return an error code "401"
    And the error message should be "Unauthorized access"

  Scenario: Scenario 4: Valid Request Handling for SNS
    Given the user is authenticated
    When the user requests to retrieve a valid SNS topic with ID "existing-topic"
    Then the system should return the SNS topic details
    And the response format should match the SNS service specifications

  Scenario: Scenario 5: Valid Request Handling for SQS
    Given the user is authenticated
    When the user requests to retrieve a valid SQS queue with ID "existing-queue"
    Then the system should return the SQS queue details
    And the response format should match the SQS service specifications
