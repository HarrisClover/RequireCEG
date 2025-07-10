Feature: Error Scenarios for Non-Existent Resources

  As a user
  I want to receive proper error messages when accessing non-existent resources
  So that I can understand and correct my requests effectively

  Background:
    Given the user has access to various AWS services
    And the resources may or may not exist in the system

  Scenario: Scenario 1: Non-Existent SNS Topic
    Given the user attempts to list resources in Amazon SNS
    And the specified topic does not exist
    When the user makes the request for the topic
    Then the system should return an error code '404'
    And the message should be 'Topic not found.'

  Scenario: Scenario 2: Non-Existent WorkSpace
    Given the user tries to retrieve a workspace from Amazon WorkSpaces
    When the user provides an identifier for a workspace that does not exist
    Then the system should return an error code '404'
    And the message should be 'Workspace not found.'

  Scenario: Scenario 3: Invalid SQS Queue
    Given the user issues an API call for a queue in Amazon SQS
    When the user provides a queue name that is invalid or does not exist
    Then the system should respond with an error code '400'
    And the message should be 'Invalid queue name.'

  Scenario: Scenario 4: Non-Existent Email Identity in SES
    Given the user requests email identities in Amazon SES
    When the specified email identity does not exist
    Then the response should state error code '403'
    And the message should be 'Email identity does not exist.'

  Scenario: Scenario 5: Non-Existent RDS Database Instance
    Given the user attempts to describe an Amazon RDS database instance
    When the user uses an incorrect identifier for the database instance
    Then the system should return an error code '404'
    And the message should be 'Database instance not found.'

  Scenario: Scenario 6: Invalid Parameters in IAM or API Gateway
    Given the user performs an operation involving incorrect parameters within AWS IAM or API Gateway
    When the parameters do not meet expected formats or are deemed invalid
    Then the system must return an error code '422'
    And a detailed message explaining the specific parameter error encountered

  Scenario: Scenario 7: Non-Existent Resources Handling
    Given the user attempts to access a non-existent resource
    When the user makes requests for resources in SNS, WorkSpaces, or RDS that don't exist
    Then the system should return appropriate error codes and messages
    And the responses should be consistent with respective resource errors
