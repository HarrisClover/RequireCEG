Feature: Validating Response Formats Against AWS Specifications

  As a system administrator
  I want to validate requests against AWS service specifications
  So that users receive clear and actionable feedback on their requests

  Background:
    Given that the user wants to interact with various AWS services
    And the system is operational and connected to AWS

  Scenario: Scenario 1: Validate Amazon SNS Topic Request
    Given a user requests a list of topics from Amazon SNS
    When the system validates the request format
    Then the system should return the list of topics
    And if the request format does not match the AWS SNS schema, display 'Topic not found.'

  Scenario: Scenario 2: Validate Amazon WorkSpaces Region
    Given a user specifies a region for Amazon WorkSpaces
    When the system checks the region parameter
    Then if the region is valid, the request is successful
    And if invalid, return 'Invalid region specified for Amazon WorkSpaces.'

  Scenario: Scenario 3: Validate AWS SQS Parameters
    Given a user requests specific SQS queue parameters
    When the system validates the parameters
    Then the system should confirm the parameters are correct
    And if incorrect, return 'Invalid parameters for SQS queue request.'

  Scenario: Scenario 4: Listing Amazon SES Email Identities
    Given a user requests to list email identities from Amazon SES
    When the system checks for registered identities
    Then if no identities are registered, the system should return an empty list
    And with the message 'No email identities found.'

  Scenario: Scenario 5: Validate AWS Storage Gateway Identifier
    Given a user requests gateways using an identifier
    When the system checks the identifier
    Then if the identifier is valid, the system provides gateway details
    And if invalid, respond with 'Gateway identifier does not exist.'

  Scenario: Scenario 6: Error Handling for AWS IAM
    Given the user requests access to an IAM role
    When the system validates the role identifier
    Then if valid, return role details
    And if invalid, return 'IAM role not found.'

  Scenario: Scenario 7: Error Handling for Amazon RDS
    Given the user queries an RDS instance
    When the system validates the instance identifier
    Then if valid, return instance details
    And if invalid, return 'RDS instance does not exist.'

  Scenario: Scenario 8: Handling Non-existent IAM Role
    Given the user submits a request for an IAM role that does not exist
    When the system validates the role identifier
    Then the system should respond with an error message
    And the message should be 'IAM role not found.'

  Scenario: Scenario 9: Unrecognized Gateway Identifier
    Given the user requests a gateway using an unrecognized identifier
    When the system checks the identifier
    Then the system should return an error response
    And with the message 'Gateway identifier does not exist.'
