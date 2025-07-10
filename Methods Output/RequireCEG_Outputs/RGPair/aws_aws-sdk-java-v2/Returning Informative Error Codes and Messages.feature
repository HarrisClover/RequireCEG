Feature: Returning Informative Error Codes and Messages

  As a system user
  I want to receive informative error codes and messages when making requests
  So that I can understand and correct my requests

  Background:
    Given the system is running
    And the user has the necessary permissions

  Scenario: Scenario 1: Invalid input for SNS topics
    Given a user tries to list topics in Amazon SNS
    When the input format is invalid
    Then the system should return error code 400
    And the message should be 'Invalid input for SNS topics.'

  Scenario: Scenario 2: Queue not found in Amazon SQS
    Given a user attempts to list queues in Amazon SQS
    When the provided queue identifier does not exist
    Then the system should return error code 404
    And the message should be 'Queue not found: [QueueName].'

  Scenario: Scenario 3: Incorrect parameters for WorkSpaces
    Given a user queries for workspaces in Amazon WorkSpaces
    When the provided parameters are incorrect
    Then the system should return error code 422
    And the message should be 'Unprocessable entity: Incorrect parameters for WorkSpaces.'

  Scenario: Scenario 4: Invalid email format for SES
    Given a user requests email identities in Amazon SES
    When the provided email format is invalid
    Then the system should return error code 400
    And the message should be 'Invalid email format provided for SES.'

  Scenario: Scenario 5: Database instance not found in Amazon RDS
    Given a user tries to describe a database instance in Amazon RDS
    When the database identifier does not exist
    Then the system should return error code 404
    And the message should be 'Database instance not found: [DBInstanceIdentifier].'

  Scenario: Scenario 6: Access Denied due to unknown user identifier
    Given a user tries to perform an operation with AWS IAM
    When the user identifier is unknown
    Then the system should return error code 403
    And the message should be 'Access Denied: User identifier does not exist.'

  Scenario: Scenario 7: Validating SNS input format
    Given a user tries to list topics in Amazon SNS
    When the input format is valid
    Then the system should proceed without errors

  Scenario: Scenario 8: Validating SQS queue existence
    Given a user attempts to list queues in Amazon SQS
    When the provided queue identifier exists
    Then the system should proceed without errors

  Scenario: Scenario 9: Validating WorkSpaces parameters
    Given a user queries for workspaces in Amazon WorkSpaces
    When the provided parameters are correct
    Then the system should proceed without errors

  Scenario: Scenario 10: Validating SES email format
    Given a user requests email identities in Amazon SES
    When the provided email format is valid
    Then the system should proceed without errors

  Scenario: Scenario 11: Validating RDS database existence
    Given a user tries to describe a database instance in Amazon RDS
    When the database identifier exists
    Then the system should proceed without errors

  Scenario: Scenario 12: Validating IAM user identifier
    Given a user tries to perform an operation with AWS IAM
    When the user identifier is known
    Then the system should proceed without errors
