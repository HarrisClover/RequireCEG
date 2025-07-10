Feature: Error Scenarios for Incorrect Parameters and Identifiers

  As a developer
  I want to ensure the system responds appropriately to API calls with invalid parameters or identifiers
  So that I can handle errors effectively and provide accurate feedback to users

  Background:
    Given the system is integrated with AWS services
    And the API is set up to handle requests with various parameters

  Scenario: Invalid Region for SNS Topics
    Given an API call is made to list SNS topics
    And a region that does not exist in AWS is provided
    When the request is processed
    Then the response should include error code 'InvalidRegion'
    And the message should be 'The specified AWS region is invalid for listing SNS topics.'

  Scenario: Queue Not Found for SQS
    Given an API call is made to retrieve an SQS queue
    When the specified queue cannot be found
    Then the response should include error code 'QueueNotFound'
    And the message should be 'The specified SQS queue does not exist.'

  Scenario: DB Instance Not Found in RDS
    Given an API call is made to describe a database instance
    When the provided DB identifier cannot be located
    Then the response should include error code 'DBInstanceNotFound'
    And the message should be 'No DB instance found with the provided identifier.'

  Scenario: Invalid Parameters for IAM Roles
    Given an API call is made with incorrect IAM role parameters
    When the request is processed
    Then the response should include error code 'InvalidParameter'
    And the message should be 'One or more parameters are invalid.'

  Scenario: Resource Not Found in API Gateway
    Given an API call is made with a resource identifier
    When the identifier does not correspond to any existing resources
    Then the response should include error code 'ResourceNotFound'
    And the message should be 'The specified resource does not exist in the API Gateway.'

  Scenario: Invalid IAM Role Parameters
    Given an API call is made with one or more invalid parameters for IAM roles
    When the request is processed
    Then the response should include error code 'InvalidParameter'
    And the message should be 'One or more parameters are invalid.'

  Scenario: Invalid Region and Queue Not Found
    Given an API call is made to retrieve SNS topics and an SQS queue
    When the region does not exist in AWS and the queue cannot be found
    Then the response should include error code 'InvalidRegion'
    And the message should be 'The specified AWS region is invalid for listing SNS topics.'
    And the response should include error code 'QueueNotFound'
    And the message should be 'The specified SQS queue does not exist.'
